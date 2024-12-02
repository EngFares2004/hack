import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/singupbloc/singup.dart';
import 'customer_text_field.dart';
class SingUpForFields extends StatelessWidget {
  SingUpForFields({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<SignupBloc>(context);
    return Form(
      key: bloc.formKey,
      child: Column(
        children: [
          CustomTextField(
            hintText: 'Full Name',
            keyboardType: TextInputType.name,
            controller: bloc.usernameController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your full name';
              }
              return null;
            },
          ),
          CustomTextField(
            hintText: 'Email Address',
            keyboardType: TextInputType.emailAddress,
            controller: bloc.emailController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
              if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                return 'Enter a valid email address';
              }
              return null;
            },
          ),
          CustomTextField(
            controller: bloc.mobileController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your phone number';
              }
              return null;
            }, hintText: 'phone number',
          ),
          CustomTextField(
            hintText: 'Password',
            controller: bloc.passwordController,
            isPassword: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a password';
              }
              if (value.length < 6) {
                return 'Password must be at least 6 characters';
              }
              return null;
            },
          ),
          CustomTextField(
            hintText: 'Confirm Password',
            controller: bloc.confirmPasswordController,
            isPassword: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please confirm your password';
              }
              if (value != bloc.passwordController.text) {
                return 'Passwords do not match';
              }
              return null;
            },
          ),
          const CustomTextField(
            hintText: 'Enter referral code (Optional)',
          ),

        ],
      ),
    );
  }
}
