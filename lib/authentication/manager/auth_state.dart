part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class ChangeObscure extends AuthState {}

class ClearAllTextFormFields extends AuthState {}
