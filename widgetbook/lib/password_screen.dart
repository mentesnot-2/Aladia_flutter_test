import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:aladia_login/presentation/screens/password_screen.dart'; 

@widgetbook.UseCase(
  name: 'Password Screen - Default',
  type: PasswordScreen,
)
Widget passwordScreenDefault(BuildContext context) {
  // Provide a sample email for the PasswordScreen
  return PasswordScreen(email: 'test@example.com');
}