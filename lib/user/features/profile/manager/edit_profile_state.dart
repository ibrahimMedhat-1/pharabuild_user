part of 'edit_profile_cubit.dart';

@immutable
abstract class EditProfileState {}

class EditProfileInitial extends EditProfileState {}

class ChangeProfileImageLoading extends EditProfileState {}

class ChangeProfileImageSuccessfully extends EditProfileState {}

class ChangeProfileImageError extends EditProfileState {}
