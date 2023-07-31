part of 'favorite_bloc.dart';

abstract class FavoriteEvent extends Equatable {
  const FavoriteEvent();

  @override
  List<Object> get props => [];
}

class FavoriteInitialEvent extends FavoriteEvent {}

class FavoriteRemoveFromeFavoriteEvet extends FavoriteEvent {
  final ProductDataModel productDataModel;

  FavoriteRemoveFromeFavoriteEvet({required this.productDataModel});
}

class FavoriteResetEvent extends FavoriteEvent {}

class FavoriteCartbuttonClickedEvent extends FavoriteEvent {
  final ProductDataModel clickedProduct;

  const FavoriteCartbuttonClickedEvent({required this.clickedProduct});
}

class FavoriteNavigateCartEvent extends FavoriteEvent {}
