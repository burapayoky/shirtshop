import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shirt_shop/src/screens/widgets/homewidgets/app_text.dart';

import '../../main.dart';
import '../blocs/home/bloc/home_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(HomeLoadingHomeEvent());
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
        } //else if (state is HomeNavigateMenPageState) {}
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeSuccessHomePageState:
            final successState = state as HomeSuccessHomePageState;
            return Scaffold(
                body: PageView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: successState.product.length,
                    itemBuilder: ((context, index) {
                      return Container(
                        width: 600,
                        height: 600,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    successState.product[index].imageUrl),
                                fit: BoxFit.cover)),
                        child: Container(
                          margin: const EdgeInsets.only(
                              top: 150, left: 20, right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 100),
                                      child: AppLageText(
                                        text: successState.product[index].name,
                                        size: 25,
                                        color: Colors.teal.shade400,
                                      ),
                                    ),
                                    //descriotion
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 100),
                                      child: AppLageText(
                                        text: successState
                                            .product[index].description,
                                        size: 14,
                                        color: Colors.teal.shade400,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    //price
                                    AppLageText(
                                      text:
                                          '${(successState.product[index].price).toString().replaceAll(".0", "")}THB',
                                      size: 24,
                                      color: Colors.red,
                                    ),
                                    const SizedBox(
                                      height: 16,
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        if (index == 0) {
                                          DefaultTabController.of(context)
                                              .animateTo(1);
                                        } else if (index == 1) {
                                          DefaultTabController.of(context)
                                              .animateTo(2);
                                        } else if (index == 2) {
                                          DefaultTabController.of(context)
                                              .animateTo(3);
                                        }
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(2.0),
                                        ),
                                      ),
                                      child: const Text(
                                        'ช้อปเลย',
                                        style: TextStyle(
                                          color: Colors.black87,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              //slider
                              Column(
                                children: List.generate(3, (indexslice) {
                                  return Container(
                                    margin: const EdgeInsets.only(bottom: 2),
                                    width: 8,
                                    height: index == indexslice ? 25 : 8,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: index == indexslice
                                            ? const Color.fromARGB(
                                                255, 15, 194, 226)
                                            : const Color.fromARGB(
                                                    255, 15, 194, 226)
                                                .withOpacity(0.3)),
                                  );
                                }),
                              ),
                            ],
                          ),
                        ),
                      );
                    })) // productDataModel: successState.product[index]
                );
          default:
        }
        return Container();
      },
    );
  }
}
