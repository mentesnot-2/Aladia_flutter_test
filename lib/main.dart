import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'data/repositories/auth_repository.dart';
import 'domain/usecases/check_user_existence_usecase.dart';
import 'presentation/blocs/auth_bloc.dart';
import 'presentation/screens/splash_screen.dart'; // Import Splash Screen
import 'presentation/screens/login_screen.dart';
import 'presentation/screens/password_screen.dart';
import 'package:http/http.dart' as http;
import 'domain/usecases/login_usecase.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) => AuthBloc(
            CheckUserExistenceUseCase(
              AuthRepositoryImpl(
                client: http.Client(),
              ),
            ),
            LoginUseCase(
              AuthRepositoryImpl(
                client: http.Client(),
              ),
            ),
          ),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/splash',
        onGenerateRoute: (settings) {
          if (settings.name == '/password') {
            final email = settings.arguments as String; // Extract the email argument
            return MaterialPageRoute(
              builder: (context) {
                return PasswordScreen(email: email); // Pass the email to PasswordScreen
              },
            );
          }

          // Default route definitions
          return MaterialPageRoute(
            builder: (context) {
              switch (settings.name) {
                case '/splash':
                  return SplashScreen();
                case '/':
                  return LoginScreen();
                default:
                  return LoginScreen();
              }
            },
          );
        },
      ),

    );
  }
}
