import 'package:flutter_test/flutter_test.dart';
import 'package:aladia_login/core/utils/validators.dart'; 

void main() {
  group('Email Validation', () {
    test('should return error when email is null', () {
      String? result = Validators.validateEmail(null);
      expect(result, 'Email cannot be empty');
    });

    test('should return error when email is empty', () {
      String? result = Validators.validateEmail('');
      expect(result, 'Email cannot be empty');
    });

    test('should return error when email is invalid', () {
      String? result = Validators.validateEmail('invalid_email');
      expect(result, 'Enter a valid email address');
    });

    test('should return null when email is valid', () {
      String? result = Validators.validateEmail('test@example.com');
      expect(result, null);
    });
  });

  group('Password Validation', () {
    test('should return error when password is null', () {
      String? result = Validators.validatePassword(null);
      expect(result, 'Password cannot be empty');
    });

    test('should return error when password is empty', () {
      String? result = Validators.validatePassword('');
      expect(result, 'Password cannot be empty');
    });

    test('should return null when password is valid', () {
      String? result = Validators.validatePassword('validPassword');
      expect(result, null);
    });
  });
}
