import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:shirt_shop/main.dart';
import 'package:shirt_shop/src/screens/cart_screen.dart';
import 'package:shirt_shop/src/screens/favorite_screen.dart';

import 'package:shirt_shop/src/screens/widgets/product_widget.dart';

import '../blocs/home/bloc/home_bloc.dart';

class ShirtMenPage extends StatefulWidget {
  const ShirtMenPage({super.key});

  @override
  State<ShirtMenPage> createState() => _ShirtMenPageState();
}

class _ShirtMenPageState extends State<ShirtMenPage> {
  bool isLargeScreen(double screenWidth) {
    return screenWidth >= 600;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<HomeBloc>().add(HomeInitailEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      listener: (context, state) {
        if (state is HomeNavigateToFavoriteActionPageState) {
          //Navigator.pushNamed(context, AppRoute.favorite);
          Navigator.push(
            context,
            PageRouteBuilder(
              transitionDuration: Duration(milliseconds: 400),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                final slideAnimation =
                    Tween(begin: Offset(0, 1), end: Offset(0, 0))
                        .animate(animation);

                return SlideTransition(
                  position: slideAnimation,
                  child: child,
                );
              },
              pageBuilder: (context, animation, secondaryAnimation) {
                return const FavoritePage();
              },
            ),
          );
        } else if (state is HomeNavigateToCartActionPageState) {
          //Navigator.pushNamed(context, AppRoute.cart);
          Navigator.push(
            context,
            PageRouteBuilder(
              transitionDuration: const Duration(milliseconds: 400),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                final slideAnimation =
                    Tween(begin: Offset(0, 1), end: Offset(0, 0))
                        .animate(animation);

                return SlideTransition(
                  position: slideAnimation,
                  child: child,
                );
              },
              pageBuilder: (context, animation, secondaryAnimation) {
                return CartPage();
              },
            ),
          );
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoadingScreen:
            return const Scaffold(
                body: Center(
              child: Center(child: CircularProgressIndicator()),
            ));
          case HomeLoadingSuccessState:
            final successState = state as HomeLoadingSuccessState;
            final screenWidth = MediaQuery.of(context).size.width;
            int crossAxisCount = isLargeScreen(screenWidth) ? 3 : 2;
            return Scaffold(
              body: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const Row(
                      children: [],
                    ),
                    Expanded(
                      child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount:
                                crossAxisCount, // Adjust the number of columns
                            crossAxisSpacing: 8.0,
                            mainAxisSpacing: 2.0,
                            childAspectRatio: 0.75,
                          ),
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: successState.product.length,
                          itemBuilder: ((context, index) {
                            return ProductWidget(
                                productDataModel: successState.product[index]);
                          })),
                    )
                  ],
                ),
              ),
            );

          case HomeErrorState:
            return const Scaffold(body: Center(child: Text('Error')));
          default:
            return const SizedBox();
        }
      },
    );
  }
}
