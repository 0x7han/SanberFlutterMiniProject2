part of 'cart_bloc.dart';

sealed class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}


class LoadCartRecent extends CartEvent {
  final int userId;

  const LoadCartRecent(this.userId);

  @override
  List<Object> get props => [userId];
}
