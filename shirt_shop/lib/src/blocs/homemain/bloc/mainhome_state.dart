part of 'mainhome_bloc.dart';

abstract class MainhomeState extends Equatable {
  const MainhomeState();

  @override
  List<Object> get props => [];
}

//Initial
class MainhomeInitial extends MainhomeState {}

abstract class MainHomeActionState extends MainhomeState {}

class MainHomeSuccessWomenState extends MainhomeState {
  final List<ProductDataModel> product;

  MainHomeSuccessWomenState({required this.product});
}
//