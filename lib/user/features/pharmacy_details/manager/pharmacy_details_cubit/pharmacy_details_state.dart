part of 'pharmacy_details_cubit.dart';

@immutable
abstract class PharmacyDetailsState {}

class PharmacyDetailsInitial extends PharmacyDetailsState {}

class AddProductToCartLoading extends PharmacyDetailsState {}

class AddProductToCartSuccessfully extends PharmacyDetailsState {}

class AddProductToCartError extends PharmacyDetailsState {}

class RemoveProductFromCartLoading extends PharmacyDetailsState {}

class RemoveProductFromCartSuccessfully extends PharmacyDetailsState {}

class RemoveProductFromCartError extends PharmacyDetailsState {}

class GetAllCartProductsLoading extends PharmacyDetailsState {}

class GetAllCartProductsSuccessfully extends PharmacyDetailsState {}

class GetAllCartProductsError extends PharmacyDetailsState {}
