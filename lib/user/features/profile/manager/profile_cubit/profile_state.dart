part of 'profile_cubit.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class GetUserDataSuccessfully extends ProfileState {}

class ChangeProfileImageLoading extends ProfileState {}

class ChangeProfileImageSuccessfully extends ProfileState {}
class ChangeDataLoading extends ProfileState {}
class ChangeData extends ProfileState {}
class Logout extends ProfileState {}
