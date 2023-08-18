import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shirt_shop/src/screens/cart_screen.dart';
import 'package:shirt_shop/src/screens/favorite_screen.dart';
import 'package:shirt_shop/src/screens/widgets/product_widget.dart';

//import '../../main.dart';
import '../blocs/home/bloc/home_bloc.dart';

class ShirtKidsScreen extends StatefulWidget {
  const ShirtKidsScreen({super.key});

  @override
  State<ShirtKidsScreen> createState() => _ShirtKidsScreenState();
}

class _ShirtKidsScreenState extends State<ShirtKidsScreen> {
  bool isLargeScreen(double screenWidth) {
    return screenWidth >= 600;
  }

  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(HomeLoadingKidEvent());
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
                return FavoritePage();
              },
            ),
          );
        } else if (state is HomeNavigateToCartActionPageState) {
          //Navigator.pushNamed(context, AppRoute.cart);
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
                return CartPage();
              },
            ),
          );
        }
        // } else if (state is HomeItemToCartedActionPageState) {
        //   ScaffoldMessenger.of(context)
        //       .showSnackBar(SnackBar(content: Text('สินค้าเพิ่มลงในตะกร้า')));
        // } else if (state is HomeItemToFavoritedActionPageState) {
        //   ScaffoldMessenger.of(context)
        //       .showSnackBar(SnackBar(content: Text('ถูกใจสินค้า')));
        //
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeSuccessKidState:
            final successState = state as HomeSuccessKidState;
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
                                crossAxisCount, // Adjust the number of columns here
                            crossAxisSpacing: 8.0,
                            mainAxisSpacing: 2.0,
                            childAspectRatio:
                                0.75, // Adjust the aspect ratio here
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
          default:
        }
        return Container();
      },
    );
    // return const Placeholder();
  }
}
