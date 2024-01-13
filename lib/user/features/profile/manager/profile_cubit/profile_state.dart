part of 'profile_cubit.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class GetUserDataSuccessfully extends ProfileState {}

class ChangeProfileImageLoading extends ProfileState {}

class ChangeProfileImageSuccessfully extends ProfileState {}
