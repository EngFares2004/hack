import 'package:flutter/material.dart';
import '../configuration/theme.dart';
class ProfileHeader extends StatelessWidget {
  final String username;
  final String email;

  const ProfileHeader({Key? key, required this.username, required this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 25,
          backgroundColor: App_theme.primary,
          child: Center(
            child: Text(
              username[0],
              style: const TextStyle(fontSize:25, color: App_theme.backgroundwhite),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              username,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 4),
            Text(
              email,
              style: const TextStyle(fontSize: 14, color: App_theme.hinttextcolor),
            ),
          ],
        ),
      ],
    );
  }
}
