// Mocks generated by Mockito 5.4.5 from annotations
// in profile_hub/test/features/users/presentation/providers/user_provider_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i7;

import 'package:dio/dio.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i6;
import 'package:profile_hub/features/users/data/models/created_user_model.dart'
    as _i4;
import 'package:profile_hub/features/users/data/models/user_model.dart' as _i3;
import 'package:profile_hub/features/users/data/services/user_service.dart'
    as _i5;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: must_be_immutable
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeDio_0 extends _i1.SmartFake implements _i2.Dio {
  _FakeDio_0(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

class _FakePaginatedUsersResponse_1 extends _i1.SmartFake
    implements _i3.PaginatedUsersResponse {
  _FakePaginatedUsersResponse_1(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

class _FakeUserModel_2 extends _i1.SmartFake implements _i3.UserModel {
  _FakeUserModel_2(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

class _FakeCreatedUserModel_3 extends _i1.SmartFake
    implements _i4.CreatedUserModel {
  _FakeCreatedUserModel_3(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

/// A class which mocks [UserService].
///
/// See the documentation for Mockito's code generation for more information.
class MockUserService extends _i1.Mock implements _i5.UserService {
  MockUserService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.Dio get dio =>
      (super.noSuchMethod(
            Invocation.getter(#dio),
            returnValue: _FakeDio_0(this, Invocation.getter(#dio)),
          )
          as _i2.Dio);

  @override
  set dio(_i2.Dio? _dio) => super.noSuchMethod(
    Invocation.setter(#dio, _dio),
    returnValueForMissingStub: null,
  );

  @override
  String get baseUrl =>
      (super.noSuchMethod(
            Invocation.getter(#baseUrl),
            returnValue: _i6.dummyValue<String>(
              this,
              Invocation.getter(#baseUrl),
            ),
          )
          as String);

  @override
  _i7.Future<_i3.PaginatedUsersResponse> getUsers({int? page = 1}) =>
      (super.noSuchMethod(
            Invocation.method(#getUsers, [], {#page: page}),
            returnValue: _i7.Future<_i3.PaginatedUsersResponse>.value(
              _FakePaginatedUsersResponse_1(
                this,
                Invocation.method(#getUsers, [], {#page: page}),
              ),
            ),
          )
          as _i7.Future<_i3.PaginatedUsersResponse>);

  @override
  _i7.Future<_i3.UserModel> getUserById(int? id) =>
      (super.noSuchMethod(
            Invocation.method(#getUserById, [id]),
            returnValue: _i7.Future<_i3.UserModel>.value(
              _FakeUserModel_2(this, Invocation.method(#getUserById, [id])),
            ),
          )
          as _i7.Future<_i3.UserModel>);

  @override
  _i7.Future<_i4.CreatedUserModel> createUser({
    required String? name,
    required String? job,
  }) =>
      (super.noSuchMethod(
            Invocation.method(#createUser, [], {#name: name, #job: job}),
            returnValue: _i7.Future<_i4.CreatedUserModel>.value(
              _FakeCreatedUserModel_3(
                this,
                Invocation.method(#createUser, [], {#name: name, #job: job}),
              ),
            ),
          )
          as _i7.Future<_i4.CreatedUserModel>);
}
