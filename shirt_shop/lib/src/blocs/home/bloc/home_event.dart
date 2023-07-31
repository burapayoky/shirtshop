part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class HomeInitailEvent extends HomeEvent {}

//ปุ่มwishlishถูกกด
class HomeFavoriteButtonClickedEvent extends HomeEvent {
  final ProductDataModel clickedProduct;

  HomeFavoriteButtonClickedEvent({required this.clickedProduct});
}

//ปุ่มcartถูกกด
class HomeCartButtonClickedEvent extends HomeEvent {
  //ส่งlist product เข้าbloc
  final ProductDataModel clickedProduct;

  HomeCartButtonClickedEvent({required this.clickedProduct});
}

//ปุ่มcart app barถูกกด
class HomeFavoriteNavigatEvent extends HomeEvent {}

class HomeCartNavigatEvent extends HomeEvent {}
