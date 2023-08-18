import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//import 'package:shirt_shop/src/models/home_product_model.dart';
//import 'package:icon_badge/icon_badge.dart';

import '../../../blocs/home/bloc/home_bloc.dart';

AppBar HomeAppbar(BuildContext context) {
  return AppBar(
    leading: Container(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Image.network(
              'https://upload.wikimedia.org/wikipedia/commons/c/c2/Galaxy_store_logo.png',
              fit: BoxFit.contain, // Fit the image within the container
            ),
          ),
        ],
      ),
    ),
    //cart and favorite
    actions: [
      IconButton(
          onPressed: () {
            context.read<HomeBloc>().add(HomeFavoriteNavigatEvent());
          },
          icon: const Icon(
            Icons.favorite,
          )),
      IconButton(
          onPressed: () {
            context.read<HomeBloc>().add(HomeCartNavigatEvent());
          },
          icon: const Icon(Icons.shopping_cart)),
    ],
    bottom: const PreferredSize(
      preferredSize: Size.fromHeight(60.0), // กำหนดความสูงของ AppBar เป็น
      child: TabBar(
        tabs: [
          Tab(
            text: 'HOME',
          ),
          Tab(
            text: 'MEN',
          ),
          Tab(
            text: 'WOMEN',
          ),
          Tab(
            text: 'KIDS',
          )
        ],
      ),
    ),
  );
}
      

      

   
       // IconBadge(
      //   icon: const Icon(
      //     Icons.favorite,
      //   ),
      //   onTap: () {
      //     context.read<HomeBloc>().add(HomeFavoriteNavigatEvent());
      //   },
      //   itemCount: 0,
      //   hideZero: true,
      // ),
      // BlocConsumer<HomeBloc, HomeState>(
      //   listener: (context, state) {
      //     // TODO: implement listener
      //   },
      //   builder: (context, state) {
      //     int itemCount = 0;
      //     if (state is HomeItemToCartedActionPageState) {
      //       itemCount = state.cartItem.length;
      //       print("object");
      //     }
      //     return IconBadge(
      //       icon: const Icon(Icons.shopping_cart),
      //       onTap: () {
      //         context.read<HomeBloc>().add(HomeCartNavigatEvent());
      //       },
      //       itemCount: itemCount,
      //       hideZero: true,
      //     );
      //   },
      // )