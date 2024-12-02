import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../configuration/theme.dart';

class VoucherTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController? voucherController;
  final bool isError;
  final TextInputType keyboardType;
  final String? prefixIconPath; // SVG path
  final Widget? suffixIcon;

  const VoucherTextField({
    super.key,
    required this.hintText,
    this.voucherController,
    this.isError = false,
    this.keyboardType = TextInputType.text,
    this.prefixIconPath,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextField(
        controller: voucherController,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: App_theme.bordercolor),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: isError ? App_theme.error : App_theme.bordercolor,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: isError ? App_theme.error : App_theme.bordercolor,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: isError ? App_theme.error : App_theme.primary, // هنا يتم استخدام اللون البرايمري عند التركيز
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              color: App_theme.error,
            ),
          ),
          prefixIcon: prefixIconPath != null
              ? Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset(
              prefixIconPath!,
              width: 24,
              height: 24,
            ),
          )
              : null,
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}
