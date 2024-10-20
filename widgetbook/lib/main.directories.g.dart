// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_import, prefer_relative_imports, directives_ordering

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AppGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:widgetbook/widgetbook.dart' as _i1;
import 'package:widgetbook_workspace/custom_button.dart' as _i2;
import 'package:widgetbook_workspace/login_screen.dart' as _i5;
import 'package:widgetbook_workspace/password_screen.dart' as _i3;
import 'package:widgetbook_workspace/social_login_button.dart' as _i4;

final directories = <_i1.WidgetbookNode>[
  _i1.WidgetbookFolder(
    name: 'components',
    children: [
      _i1.WidgetbookComponent(
        name: 'CustomButton',
        useCases: [
          _i1.WidgetbookUseCase(
            name: 'Disabled',
            builder: _i2.disabledButton,
          ),
          _i1.WidgetbookUseCase(
            name: 'Enabled',
            builder: _i2.enabledButton,
          ),
        ],
      )
    ],
  ),
  _i1.WidgetbookFolder(
    name: 'presentation',
    children: [
      _i1.WidgetbookFolder(
        name: 'screens',
        children: [
          _i1.WidgetbookLeafComponent(
            name: 'PasswordScreen',
            useCase: _i1.WidgetbookUseCase(
              name: 'Password Screen - Default',
              builder: _i3.passwordScreenDefault,
            ),
          )
        ],
      ),
      _i1.WidgetbookFolder(
        name: 'widgets',
        children: [
          _i1.WidgetbookLeafComponent(
            name: 'FormWidgets',
            useCase: _i1.WidgetbookUseCase(
              name: 'Social Login Buttons - Default',
              builder: _i4.defaultSocialLoginButtons,
            ),
          )
        ],
      ),
    ],
  ),
  _i1.WidgetbookFolder(
    name: 'widgetbook',
    children: [
      _i1.WidgetbookLeafComponent(
        name: 'LoginScreenWidget',
        useCase: _i1.WidgetbookUseCase(
          name: 'Login Screen - Default',
          builder: _i5.loginScreenDefault,
        ),
      )
    ],
  ),
];
