import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:aladia_login/data/repositories/auth_repository.dart';
import 'package:aladia_login/domain/usecases/login_usecase.dart';

import 'login_use_case_test.mocks.dart'; // The generated mock file

void main() {
  late LoginUseCase loginUseCase;
  late MockAuthRepository mockAuthRepository;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    loginUseCase = LoginUseCase(mockAuthRepository);
  });

  group('LoginUseCase', () {
    final String email = 'test@example.com';
    final String password = 'password123';
    final String token = 'mockedAccessToken';

    test('should return access token when login is successful', () async {
      // Arrange: Mock the repository to return a token
      when(mockAuthRepository.login(email, password))
          .thenAnswer((_) async => token);

      // Act: Call the use case
      final result = await loginUseCase.call(email, password);

      // Assert: Verify that the repository method was called and the result matches the expected output
      expect(result, token);
      verify(mockAuthRepository.login(email, password)).called(1);
    });

    test('should throw an exception when login fails', () async {
      // Arrange: Mock the repository to throw an exception
      when(mockAuthRepository.login(email, password))
          .thenThrow(Exception('Invalid email or password'));

      // Act & Assert: Verify that an exception is thrown
      expect(() => loginUseCase.call(email, password), throwsException);
    });
  });
}
