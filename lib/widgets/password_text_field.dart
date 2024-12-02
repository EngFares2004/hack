import 'package:flutter/material.dart';

import '../configuration/theme.dart';

class PasswordTextField extends StatefulWidget {
  final String hintText;

  const PasswordTextField({super.key, required this.hintText, required TextEditingController controller});

  @override
  _PasswordTextFieldState createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _isObscured = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextField(

        obscureText: _isObscured,
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: const TextStyle(color: App_theme.bordercolor),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              color: App_theme.bordercolor,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              color:App_theme.bordercolor,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              color:App_theme.primary,
            ),
          ),
          suffixIcon: IconButton(
            icon: Icon(
              _isObscured ? Icons.visibility_off : Icons.visibility,
              color: App_theme.primary,
            ),
            onPressed: () {
              setState(() {
                _isObscured = !_isObscured;
              });
            },
          ),
        ),
      ),
    );
  }
}
