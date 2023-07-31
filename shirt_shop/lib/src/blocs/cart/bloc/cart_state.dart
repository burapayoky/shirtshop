part of 'cart_bloc.dart';

abstract class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

abstract class CartActionState extends CartState {}

class CartInitial extends CartState {}

class CartSuccesState extends CartState {
  final List<ProductDataModel> cartItem;

  const CartSuccesState({required this.cartItem});
}

class CartRemoveSuccesState extends CartActionState {}


// class CartState extends Equatable {
//   final List<ProductDataModel> cartItem;
//   const CartState({required this.cartItem});

//   CartState copyWith({ProductDataModel? cartItem}) {
//     return cart;
//   }

//   @override
//   List<Object> get props => [];
// }