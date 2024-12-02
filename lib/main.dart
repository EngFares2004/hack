import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/bloc/bloc_cart/cart_bloc.dart';
import 'package:untitled1/screens/splashpage.dart';
import 'package:untitled1/screens/bottombarNavigator.dart';
import 'package:untitled1/screens/login_screen.dart';
import 'bloc/cubits/plans_cubit.dart';
import 'configuration/route.dart';
import 'shared_handler/shared_handler.dart';
void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await SharedHandler.init();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RouteApp.splash,
      onGenerateRoute: generateRout,
      routes: {
        RouteApp.splash: (context) => const SplashPage(),
        RouteApp.HomePage: (context) => LoginScreen(),
        RouteApp.BottomBarNavigator: (context) => const BottomBarNavigator(),
      },
    );
  }
}
