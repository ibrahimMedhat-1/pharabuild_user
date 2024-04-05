part of 'doctor_edit_profile_cubit.dart';

@immutable
abstract class DoctorEditProfileState {}

class DoctorEditProfileInitial extends DoctorEditProfileState {}

class ChangeSpeciality extends DoctorEditProfileState {}

class ChangeProfilePicture extends DoctorEditProfileState {}
class UploadPortfolioImages extends DoctorEditProfileState {}
class GetPortfolioImages extends DoctorEditProfileState {}
class SaveLoading extends DoctorEditProfileState {}
class SaveSuccess extends DoctorEditProfileState {}
class UploadPortfolioImagesLoading extends DoctorEditProfileState {}
