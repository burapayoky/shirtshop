part of 'mainhome_bloc.dart';

abstract class MainhomeEvent extends Equatable {
  const MainhomeEvent();

  @override
  List<Object> get props => [];
}

class MainHomeInitialEvent extends MainhomeEvent {}

class MainHomeSuccesWomenEvet extends MainhomeEvent {}
