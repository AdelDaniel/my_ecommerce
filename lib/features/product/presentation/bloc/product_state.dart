part of 'product_bloc.dart';

abstract class ProductState extends Equatable {
  const ProductState();
}

class LoadingProductState extends ProductState {
  const LoadingProductState();

  @override
  List<Object?> get props => [];
}

class LoadedProductState extends ProductState {
  const LoadedProductState({this.products = const <Product>[]});
  final List<Product> products;

  @override
  List<Object?> get props => [products, products.length];
}

class ErrorProductState extends ProductState {
  const ErrorProductState({required this.failure});
  final Failure failure;
  @override
  List<Object?> get props => [failure];
}
