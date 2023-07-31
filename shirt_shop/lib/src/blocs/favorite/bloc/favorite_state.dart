part of 'favorite_bloc.dart';

abstract class FavoriteState extends Equatable {
  const FavoriteState();

  @override
  List<Object> get props => [];
}

abstract class FavoriteActionState extends FavoriteState {}

class FavoriteInitial extends FavoriteState {}

class FavoriteSuccesState extends FavoriteState {
  final List<ProductDataModel> favoriteitem;

  const FavoriteSuccesState({required this.favoriteitem});
}

class FavoriteResetState extends FavoriteActionState {}

class FavoriteItemToCartedActionPageState extends FavoriteActionState {}

class FavoriteNavigateCartState extends FavoriteActionState {}
