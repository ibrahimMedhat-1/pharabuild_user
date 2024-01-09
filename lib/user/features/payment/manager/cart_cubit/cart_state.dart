part of 'cart_cubit.dart';

abstract class CartState {}

class CartInitial extends CartState {}

class RemoveProductFromCart extends CartState {}

class GetAllCartProductsLoading extends CartState {}

class GetAllCartProductsSuccessfully extends CartState {}

class GetAllCartProductsError extends CartState {}

class RemoveProductFromCartLoading extends CartState {}

class RemoveProductFromCartSuccessfully extends CartState {}

class RemoveProductFromCartError extends CartState {}
