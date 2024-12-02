import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../models/profile_model.dart';

class ProfileDesign extends StatelessWidget {
  final List<ProfileItem> items;

  const ProfileDesign({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(items.length, (index) {
        ProfileItem item = items[index];
        return Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        item.icon,
                        width: 24,
                        height: 24,
                        color: Theme.of(context).primaryColor,
                      ),
                      const SizedBox(width: 16),
                      Text(
                        item.text,
                        style: TextStyle(
                          fontSize: 16,
                          color: (item.text == 'Logout') ? Theme.of(context).primaryColor.withOpacity(0.50) : Colors.black,
                        ),
                      ),
                    ],
                  ),
                  const Icon(
                    Icons.arrow_forward_ios,
                    size: 24,
                    color: Color(0xffBFBFBF),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 7.5),
            const Divider(
              color: Color(0xffBFBFBF),
            ),
            const SizedBox(height: 7.5),
          ],
        );
      }),
    );
  }
}
