import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/bloc/forgetpasswordbloc/forgot.dart';
import 'package:untitled1/bloc/forgetpasswordbloc/forgot_event.dart';
import 'package:untitled1/widgets/customer_text_field.dart';
import '../bloc/forgetpasswordbloc/forgot_state.dart';
import '../configuration/theme.dart';
import '../widgets/auth_custom_appbar.dart';
import 'bottombarNavigator.dart';
import 'login_screen.dart';


class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final TextEditingController emailaddressController = TextEditingController();
  bool isError = false;

    String? isEmailValid(String?email) {
    const pattern =
        r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    final regex = RegExp(pattern);
    if (email!.isEmpty){
      return "Please Enter The Email";
    }
    else if (!regex.hasMatch(email)){
      return "Please Enter A Valid Email";
    }
    return null;
  }
  @override
  Widget build(BuildContext context) {
      GlobalKey<FormState> key = GlobalKey();
    return Scaffold(
      backgroundColor: App_theme.backgroundwhite,
      body: BlocProvider(
        create: (context) => ForgetBloc(),
        child: Form(
          key: key,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AuthCustomApppBar(

                icon: Icons.arrow_back_ios_outlined,
                  onIconTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  LoginScreen()),
                    );
                  }, logo: 'assets/images/frame2.png',
              ),
              Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    const Text('Forgot Password', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: App_theme.black),),
                    const SizedBox(height: 4),
                    const Text('We’ll Send the link to the email you’ll provide below', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color:App_theme.hinttextcolor),),
                    const SizedBox(height: 24),
                    CustomTextField(hintText: 'Email Address', controller: emailaddressController, isError: isError, validator: isEmailValid,),
                    if (isError)
                      const Padding(
                        padding: EdgeInsets.only(top: 8.0),
                        child: Text('Please enter a valid email.', style: TextStyle(color: App_theme.error, fontSize: 12,),),
                      ),
                    const SizedBox(height: 24),
                    SizedBox(
                      height: 50,
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: BlocBuilder<ForgetBloc, AppState>(
                        builder: (context, state) {
                          if (state is LoadingState) {
                            return const Center(
                              child: CircularProgressIndicator(
                                color: App_theme.primary,
                              ),
                            );
                          }
                          if (state is SuccessState) {
                            print('emailaddress: ${emailaddressController.text}');
                            WidgetsBinding.instance.addPostFrameCallback((_) {
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(builder: (context) => BottomBarNavigator()),
                                    (route) => false,
                              );
                            });
                          }
                          return ElevatedButton(
                            onPressed: () {
                              String email = emailaddressController.text;
                              if (key.currentState!.validate()) {
                                setState(() {
                                  isError = false;
                                });
                                BlocProvider.of<ForgetBloc>(context).add(
                                  ForgetEvent(
                                    emailaddress: email,
                                  ),
                                );
                              } else {
                                setState(() {
                                  isError = true;
                                });
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: App_theme.primary,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: const Text(
                              'Send the reset link',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: App_theme.backgroundwhite,
                              ),
                            ),
                          );
                        },
                      ),
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


