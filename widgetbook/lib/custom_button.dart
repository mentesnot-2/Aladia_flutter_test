import "package:aladia_login/components/custom_button.dart";
import "package:aladia_login/components/social_login_button.dart";


import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

// Import the widget from your app

@widgetbook.UseCase(
  name: 'Enabled',
  type: CustomButton,
)
CustomButton enabledButton(BuildContext context) {
  return CustomButton(
    title: 'Enabled',
    onPressed: () {},
  );
}

@widgetbook.UseCase(
  name: 'Disabled',
  type: CustomButton,
)
CustomButton disabledButton(BuildContext context) {
  return const CustomButton(
    title: 'Disabled',
  );
}
