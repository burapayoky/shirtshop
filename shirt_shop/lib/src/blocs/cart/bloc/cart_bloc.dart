import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shirt_shop/src/data/cart_items.dart';
import 'package:shirt_shop/src/models/home_product_model.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartInitialEvent>((event, emit) {
      if (cartItem.isNotEmpty) {
        emit(CartSuccesState(cartItem: cartItem));
      } else {
        emit(CartSuccesEmtyState());
      }
    });
    on<CartRemoveFromCartEvet>((event, emit) {
      cartItem.remove(event.productDataModel);
      emit(CartSuccesState(cartItem: cartItem));
      emit(CartRemoveSuccesState());
    });
    //  on<CartEventSumprice>((event, emit) {

    //   //emit HomeNavigateToWishlistActionPageState ขึ้นมา

    // });
  }
}
