import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shirt_shop/src/screens/widgets/cart_widget.dart';

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
        title: const Text('ตะกร้าสินค้า'),
        elevation: 0.0,
        centerTitle: true,
      ),
      body: BlocConsumer<CartBloc, CartState>(
        listener: (context, state) {
          if (state is CartRemoveSuccesState) {
            setState(() {});
          }
        },
        listenWhen: (previous, current) => current is CartActionState,
        buildWhen: (previous, current) => current is! CartActionState,
        builder: (context, state) {
          switch (state.runtimeType) {
            case CartSuccesState:
              final succesState = state as CartSuccesState;
              return ListView.builder(
                  itemCount: succesState.cartItem.length,
                  itemBuilder: (context, indext) {
                    return CartProductWidget(
                        productDataModel: succesState.cartItem[indext]);
                  });
            default:
          }
          return Container();
        },
      ),
    );
  }
}
