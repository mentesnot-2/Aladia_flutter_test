// Mocks generated by Mockito 5.4.4 from annotations
// in aladia_login/test/domain/check_user_existence_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:aladia_login/data/models/user_model.dart' as _i2;
import 'package:aladia_login/data/repositories/auth_repository.dart' as _i3;
import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i5;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeUserModel_0 extends _i1.SmartFake implements _i2.UserModel {
  _FakeUserModel_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [AuthRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockAuthRepository extends _i1.Mock implements _i3.AuthRepository {
  MockAuthRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.UserModel> checkUserExistence(String? email) =>
      (super.noSuchMethod(
        Invocation.method(
          #checkUserExistence,
          [email],
        ),
        returnValue: _i4.Future<_i2.UserModel>.value(_FakeUserModel_0(
          this,
          Invocation.method(
            #checkUserExistence,
            [email],
          ),
        )),
      ) as _i4.Future<_i2.UserModel>);

  @override
  _i4.Future<String> login(
    String? email,
    String? password,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #login,
          [
            email,
            password,
          ],
        ),
        returnValue: _i4.Future<String>.value(_i5.dummyValue<String>(
          this,
          Invocation.method(
            #login,
            [
              email,
              password,
            ],
          ),
        )),
      ) as _i4.Future<String>);
}
