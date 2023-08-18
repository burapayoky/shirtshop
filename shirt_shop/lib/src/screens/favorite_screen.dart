import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shirt_shop/src/screens/widgets/favorite_widget.dart';
import 'package:shirt_shop/src/screens/widgets/homewidgets/app_text.dart';

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

    // Start the animation when the page is built
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('รายการโปรด',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
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
          if (state is FavoriteRemoveSuccessState) {
            context.read<FavoriteBloc>().add(FavoriteInitialEvent());
          } else if (state is FavoriteNavigateCartState) {
            Navigator.pushNamed(context, AppRoute.cart);
          }
        },
        listenWhen: (previous, current) => current is FavoriteActionState,
        buildWhen: (previous, current) => current is! FavoriteActionState,
        builder: (context, state) {
          switch (state.runtimeType) {
            case FavoriteSuccesState:
              final succesState = state as FavoriteSuccesState;
              double paddingValue = screenWidth < 600 ? 16.0 : 50.0;
              EdgeInsets padding = EdgeInsets.all(paddingValue);

              return Padding(
                padding: padding,
                child: ListView.builder(
                    itemCount: succesState.favoriteitem.length,
                    itemBuilder: (context, indext) {
                      return FavoriteProductWidget(
                          productDataModel: succesState.favoriteitem[indext]);
                    }),
              );
            case FavoriteEmtyState:
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Image.network(
                          'https://img.freepik.com/premium-vector/tshirt-icon-comic-style-casual-clothes-cartoon-vector-illustration-white-isolated-background-polo-wear-splash-effect-business-concept_157943-12322.jpg',
                          height: 100,
                          width: 100,
                        ),
                        AppLageText(
                          text: 'ไม่มีสินค้า รายการในรายการโปรดของคุณ',
                          size: 14,
                          color: Colors.black,
                        ),
                        AppLageText(
                          text: 'เพิ่มสินค้าลงในรายการโปรดของคุณ',
                          size: 12,
                          color: Colors.black.withOpacity(0.5),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            default:
          }
          return Container();
        },
      ),
    );
  }
}
