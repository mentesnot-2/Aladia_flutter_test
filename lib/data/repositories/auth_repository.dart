import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/user_model.dart';

abstract class AuthRepository {
  Future<UserModel> checkUserExistence(String email);
  Future<String> login(String email, String password); // New method for login
}

class AuthRepositoryImpl implements AuthRepository {
  final http.Client client;

  AuthRepositoryImpl({required this.client});

  @override
  Future<UserModel> checkUserExistence(String email) async {
    final url = Uri.parse('https://dev-api.aladia.io/v2/auth/user-existence');
    final response = await client.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email}),
    );

    if (response.statusCode == 200) {
      return UserModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to check user existence');
    }
  }

  @override
  Future<String> login(String email, String password) async {
    final url = Uri.parse('https://dev-api.aladia.io/v2/auth/login');
    final response = await client.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': password}),
    );

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      return jsonResponse['accessToken']; // Return the access token
    } else {
      throw Exception('Invalid email or password');
    }
  }
}

