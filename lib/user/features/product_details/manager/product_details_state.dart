part of 'product_details_cubit.dart';

@immutable
abstract class ProductDetailsState {}

class ProductDetailsInitial extends ProductDetailsState {}
class AddProductToCartLoading extends ProductDetailsState {}
class ProductAddedToCart extends ProductDetailsState {}
