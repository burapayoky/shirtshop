import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shirt_shop/src/data/shirt_women.dart';
import 'package:shirt_shop/src/models/home_product_model.dart';

part 'mainhome_event.dart';
part 'mainhome_state.dart';

class MainhomeBloc extends Bloc<MainhomeEvent, MainhomeState> {
  MainhomeBloc() : super(MainhomeInitial()) {
    on<MainHomeSuccesWomenEvet>((event, emit) {
      emit(MainhomeInitial());
      emit(MainHomeSuccessWomenState(
          product: ShirtWomenData.shirtWomenProducts
              .map((e) => ProductDataModel(
                  id: e['id'],
                  name: e['name'], //e['']
                  description: e['description'],
                  price: e['price'],
                  imageUrl: e['imageUrl']))
              .toList()));
      // TODO: implement event handler
    });
  }
}
