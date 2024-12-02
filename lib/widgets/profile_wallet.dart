// ignore_for_file: deprecated_member_use

import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../configuration/theme.dart';

class ProfileWallet extends StatelessWidget {
  const ProfileWallet({super.key});

  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
        Container(
          width: double.infinity,
          height: 119,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: const DecorationImage(
              image: AssetImage('assets/images/profile2.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: 24,
          left: 16,
          bottom: 16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Last Charged : 01-01-2023',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                  color:App_theme.backgroundwhite,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Your Wallet',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                    color:App_theme.backgroundwhite,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Container(
                    width: 5,
                    height: 15,
                    decoration: BoxDecoration(
                      color: Color(0xffF58634),
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    '280,00AED',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: App_theme.backgroundwhite,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          top: 30,
          right: 24,
          bottom: 30,
          child: Column(
            children: [
              Container(
                width: 34,
                height: 34,
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: App_theme.backgroundwhite,
                ),
                child: SvgPicture.asset(
                  'assets/icons/manger.svg',
                  width: 16,
                  height: 16,
                  color: App_theme.primary,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Manage',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                  color:  App_theme.backgroundwhite,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
