import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shirt_shop/src/screens/home_page.dart';
import 'package:shirt_shop/src/screens/menshirt_screen.dart';
import 'package:shirt_shop/src/screens/kidshirt_screen.dart';
import 'package:shirt_shop/src/screens/shirt_women.dart';

import 'package:shirt_shop/src/screens/widgets/homewidgets/home_appbar.dart';

import '../blocs/home/bloc/home_bloc.dart';

class HomeMain extends StatefulWidget {
  const HomeMain({super.key});

  @override
  State<HomeMain> createState() => _HomeMainState();
}

class _HomeMainState extends State<HomeMain> {
  @override
  Widget build(BuildContext context) {
    //var screensize = MediaQuery.of(context).size;
    return BlocConsumer<HomeBloc, HomeState>(
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      listener: (context, state) {},
      builder: (context, state) {
        return DefaultTabController(
          length: 4, // Number of tabs
          child: Scaffold(
            appBar: HomeAppbar(context),
            body: const TabBarView(
              children: [
                HomePage(),
                ShirtMenPage(),
                ShirtWomenScreen(),
                ShirtKidsScreen(),
              ],
            ),
          ),
        );
      },
    );
  }
}
