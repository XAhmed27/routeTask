

import 'package:equatable/equatable.dart';
import 'package:routetask/features/list_of_products/data/models/list_of_products_response_body.dart';

abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductLoadedSuccessfully extends ProductState {
  final ListOfProductsResponseBody products;

  const ProductLoadedSuccessfully(this.products);

  @override
  List<Object> get props => [products];
}

class ProductError extends ProductState {
  final String message;

  const ProductError(this.message);

  @override
  List<Object> get props => [message];
}
