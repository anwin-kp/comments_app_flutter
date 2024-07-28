import 'dart:convert';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';

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

  Future<void> clearComments() async {
    _comments.clear();
    notifyListeners();
  }

  Future<void> fetchComments() async {
    setIsLoading(true);

    try {
      final apiServices = ApiServices();
      final response =
          await apiServices.getCommentsRequest(Constants.kCommentsUrl);

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        _comments.clear();
        _comments
            .addAll(data.map((json) => CommentsModel.fromJson(json)).toList());
      } else {
        // Handle non-200 status codes
        throw Exception('Failed to load comments: ${response.statusCode}');
      }
    } catch (exception, stackTrace) {
      FirebaseCrashlytics.instance.recordError(exception, stackTrace);
      // Optionally show an error message to the user
    } finally {
      setIsLoading(false);
    }
  }

  void addComment(CommentsModel comment) {
    _comments.add(comment);
    notifyListeners();
  }

  void removeComment(CommentsModel comment) {
    _comments.remove(comment);
    notifyListeners();
  }
}
