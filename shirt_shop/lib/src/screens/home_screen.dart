import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shirt_shop/main.dart';
import 'package:shirt_shop/src/screens/widgets/product_widget.dart';

import '../blocs/home/bloc/home_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
          Navigator.pushNamed(context, AppRoute.favorite);
        } else if (state is HomeNavigateToCartActionPageState) {
          Navigator.pushNamed(context, AppRoute.cart);
        } else if (state is HomeItemToCartedActionPageState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('สินค้าเพิ่มลงในตะกร้า')));
        } else if (state is HomeItemToFavoritedActionPageState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('ถูกใจสินค้า')));
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoadingScreen:
            return const Scaffold(
                body: Center(
              child: CircularProgressIndicator(),
            ));
          case HomeLoadingSuccessState:
            final successState = state as HomeLoadingSuccessState;
            return Scaffold(
              appBar: AppBar(
                title: const Text(
                  'Shopping',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontFamily: AutofillHints.email),
                ),
                //elevation: 0.0,
                actions: [
                  //cart and favorite
                  IconButton(
                      onPressed: () {
                        context
                            .read<HomeBloc>()
                            .add(HomeFavoriteNavigatEvent());
                      },
                      icon: Icon(Icons.favorite)),
                  IconButton(
                      onPressed: () {
                        context.read<HomeBloc>().add(HomeCartNavigatEvent());
                      },
                      icon: Icon(Icons.shopping_cart)),
                ],
              ),
              //body
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
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount:
                                2, // Adjust the number of columns here
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

          case HomeErrorState:
            return const Scaffold(body: Center(child: Text('Error')));
          default:
            return const SizedBox();
        }
      },
    );
  }
}
