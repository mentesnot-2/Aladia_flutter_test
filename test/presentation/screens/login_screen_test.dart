import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:aladia_login/presentation/blocs/auth_bloc.dart';
import 'package:aladia_login/presentation/screens/login_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthBloc extends MockBloc<AuthEvent, AuthState> implements AuthBloc {}

void main() {
  late MockAuthBloc mockAuthBloc;

  setUp(() {
    mockAuthBloc = MockAuthBloc();
  });

  tearDown(() {
    mockAuthBloc.close();
  });

  Widget createWidgetUnderTest() {
    return BlocProvider<AuthBloc>(
      create: (_) => mockAuthBloc,
      child: MaterialApp(
        home: LoginScreen(),
      ),
    );
  }

  group('LoginScreen', () {
    testWidgets('should render initial UI', (WidgetTester tester) async {
      when(() => mockAuthBloc.state).thenReturn(AuthInitial());

      await tester.pumpWidget(createWidgetUnderTest());

      // Verify that the email input and button are displayed
      expect(find.text('Enter your email'), findsOneWidget);
      expect(find.byType(TextField), findsOneWidget);
      expect(find.text('Enter'), findsOneWidget);
    });

    testWidgets('should show CircularProgressIndicator when loading', (WidgetTester tester) async {
      when(() => mockAuthBloc.state).thenReturn(AuthLoading());

      await tester.pumpWidget(createWidgetUnderTest());

      // Verify that the loading indicator is displayed
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('should show error message when AuthFailure state', (WidgetTester tester) async {
      const errorMessage = 'Invalid credentials';
      when(() => mockAuthBloc.state).thenReturn(AuthFailure(errorMessage));

      await tester.pumpWidget(createWidgetUnderTest());

      // Verify that the error message is displayed
      expect(find.text(errorMessage), findsOneWidget);
    });


    testWidgets('should show snackBar on invalid email', (WidgetTester tester) async {
      when(() => mockAuthBloc.state).thenReturn(AuthInitial());

      await tester.pumpWidget(createWidgetUnderTest());

      const invalidEmail = 'invalidemail';

      // Enter invalid email
      await tester.enterText(find.byType(TextField), invalidEmail);
      await tester.pump();

      // Tap the 'Enter' button
      await tester.tap(find.text('Enter'));
      await tester.pump();

      // Verify that the SnackBar is displayed with the error message
      expect(find.text('Invalid email address'), findsOneWidget);
    });

  });
}
