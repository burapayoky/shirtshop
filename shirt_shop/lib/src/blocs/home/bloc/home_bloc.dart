import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shirt_shop/src/data/Favorite_item.dart';
import 'package:shirt_shop/src/data/cart_items.dart';
import 'package:shirt_shop/src/data/shirt_data.dart';
import 'package:shirt_shop/src/models/home_product_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitailEvent>(
      (event, emit) async {
        emit(HomeInitial());
        //await Future.delayed(Duration(seconds: 3));
        emit(HomeLoadingSuccessState(
            product: ShirtData.shirtProducts
                .map((e) => ProductDataModel(
                    id: e['id'],
                    name: e['name'], //e['']
                    description: e['description'],
                    price: e['price'],
                    imageUrl: e['imageUrl']))
                .toList()));
      },
    );
    on<HomeFavoriteButtonClickedEvent>((event, emit) {
      print('Favorite add');
      FavoriteItem.add(event.clickedProduct);
      emit(HomeItemToFavoritedActionPageState());
    });
    on<HomeCartButtonClickedEvent>((event, emit) {
      print('Cart add');
      cartItem.add(event.clickedProduct);
      emit(HomeItemToCartedActionPageState());
    });
    //Navigate กดปุ่มสิ่งที่ถูกใจบนappbar
    on<HomeFavoriteNavigatEvent>((event, emit) {
      //emit HomeNavigateToWishlistActionPageState ขึ้นมา
      emit(HomeNavigateToFavoriteActionPageState());
    });
    on<HomeCartNavigatEvent>((event, emit) {
      //emit HomeNavigateToWishlistActionPageState ขึ้นมา
      emit(HomeNavigateToCartActionPageState());
    });
  }
}