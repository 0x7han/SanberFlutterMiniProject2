part of 'product_bloc.dart';

sealed class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

final class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductError extends ProductState {
  final String error;

  const ProductError(this.error);

  @override
  List<Object> get props => [error];
}

class ProductLoaded extends ProductState {
  final List<Product> allProducts;
  final List<Product> filteredProducts;
  final String selectedCategory;
  final String selectedSort;

  const ProductLoaded({
    required this.allProducts,
    required this.filteredProducts,
    required this.selectedCategory,
    required this.selectedSort,
  });

  ProductLoaded copyWith({
    List<Product>? allProducts,
    List<Product>? filteredProducts,
    String? selectedCategory,
    String? selectedSort,
  }) => ProductLoaded(
      allProducts: allProducts ?? this.allProducts,
      filteredProducts: filteredProducts ?? this.filteredProducts,
      selectedCategory: selectedCategory ?? this.selectedCategory,
      selectedSort: selectedSort ?? this.selectedSort,
    );
  

  @override
  List<Object> get props => [allProducts, filteredProducts, selectedCategory, selectedSort];
}

class ProductLoadedBySearch extends ProductState {
  final List<Product> filteredProducts;


  const ProductLoadedBySearch({
    required this.filteredProducts,
  });

  

  @override
  List<Object> get props => [filteredProducts];
}