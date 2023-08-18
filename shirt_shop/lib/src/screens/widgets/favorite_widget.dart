import 'package:animated_icon/animated_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/favorite/bloc/favorite_bloc.dart';
import '../../models/home_product_model.dart';

class FavoriteProductWidget extends StatelessWidget {
  final ProductDataModel productDataModel;

  const FavoriteProductWidget({
    Key? key,
    required this.productDataModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[400]!),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 150,
            width: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(productDataModel.imageUrl),
              ),
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productDataModel.name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  "THB: ${productDataModel.price}",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        context.read<FavoriteBloc>().add(
                              FavoriteRemoveFromeFavoriteEvet(
                                productDataModel: productDataModel,
                              ),
                            );
                      },
                      icon: const Icon(
                        Icons.heart_broken,
                        color: Colors.red,
                      ),
                    ),
                    // IconButton(
                    //   onPressed: () {
                    //     context.read<FavoriteBloc>().add(
                    //           FavoriteCartbuttonClickedEvent(
                    //             clickedProduct: productDataModel,
                    //           ),
                    //         );
                    //   },
                    //   icon: const Icon(
                    //     Icons.shopping_cart,
                    //     color: Colors.blue,
                    //   ),
                    // ),
                    AnimateIcon(
                      key: UniqueKey(),
                      onTap: () {
                        context.read<FavoriteBloc>().add(
                              FavoriteCartbuttonClickedEvent(
                                clickedProduct: productDataModel,
                              ),
                            );
                      },
                      iconType: IconType.animatedOnTap,
                      height: 25,
                      width: 25,
                      color: Colors.blue,
                      animateIcon: AnimateIcons.paid,
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
