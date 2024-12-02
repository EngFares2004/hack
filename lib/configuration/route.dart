import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/screens/plans_screen.dart';
import 'package:untitled1/screens/splashpage.dart';

import '../screens/bottombarNavigator.dart';
import '../screens/home_page.dart';
import '../screens/login_screen.dart';

abstract class RouteApp {
  static const String splash ="/";
  static const String HomePage="/HomePage";
  static const String BottomBarNavigator ="/BottomBarNavigator";
  static const String login ="/login";
  //static const String  ="login";

}
Route<dynamic>? generateRout(RouteSettings settings) {
  Route pageRoute(Widget widget) {
    return MaterialPageRoute(builder: (context) => widget);
  }

  switch (settings.name) {
    case RouteApp.splash:
      return pageRoute(const SplashPage());
    case RouteApp.login:
      return pageRoute(LoginScreen());
    case RouteApp.HomePage:
      return pageRoute(const DoctorPage());
    case RouteApp.BottomBarNavigator:
      return pageRoute(const BottomBarNavigator());
  }
}
