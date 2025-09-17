import 'dart:io';
import 'dart:async';
import '../core/api_client.dart';

class AuthService {
  Future<Map<String, dynamic>> login(String email, String password) async {
    final body = {
      "email": email,
      "password": password,
      "device_id": "dcndjc89",
    };

    try {
      final response = await ApiClient.postRequest(
        "login/",
        body,
      ).timeout(const Duration(seconds: 10));

      return response;
    } on SocketException {
      throw Exception(
        "Unable to connect. Please check your internet connection or server.",
      );
    } on TimeoutException {
      throw Exception("Request timed out. Please try again.");
    } catch (e) {
      throw Exception("Login failed: $e");
    }
  }
}
