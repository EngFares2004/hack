import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PhoneInputField extends StatelessWidget {
  final bool isError;
  final TextEditingController controller;

  const PhoneInputField({
    super.key,
    this.isError = false,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Container(
        width: double.infinity,
        height: 56,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isError ? Colors.red : const Color(0xffBFBFBF),
          ),
        ),
        child: TextField(
          controller: controller,
          keyboardType: TextInputType.phone, // تعيين لوحة المفاتيح للأرقام فقط
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly, // السماح فقط بالأرقام
            LengthLimitingTextInputFormatter(15), // تحديد الحد الأقصى لعدد الأحرف (مثلاً 15 رقمًا)
          ],
          decoration: InputDecoration(
            hintText: 'Enter phone number',
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
            hintStyle: const TextStyle(color: Color(0xffBFBFBF)),
            errorText: isError ? "رقم الهاتف غير صحيح" : null, // يمكن تعديل الرسالة هنا
          ),
          onChanged: (text) {
            // التحقق من طول الرقم سيتم في مكان آخر الآن.
          },
        ),
      ),
    );
  }
}

