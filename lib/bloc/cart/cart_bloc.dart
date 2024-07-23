import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sanber_flutter_mini_project_2/model/cart.dart';
import 'package:sanber_flutter_mini_project_2/repositories/cart_repository.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final CartRepository _cartRepository = CartRepository();

  CartBloc() : super(CartInitial()) {
    on<LoadCartRecent>((event, emit) async {
      emit(CartLoading());
      try {
        final List<Cart> carts =
            await _cartRepository.getByUserId(event.userId);

        carts.sort((a, b) => b.date.compareTo(a.date));

    Cart mostRecentCart = carts.first;

    int productsLength = mostRecentCart.products.length;

        
        emit(CartRecentLoaded(recentCart: mostRecentCart, count: productsLength,));
      } catch (e) {
        emit(CartError(e.toString()));
      }
    });

  
  }
}
