part of 'add_product__cubit.dart';

@immutable
abstract class AddProductState {}

class AddProductInitial extends AddProductState {}
class UploadPhoto extends AddProductState {}
class AddProductSuccessfully extends AddProductState {}
class AddProductLoading extends AddProductState {}
class ProductImageLoading extends AddProductState {}
