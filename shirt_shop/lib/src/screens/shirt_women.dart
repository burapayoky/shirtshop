import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shirt_shop/src/screens/widgets/product_widget.dart';

import '../../main.dart';
import '../blocs/home/bloc/home_bloc.dart';

class ShirtWomenScreen extends StatefulWidget {
  const ShirtWomenScreen({super.key});

  @override
  State<ShirtWomenScreen> createState() => _ShirtWomenScreenState();
}

class _ShirtWomenScreenState extends State<ShirtWomenScreen> {
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<HomeBloc>().add(HomeLoadingWomenEvent());
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
          case HomeSuccessWomenState:
            final successState = state as HomeSuccessWomenState;
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
          default:
        }
        return Container();
      },
    );
    // return const Placeholder();
  }
}
// return BlocConsumer<HomeBloc, HomeState>(
//       listenWhen: (previous, current) => current is HomeActionState,
//       buildWhen: (previous, current) => current is! HomeActionState,
//       listener: (context, state) {
//         if (state is HomeNavigateToFavoriteActionPageState) {
//           Navigator.pushNamed(context, AppRoute.favorite);
//         } else if (state is HomeNavigateToCartActionPageState) {
//           Navigator.pushNamed(context, AppRoute.cart);
//         } else if (state is HomeItemToCartedActionPageState) {
//           ScaffoldMessenger.of(context)
//               .showSnackBar(SnackBar(content: Text('สินค้าเพิ่มลงในตะกร้า')));
//         } else if (state is HomeItemToFavoritedActionPageState) {
//           ScaffoldMessenger.of(context)
//               .showSnackBar(SnackBar(content: Text('ถูกใจสินค้า')));
//         }
//       },
//       builder: (context, state) {
//         switch (state.runtimeType) {
//           case MainHomeSuccessWomenState:
//             final successState = state as MainHomeSuccessWomenState;
//             return Scaffold(
//               body: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Column(
//                   children: [
//                     const Row(
//                       children: [],
//                     ),
//                     Expanded(
//                       child: GridView.builder(
//                           gridDelegate:
//                               const SliverGridDelegateWithFixedCrossAxisCount(
//                             crossAxisCount:
//                                 2, // Adjust the number of columns here
//                             crossAxisSpacing: 8.0,
//                             mainAxisSpacing: 2.0,
//                             childAspectRatio:
//                                 0.75, // Adjust the aspect ratio here
//                           ),
//                           scrollDirection: Axis.vertical,
//                           shrinkWrap: true,
//                           itemCount: successState.product.length,
//                           itemBuilder: ((context, index) {
//                             return ProductWidget(
//                                 productDataModel: successState.product[index]);
//                           })),
//                     )
//                   ],
//                 ),
//               ),
//             );
//           default:
//         }
//         return Container();
//       },
//     );
//     // return const Placeholder();