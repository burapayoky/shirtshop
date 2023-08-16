import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:shirt_shop/src/data/Favorite_item.dart';
import 'package:shirt_shop/src/data/cart_items.dart';
import 'package:shirt_shop/src/models/home_product_model.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  FavoriteBloc() : super(FavoriteInitial()) {
    on<FavoriteInitialEvent>((event, emit) {
      if (FavoriteItem.isNotEmpty) {
        emit(FavoriteSuccesState(favoriteitem: FavoriteItem));
      } else {
        emit((FavoriteEmtyState()));
      }
    });
    on<FavoriteRemoveFromeFavoriteEvet>((event, emit) {
      FavoriteItem.remove(event.productDataModel);
      emit(FavoriteSuccesState(favoriteitem: FavoriteItem));
      emit(FavoriteRemoveSuccessState());
    });
    on<FavoriteCartbuttonClickedEvent>((event, emit) {
      cartItem.add(event.clickedProduct);
      emit(FavoriteItemToCartedActionPageState());
    });
    //ไปหน้าร้านค้า
    on<FavoriteNavigateCartEvent>((event, emit) {
      print('cartadded');
      emit(FavoriteNavigateCartState());
    });
    // on<FavoritePopEvent>((event, emit) {
    //   Navigator.pop(event.context);
    //   print('bug');
    //   emit(FavoritePopState());
    // });
  }
}
