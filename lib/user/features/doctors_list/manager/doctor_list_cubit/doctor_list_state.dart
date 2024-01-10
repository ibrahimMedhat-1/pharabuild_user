part of 'doctor_list_cubit.dart';

@immutable
abstract class DoctorListState {}

class DoctorListInitial extends DoctorListState {}

class ChangeDropDownMenuItemValue extends DoctorListState {}

class GetAllDoctorsLoading extends DoctorListState {}

class GetAllDoctorsSuccessfully extends DoctorListState {}

class GetAllDoctorsError extends DoctorListState {}
