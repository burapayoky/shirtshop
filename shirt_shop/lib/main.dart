import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:shirt_shop/src/blocs/cart/bloc/cart_bloc.dart';
import 'package:shirt_shop/src/blocs/favorite/bloc/favorite_bloc.dart';
import 'package:shirt_shop/src/screens/cart_screen.dart';
import 'package:shirt_shop/src/screens/favorite_screen.dart';
import 'package:shirt_shop/src/screens/home_screen.dart';

import 'src/blocs/home/bloc/home_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final homeBloc = BlocProvider<HomeBloc>(create: (context) => HomeBloc());
    final cartBloc = BlocProvider<CartBloc>(create: (context) => CartBloc());
    final favoriteBloc =
        BlocProvider<FavoriteBloc>(create: (context) => FavoriteBloc());
    return MultiProvider(
      providers: [homeBloc, cartBloc, favoriteBloc],
      child: MaterialApp(
        routes: AppRoute().getAll,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomePage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class AppRoute {
  static const home = 'home';
  static const cart = 'cart';
  static const favorite = 'favorite';
  final _route = <String, WidgetBuilder>{
    home: (context) => const HomePage(),
    cart: (context) => const CartPage(),
    favorite: (context) => const FavoritePage(),
  };
  get getAll => _route;
}
