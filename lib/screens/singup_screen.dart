import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/bloc/singupbloc/singup.dart';
import 'package:untitled1/screens/login_screen.dart';
import '../bloc/singupbloc/signup_event.dart';
import '../bloc/singupbloc/signup_state.dart';
import '../configuration/theme.dart';
import '../models/user_data.dart';
import '../widgets/auth_custom_appbar.dart';
import '../widgets/signup_form_fields.dart';
import '../widgets/social_media_auth.dart';
import 'bottombarNavigator.dart';

class SingupScreen extends StatefulWidget {
  SingupScreen({super.key});
  @override
  _SingupScreenState createState() => _SingupScreenState();
}

class _SingupScreenState extends State<SingupScreen> {
  bool _isAccepted = false;

  void _toggleAcceptance() {
    setState(() {
      _isAccepted = !_isAccepted;
    });
  }

  void _showSnackBar(String message, {Color? backgroundColor}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: const TextStyle(color: App_theme.error),
        ),
        backgroundColor: backgroundColor ?? App_theme.backgroundwhite,
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: App_theme.bordercolor, width: 2),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<SignupBloc>(context);

    return Scaffold(
      body: BlocListener<SignupBloc, AppState>(
        listener: (context, state) {
          if (state is SuccessState) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const BottomBarNavigator()),
                    (route) => false,
              );
            });
          } else if (state is FailureState) {
            _showSnackBar(state.error, backgroundColor: Colors.white);
          }
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              AuthCustomApppBar(logo: 'assets/images/frame2.png',
                icon: Icons.close,
                onIconTap: () {
                  Navigator.pop(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    const Text(
                      'Create New Account',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: App_theme.black),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Have a healthy & Tasty day ahead',
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: App_theme.hinttextcolor),
                    ),
                    const SizedBox(height: 24),
                    const SocialMediaAuth(),
                    const SizedBox(height: 24),
                    SingUpForFields(),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: _toggleAcceptance,
                          child: Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              border: Border.all(color: _isAccepted ? Colors.green : Colors.grey),
                              borderRadius: BorderRadius.circular(5),
                              color: App_theme.backgroundwhite,
                            ),
                            child: _isAccepted
                                ? const Icon(Icons.check, color: App_theme.primary, size: 16)
                                : const SizedBox.shrink(),
                          ),
                        ),
                        const SizedBox(width: 8),
                        RichText(
                          text: const TextSpan(
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: App_theme.black),
                            children: [
                              TextSpan(text: 'I Accept the '),
                              TextSpan(
                                text: 'terms & Conditions',
                                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: App_theme.primary),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: 50,
                      child: BlocBuilder<SignupBloc, AppState>(
                        builder: (context, state) {
                          if (state is LoadingState) {
                            return const Center(
                              child: CircularProgressIndicator(
                                color: App_theme.primary,
                              ),
                            );
                          }
                          return ElevatedButton(
                            onPressed: () {
                              if (!_isAccepted) {
                                _showSnackBar("Please accept the terms and conditions.");
                              } else {
                                if(BlocProvider.of<SignupBloc>(context).formKey.currentState!.validate()){
                                  BlocProvider.of<SignupBloc>(context).add(
                                    SignupEvent(
                                      userData: UserData(
                                        username: bloc.usernameController.text,
                                        email: bloc.emailController.text,
                                        mobile: bloc.mobileController.text,
                                        password: bloc.passwordController.text,
                                        passwordConfirmation: bloc.confirmPasswordController.text,
                                      ),
                                    ),
                                  );
                                }
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: App_theme.primary,
                              minimumSize: const Size(double.infinity, 56),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: const Text(
                              'Create an account',
                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: App_theme.backgroundwhite),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RichText(
                          text: TextSpan(
                            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: App_theme.black),
                            children: [
                              const TextSpan(text: "Already an existing user? "),
                              TextSpan(
                                text: 'Login',
                                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: App_theme.primary),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.pop(
                                      context,
                                      MaterialPageRoute(builder: (context) => LoginScreen()),
                                    );
                                  },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
