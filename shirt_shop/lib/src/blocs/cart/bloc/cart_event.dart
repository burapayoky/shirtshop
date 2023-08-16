part of 'cart_bloc.dart';

class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class CartInitialEvent extends CartEvent {}

class CartRemoveFromCartEvet extends CartEvent {
  final ProductDataModel productDataModel;

  CartRemoveFromCartEvet({required this.productDataModel});
}

class CartRemoveFromCartSuccesEvet extends CartEvent {}

class CartResetEvent extends CartEvent {}
//
//class CartEventSumprice extends CartEvent {}