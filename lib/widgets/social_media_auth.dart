import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../configuration/theme.dart';

class SocialMediaAuth extends StatelessWidget {
  const SocialMediaAuth({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Container(
                height: 56,
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: const Color(0xff7D16FF).withOpacity(0.10),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/icons/facebook.svg',
                      height: 24,
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      'Facebook',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color:App_theme.primary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Container(
                height: 56,
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: const Color(0xff7D16FF).withOpacity(0.10),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/icons/google.svg',
                      height: 24,
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      'Google',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color:App_theme.primary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        const Row(
          children: [
            Expanded(
              child: Divider(color:App_theme.borderGray, thickness: 1),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18),
              child: Text(
                'OR',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: App_theme.primary,),
              ),
            ),
            Expanded(
              child: Divider(color: App_theme.borderGray, thickness: 1),
            ),
          ],
        ),
      ],
    );
  }
}
