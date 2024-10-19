import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart'; 
import 'presentation/screens/splash_screen.dart'; // Import Splash Screen
import 'presentation/screens/login_screen.dart';
import 'presentation/screens/password_screen.dart';

void main() {
  runApp(
    MaterialApp(
      home: Widgetbook(
        directories: [
          WidgetbookCategory(
            name: 'Screens',
            children: [
              WidgetbookFolder(
                name: 'Auth',
                children: [
                  WidgetbookComponent(
                    name: 'Login Screen',
                    useCases: [
                      WidgetbookUseCase(
                        name: 'Default',
                        builder: (context) => LoginScreen(), // Preview Login Screen
                      ),
                    ],
                  ),
                  WidgetbookComponent(
                    name: 'Password Screen',
                    useCases: [
                      WidgetbookUseCase(
                        name: 'Default',
                        builder: (context) => PasswordScreen(email: 'test@example.com'), // Preview Password Screen
                      ),
                    ],
                  ),
                ],
              ),
              WidgetbookComponent(
                name: 'Splash Screen',
                useCases: [
                  WidgetbookUseCase(
                    name: 'Default',
                    builder: (context) => const SplashScreen(), // Preview Splash Screen
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
