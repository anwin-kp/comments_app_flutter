import 'dart:convert';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';

import '../models/comments_model.dart';
import '../models/user_model.dart' as usermodel;
import '../shared/constants/constants.dart';
import '../shared/services/api_service.dart';

class HomeViewModel extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;
  bool _isLoading = false;
  String? _uploadError;
  final usermodel.User _user = usermodel.User(
    email: "",
    name: "",
  );
  File? _selectedImage;
  late bool _showFullEmail = true;
  String? get uploadError => _uploadError;
  usermodel.User get user => _user;
  bool get isLoading => _isLoading;
  File? get selectedImage => _selectedImage;

  void setIsLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  void _setUploadError(String? error) {
    _uploadError = error;
    notifyListeners();
  }

  void updateUser(String name, String email) {
    _user.name = name;
    _user.email = email;
    notifyListeners();
  }

  final List<CommentsModel> _comments = [];
  List<CommentsModel> get comments => _comments;

  Future<void> initializeRemoteConfig() async {
    final remoteConfig = FirebaseRemoteConfig.instance;
    if (kDebugMode) {
      print("initializeRemoteConfig Done ");
    }
    try {
      await remoteConfig.setDefaults(<String, dynamic>{
        'showFullEmail': true,
      });

      await remoteConfig.fetchAndActivate();

      // Prioritize fetched value over default
      _showFullEmail = remoteConfig.getBool('showFullEmail');
      if (kDebugMode) {
        print("showFullEmail : $_showFullEmail");
      }
      notifyListeners();
    } catch (e) {
      FirebaseCrashlytics.instance.recordError(e, null);
    }
  }

  String _getMaskedEmail(String email) {
    if (_showFullEmail) {
      return email;
    } else {
      int atIndex = email.indexOf('@');
      if (atIndex > 3) {
        return '${email.substring(0, 3)}****${email.substring(atIndex)}';
      } else {
        return '${email.substring(0, atIndex)}****${email.substring(atIndex)}';
      }
    }
  }

  Future<void> clearComments() async {
    _comments.clear();
    notifyListeners();
  }

  Future<void> fetchComments() async {
    setIsLoading(true);

    try {
      await initializeRemoteConfig();

      final apiServices = ApiServices();
      final response =
          await apiServices.getCommentsRequest(Constants.kCommentsUrl);

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        _comments.clear();
        _comments.addAll(data.map((json) {
          final comment = CommentsModel.fromJson(json);
          return CommentsModel(
            postId: comment.postId,
            id: comment.id,
            name: comment.name,
            email: _getMaskedEmail(comment.email!),
            body: comment.body,
          );
        }).toList());
      } else {
        // Handle non-200 status codes
        throw Exception('Failed to load comments: ${response.statusCode}');
      }
    } catch (exception, stackTrace) {
      FirebaseCrashlytics.instance.recordError(exception, stackTrace);
      // Optionally show an error message to the user
    } finally {
      notifyListeners();
      setIsLoading(false);
    }
  }

  // Image Picking Method
  Future<void> pickImage() async {
    try {
      final pickedFile = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        maxWidth: 1024, // Optimize image size
        maxHeight: 1024,
        imageQuality: 85,
      );

      if (pickedFile != null) {
        _selectedImage = File(pickedFile.path);
        _setUploadError(null); // Clear any previous errors
        notifyListeners();
      }
    } catch (e) {
      _setUploadError('Failed to pick image: $e');
      FirebaseCrashlytics.instance.recordError(e, null);
    }
  }

  Future<String?> uploadImageToFirebase() async {
    if (_selectedImage == null) return null;

    try {
      // Check if user is authenticated
      if (_auth.currentUser == null) {
        throw Exception('User must be authenticated to upload files');
      }

      // Create a unique file name
      String fileName = 'upload_${DateTime.now().millisecondsSinceEpoch}.jpg';
      String userId = _auth.currentUser!.uid;

      // Reference to user-specific folder
      final storageRef =
          _storage.ref().child('uploads').child(userId).child(fileName);

      // Set metadata
      final metadata = SettableMetadata(
        contentType: 'image/jpeg',
        customMetadata: {
          'userId': userId,
          'uploadedAt': DateTime.now().toIso8601String(),
        },
      );

      // Upload with metadata
      final uploadTask = storageRef.putFile(_selectedImage!, metadata);

      // Listen to upload progress (optional)
      uploadTask.snapshotEvents.listen((TaskSnapshot snapshot) {
        double progress = snapshot.bytesTransferred / snapshot.totalBytes;
        if (kDebugMode) {
          print('Upload progress: ${(progress * 100).toStringAsFixed(2)}%');
        }
      });

      // Wait for upload to complete
      final snapshot = await uploadTask;

      // Get download URL
      final downloadUrl = await snapshot.ref.getDownloadURL();

      _setUploadError(null);
      return downloadUrl;
    } catch (e, stackTrace) {
      // Handle specific error types
      String errorMessage;
      if (e is FirebaseException) {
        switch (e.code) {
          case 'unauthorized':
          case 'permission-denied':
            errorMessage =
                'Permission denied. Please check if you are logged in.';
            break;
          case 'canceled':
            errorMessage = 'Upload was canceled.';
            break;
          default:
            errorMessage = 'Upload failed: ${e.message}';
        }
      } else {
        errorMessage = 'Upload failed: $e';
      }

      _setUploadError(errorMessage);
      FirebaseCrashlytics.instance.recordError(e, stackTrace);
      return null;
    }
  }

  Future<void> clearSelectedImage() async {
    _selectedImage = null;
    _setUploadError(null);
    notifyListeners();
  }
}
