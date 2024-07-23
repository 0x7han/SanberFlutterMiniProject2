part of 'cart_bloc.dart';

sealed class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

final class CartInitial extends CartState {}

class CartLoading extends CartState {}


class CartError extends CartState {
  final String error;

  const CartError(this.error);

  @override
  List<Object> get props => [error];
}


class CartRecentLoaded extends CartState {

  final Cart recentCart;
  final int count;

  const CartRecentLoaded({required this.recentCart, required this.count});

  @override
  List<Object> get props => [recentCart, count,];
}
