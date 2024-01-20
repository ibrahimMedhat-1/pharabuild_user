part of 'doctor_home_cubit.dart';

@immutable
abstract class DoctorHomeState {}

class DoctorHomeInitial extends DoctorHomeState {}

class IsSearchingForUser extends DoctorHomeState {}

class IsNotSearchingForUser extends DoctorHomeState {}

class GetAllUsersSuccessfully extends DoctorHomeState {}
