part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

//เกิดacctions
abstract class HomeActionState extends HomeState {}

//โหลด
class HomeLoadingScreen extends HomeState {}

class HomeLoadingSuccessState extends HomeState {
  final List<ProductDataModel> product;

  HomeLoadingSuccessState({required this.product});
}

class HomeErrorState extends HomeState {}

//Initial
class HomeInitial extends HomeState {}

//Navigate
class HomeNavigateToFavoriteActionPageState extends HomeActionState {}

class HomeNavigateToCartActionPageState extends HomeActionState {}

//add
class HomeItemToFavoritedActionPageState extends HomeActionState {}

class HomeItemToCartedActionPageState extends HomeActionState {}
