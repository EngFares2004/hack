import 'package:flutter/material.dart';

import '../configuration/theme.dart';
class AuthCustomApppBar extends StatelessWidget {
  final IconData? icon;
  final String logo;
  final VoidCallback? onIconTap;
  const AuthCustomApppBar({super.key, this.icon, this.onIconTap,required this.logo});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top:50),
          child: Container(
            width: double.infinity,
            height: 246,
            child: Align(
              alignment: Alignment.center,
              child: Container(
                width: 238,
                height: 230,
                decoration:  BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(logo),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
        ),
        if (icon != null)
          Positioned(
            top: 57,
            left: 24,
            child: GestureDetector(
              onTap: onIconTap,
              child: CircleAvatar(
                radius: 18,
                backgroundColor:  App_theme.backgroundwhite,
                child: Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color:  App_theme.black,
                    ),
                  ),
                  child: CircleAvatar(
                    radius: 18,
                    backgroundColor:  App_theme.backgroundwhite,
                    child: Icon(
                      icon,
                      color:  App_theme.black,
                      size: 14,
                    ),
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
