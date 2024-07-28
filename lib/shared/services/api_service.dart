import 'dart:io';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:http/http.dart' as http;

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class ApiServices {
// This is an HTTP GET request to fetch the comments
  Future<http.Response> getCommentsRequest(String apiUrl,
      [Map<String, String> queryParams = const {}]) async {
    http.Response response =
        http.Response('', HttpStatus.connectionClosedWithoutResponse);
    try {
      var uri = Uri.parse(apiUrl).replace(queryParameters: queryParams);

      response = await http.get(
        uri,
        headers: {'Content-Type': 'application/json'},
      ).timeout(const Duration(seconds: 15));

      // Handle different status codes if necessary
      if (response.statusCode != 200) {
        // Handle unexpected status codes
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (exception, stackTrace) {
      FirebaseCrashlytics.instance.recordError(exception, stackTrace);
      throw Exception('Failed  $exception');
    }

    return response;
  }
}
