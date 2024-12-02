import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/bloc/loginbloc/login.dart';
import 'package:untitled1/bloc/singupbloc/singup.dart';
import 'package:untitled1/screens/singup_screen.dart';
import '../bloc/loginbloc/login_event.dart';
import '../bloc/loginbloc/login_state.dart';
import '../configuration/theme.dart';
import '../widgets/auth_custom_appbar.dart';
import '../widgets/customer_text_field.dart';
import '../widgets/social_media_auth.dart';
import 'bottombarNavigator.dart';
import 'forgetpassword_screen.dart';
class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => LoginBloc(),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             AuthCustomApppBar( logo:'assets/images/login.png' ,),
              Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    const Text(
                      'Welcome Back!',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color:App_theme.primary),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Have a healthy & Tasty day ahead',
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: App_theme.hinttextcolor),
                    ),
                    const SizedBox(height: 24),
                    const SocialMediaAuth(),
                    const SizedBox(height: 24),
                    CustomTextField(
                      hintText: 'Email Address',
                      controller: emailController,
                    ),
                    CustomTextField(
                      hintText: 'Password',
                      isPassword: true,
                      controller: passwordController,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const ForgetPassword()),
                          );
                        },
                        child: const Text(
                          'Forget Password?',
                          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: App_theme.primary,),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    SizedBox(
                      height: 50,
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: BlocBuilder<LoginBloc, AppState>(
                        builder: (context, state) {
                          if (state is LoadingState) {
                            return const Center(
                              child: CircularProgressIndicator(
                                color: App_theme.primary,
                              ),
                            );
                          }
                          if (state is SuccessState) {
                            print('email: ${emailController.text}');
                            print('Password: ${passwordController.text}');
                            {
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(builder: (context) => const BottomBarNavigator()),
                                    (route) => false,
                              );
                            }
                          }
                          if (state is FailureState) {
                            WidgetsBinding.instance.addPostFrameCallback((_) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    'Please enter both email and password', style: TextStyle(color: App_theme.error, fontSize: 14, fontWeight: FontWeight.bold),),
                                  backgroundColor: App_theme.backgroundwhite,
                                  behavior: SnackBarBehavior.floating,
                                  margin: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                                ),
                              );
                            });
                          }
                          return ElevatedButton(
                            onPressed: () {
                              BlocProvider.of<LoginBloc>(context).add(
                                LoginEvent(
                                  username: emailController.text,
                                  password: passwordController.text,
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: App_theme.primary,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: const Text(
                              'Login',
                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color:App_theme.backgroundwhite),
                            ),
                          );
                        },
                      ),
          
                    ),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don’t have an account? ",
                          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: App_theme.black),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => BlocProvider(
                                  create: (context) => SignupBloc(),
                                  child: SingupScreen())),
                            );
                          },
                          child: const Text(
                            'Create new one',
                            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color:App_theme.primary),
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

