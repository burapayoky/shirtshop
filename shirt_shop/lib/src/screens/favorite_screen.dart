import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shirt_shop/src/screens/widgets/favorite_widget.dart';

import '../../main.dart';
import '../blocs/favorite/bloc/favorite_bloc.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  void initState() {
    context.read<FavoriteBloc>().add(FavoriteInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('รายการโปรด'),
        elevation: 0.0,
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                context.read<FavoriteBloc>().add(FavoriteNavigateCartEvent());
              },
              icon: Icon(Icons.shopping_cart))
        ],
      ),
      body: BlocConsumer<FavoriteBloc, FavoriteState>(
        listener: (context, state) {
          if (state is FavoriteResetState) {
            setState(() {});
          } else if (state is FavoriteNavigateCartState) {
            Navigator.pushNamed(context, AppRoute.cart);
          }
          // TODO: implement listener
        },
        listenWhen: (previous, current) => current is FavoriteActionState,
        buildWhen: (previous, current) => current is! FavoriteActionState,
        builder: (context, state) {
          switch (state.runtimeType) {
            case FavoriteSuccesState:
              final succesState = state as FavoriteSuccesState;
              return ListView.builder(
                  itemCount: succesState.favoriteitem.length,
                  itemBuilder: (context, indext) {
                    return FavoriteProductWidget(
                        productDataModel: succesState.favoriteitem[indext]);
                  });
            default:
          }
          return Container();
        },
      ),
    );
  }
}
