import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:aladia_login/data/repositories/auth_repository.dart';
import 'package:aladia_login/domain/usecases/check_user_existence_usecase.dart';
import 'package:aladia_login/data/models/user_model.dart';

import 'check_user_existence_test.mocks.dart'; // The generated mock file

void main() {
  late CheckUserExistenceUseCase useCase;
  late MockAuthRepository mockAuthRepository;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    useCase = CheckUserExistenceUseCase(mockAuthRepository);
  });

  group('CheckUserExistenceUseCase', () {
    final String email = 'test@example.com';
    final UserModel mockUser = UserModel(exists: true, password: true, verified: false);

    test('should return UserModel when the user exists', () async {
      // Arrange: Mock the AuthRepository to return a UserModel when the method is called
      when(mockAuthRepository.checkUserExistence(email))
          .thenAnswer((_) async => mockUser);

      // Act: Call the use case
      final result = await useCase.call(email);

      // Assert: Verify that the repository method was called and the result matches the expected output
      expect(result, mockUser);
      verify(mockAuthRepository.checkUserExistence(email)).called(1);
    });

    test('should throw an exception when the repository throws an exception', () async {
      // Arrange: Mock the repository to throw an exception
      when(mockAuthRepository.checkUserExistence(email))
          .thenThrow(Exception('Failed to check user existence'));

      // Act & Assert: Verify that the exception is thrown
      expect(() => useCase.call(email), throwsException);
    });
  });
}
