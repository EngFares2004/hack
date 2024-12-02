import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled1/configuration/route.dart';
import '../configuration/shared_keys.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late Timer _timer;
  late AnimationController _animationController;
  late Animation<double> _animation;

  Future<void> _checkLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLogin = prefs.getBool(SharedKeys.islogin) ?? false;
    if (isLogin) {
      Navigator.pushReplacementNamed(context, RouteApp.BottomBarNavigator);
    } else {
      Navigator.pushReplacementNamed(context, RouteApp.login);
    }
  }

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 0.8, end: 1.2).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    _timer = Timer(const Duration(seconds: 6), _checkLogin);
  }

  @override
  void dispose() {
    _timer.cancel();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: ScaleTransition(
                scale: _animation,
                child: Image.asset(
                  "assets/images/logo.png",
                  width: MediaQuery.of(context).size.width / 1.5,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Image.asset(
                "assets/images/cation.png",
                width: double.infinity,
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
