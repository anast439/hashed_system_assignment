import '../core/api_client.dart';

class AuthService {
  Future<Map<String, dynamic>> login(String email, String password) async {
    final body = {
      "email": email,
      "password": password,
      "device_id": "dcndjc89",
    };

    return await ApiClient.postRequest("login/", body);
  }
}
