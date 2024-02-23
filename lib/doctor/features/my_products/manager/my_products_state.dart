part of 'my_products_cubit.dart';

@immutable
abstract class MyProductsState {}

class MyProductsInitial extends MyProductsState {}
class GetProducts extends MyProductsState {}
class UpdateProduct extends MyProductsState {}
