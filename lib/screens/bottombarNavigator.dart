// ignore_for_file: deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled1/widgets/details_doctor_screen.dart';
import '../bloc/bloc_cart/cart_bloc.dart';
import '../bloc/cubits/plans_cubit.dart';
import 'cart_screen.dart';
import 'home_page.dart';
import 'order_page_screen.dart';
import 'plans_screen.dart';
import 'profile_screen.dart';
import '../configuration/theme.dart';

class BottomBarNavigator extends StatefulWidget {
  const BottomBarNavigator({super.key});

  @override
  State<BottomBarNavigator> createState() => _BottomBarNavigatorState();
}

class _BottomBarNavigatorState extends State<BottomBarNavigator> {
  int currentIndex = 0;

  List<Widget> pages = [
    const DoctorPage(),
    BlocProvider<PlansCubit>(
      create: (_) => PlansCubit(),
      child:Plans(),

    ),
    const OrderPage(),
    const ProfilePage(),
    BlocProvider<CartBloc>(
      create: (_) => CartBloc(),
      child:CartScreen(),

    ),
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: App_theme.backgroundwhite,
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: App_theme.primary,
        unselectedItemColor: App_theme.hinttextcolor,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        elevation: 10,
        showUnselectedLabels: true,
        selectedLabelStyle: const TextStyle(color: App_theme.primary,),
        unselectedLabelStyle: const TextStyle(color:App_theme.hinttextcolor),
        items: [
          BottomNavigationBarItem(
            icon:Icon( CupertinoIcons.home,
              size: 24,
              color: currentIndex == 0 ? null : App_theme.hinttextcolor,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon:Icon( Icons.storefront_outlined,
              size: 24,
              color: currentIndex == 0 ? null : App_theme.hinttextcolor,
            ),
            label: 'Store',
          ),
          BottomNavigationBarItem(
            icon:Icon( Icons.shopping_cart_outlined,
              size: 24,
              color: currentIndex == 0 ? null : App_theme.hinttextcolor,
            ),
            label: 'Orders',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/profile.svg',
              width: 24,
              height: 24,
              color: currentIndex == 3 ? App_theme.primary :App_theme.hinttextcolor,
            ),
            label: 'Profile',
          ),

          BottomNavigationBarItem(
            icon:Icon( Icons.location_on_outlined,
              size: 24,
              color: currentIndex == 0 ? null : App_theme.hinttextcolor,
            ),
            label: 'Cart',
          ),
        ],
      ),

    );
  }
}
