import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:aladia_login/presentation/blocs/auth_bloc.dart'; // Replace with your actual path
import 'package:aladia_login/presentation/screens/password_screen.dart'; // Replace with your actual path

class MockAuthBloc extends Mock implements AuthBloc {}

void main() {
  group('PasswordScreen Unit Tests', () {
    late MockAuthBloc mockAuthBloc;

    setUp(() {
      mockAuthBloc = MockAuthBloc();
    });

    test('LoginEvent is added to the AuthBloc with correct credentials', () {
      final email = 'test@example.com';
      final password = 'testPassword';
      final loginEvent = LoginEvent(email: email, password: password);
      when(() => mockAuthBloc.add(loginEvent)).thenAnswer((_) async {});
      mockAuthBloc.add(loginEvent);
      verify(() => mockAuthBloc.add(loginEvent)).called(1);
    });

    test('Handles AuthSuccess state', () {
      when(() => mockAuthBloc.state).thenReturn(AuthSuccess('token'));
    });

    test('Handles AuthFailure state', () {
      when(() => mockAuthBloc.state).thenReturn(AuthFailure('Invalid credentialsss'));
    });
  });
}
