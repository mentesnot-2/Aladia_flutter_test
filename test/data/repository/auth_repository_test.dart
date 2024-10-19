// test/data/repository/auth_repository_test.dart
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:aladia_login/data/repositories/auth_repository.dart';
import 'package:aladia_login/data/models/user_model.dart';  

import 'auth_repository_test.mocks.dart'; // Import the generated mocks

void main() {
  late AuthRepositoryImpl authRepository;
  late MockClient mockClient;

  setUp(() {
    mockClient = MockClient();
    authRepository = AuthRepositoryImpl(client: mockClient);
  });

  group('AuthRepository', () {
    final String testEmail = 'test@example.com';
    final String testPassword = 'password123';

    test('checkUserExistence returns UserModel if the call completes successfully', () async {
      final responseJson = {
        'exists': true,
        'password': true,
        'verified': false,
      };

      when(mockClient.post(
        Uri.parse('https://dev-api.aladia.io/v2/auth/user-existence'),
        headers: anyNamed('headers'),
        body: anyNamed('body'),
      )).thenAnswer((_) async => http.Response(jsonEncode(responseJson), 200));

      final result = await authRepository.checkUserExistence(testEmail);

      expect(result, isA<UserModel>());
      expect(result.exists, true);
      expect(result.password, true);
      expect(result.verified, false);
    });

    test('checkUserExistence throws exception when the status code is not 200', () async {
      when(mockClient.post(
        Uri.parse('https://dev-api.aladia.io/v2/auth/user-existence'),
        headers: anyNamed('headers'),
        body: anyNamed('body'),
      )).thenAnswer((_) async => http.Response('Error', 400));

      expect(() => authRepository.checkUserExistence(testEmail), throwsException);
    });

    test('login returns accessToken if the call completes successfully', () async {
      final responseJson = {
        'accessToken': 'dummy_access_token',
      };

      when(mockClient.post(
        Uri.parse('https://dev-api.aladia.io/v2/auth/login'),
        headers: anyNamed('headers'),
        body: anyNamed('body'),
      )).thenAnswer((_) async => http.Response(jsonEncode(responseJson), 200));

      final result = await authRepository.login(testEmail, testPassword);

      expect(result, 'dummy_access_token');
    });

    test('login throws exception when email or password is incorrect', () async {
      when(mockClient.post(
        Uri.parse('https://dev-api.aladia.io/v2/auth/login'),
        headers: anyNamed('headers'),
        body: anyNamed('body'),
      )).thenAnswer((_) async => http.Response('Invalid credentials', 401));

      expect(() => authRepository.login(testEmail, testPassword), throwsException);
    });
  });
}
