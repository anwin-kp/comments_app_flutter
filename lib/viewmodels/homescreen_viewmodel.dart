import 'dart:convert';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/foundation.dart';

import '../models/comments_model.dart';
import '../models/user_model.dart';
import '../shared/constants/constants.dart';
import '../shared/services/api_service.dart';

class HomeViewModel extends ChangeNotifier {
  bool _isLoading = false;
  final User _user = User(
    email: "",
    name: "",
  );
  late bool _showFullEmail = false;
  User get user => _user;
  bool get isLoading => _isLoading;

  void setIsLoading(bool isLoading) {
    _isLoading = isLoading;
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
        'showFullEmail': false,
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
}
