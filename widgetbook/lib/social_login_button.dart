import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:aladia_login/presentation/widgets/form_widgets.dart'; // Import your FormWidgets class

@widgetbook.UseCase(
  name: 'Social Login Buttons - Default',
  type: FormWidgets,
)
Widget defaultSocialLoginButtons(BuildContext context) {
  return FormWidgets.socialLoginButtons();
}
