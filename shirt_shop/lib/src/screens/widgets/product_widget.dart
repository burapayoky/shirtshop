import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shirt_shop/src/models/home_product_model.dart';

import '../../blocs/home/bloc/home_bloc.dart';

class ProductWidget extends StatelessWidget {
  final ProductDataModel productDataModel;
  const ProductWidget({super.key, required this.productDataModel});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //รูป
            Container(
              height: 140,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(productDataModel.imageUrl),
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 4),
              child: Text(
                productDataModel.name,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            // const SizedBox(
            //   height: 16,
            // ),
            const Spacer(), // Add this spacer to push the following content to the bottom
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'THB: ${productDataModel.price}',
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                      color: Colors.red,
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          context.read<HomeBloc>().add(
                                HomeFavoriteButtonClickedEvent(
                                    clickedProduct: productDataModel),
                              );
                        },
                        icon: Icon(Icons.favorite,
                            color: Theme.of(context).primaryColor),
                      ),
                      IconButton(
                        onPressed: () {
                          context.read<HomeBloc>().add(
                                HomeCartButtonClickedEvent(
                                    clickedProduct: productDataModel),
                              );
                        },
                        icon: Icon(Icons.shopping_cart,
                            color: Theme.of(context).primaryColor),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
