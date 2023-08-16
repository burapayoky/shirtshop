import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shirt_shop/src/screens/widgets/cart_widget.dart';
import 'package:shirt_shop/src/screens/widgets/homewidgets/app_text.dart';

import '../blocs/cart/bloc/cart_bloc.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  void initState() {
    // TODO: implement initState
    context.read<CartBloc>().add(CartInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ตะกร้าสินค้า',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        elevation: 0.0,
        centerTitle: true,
      ),
      body: BlocConsumer<CartBloc, CartState>(
        listener: (context, state) {
          if (state is CartRemoveSuccesState) {
            // setState(() {});
            context.read<CartBloc>().add(CartInitialEvent());
          }
        },
        listenWhen: (previous, current) => current is CartActionState,
        buildWhen: (previous, current) => current is! CartActionState,
        builder: (context, state) {
          switch (state.runtimeType) {
            case CartSuccesState:
              final succesState = state as CartSuccesState;
              final successlenght = succesState.cartItem.length;
              print(successlenght);
              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                        itemCount: succesState.cartItem.length,
                        itemBuilder: (context, indext) {
                          return CartProductWidget(
                              productDataModel: succesState.cartItem[indext]);
                        }),
                  ),
                  Container(
                    height: 160,
                    margin: const EdgeInsets.all(16.0),
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors
                          .grey[200], // Change the background color as needed
                      borderRadius: BorderRadius.circular(8.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text('สรุปคำสั่งซื้อ |',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16)),
                            Text(' ${succesState.cartItem.length} รายการ')
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'รวมยอดทั้งหมด',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'THB ${state.totalPrice} ', // Format the price as needed
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const Spacer(),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(2.0),
                            ),
                          ),
                          child: const Text(
                            'ชำระเงิน',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              );
            case CartSuccesEmtyState:
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Image.network(
                          'https://demo.ordu.io/images/empty-cart.png',
                          height: 100,
                          width: 100,
                        ),
                        AppLageText(
                          text: 'ตะกร้า',
                          size: 16,
                          color: Colors.black,
                        ),
                        AppLageText(
                          text: 'ตะกร้าของคุณว่างอยู่',
                          size: 14,
                          color: Colors.black,
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
