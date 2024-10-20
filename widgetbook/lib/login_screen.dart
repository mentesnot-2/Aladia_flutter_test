import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:aladia_login/widgetbook/login_screen_wigetbook.dart';

@widgetbook.UseCase(
  name: 'Login Screen - Default',
  type: LoginScreenWidget,
)
Widget loginScreenDefault(BuildContext context) {
  return const LoginScreenWidget();
}
