import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled1/models/user_data.dart';
import '../../configuration/shared_keys.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<AppEvent, AppState> {
  LoginBloc() : super(InitialState()) {
    on<LoginEvent>(_handleLogin);
  }

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void _handleLogin(LoginEvent event, Emitter<AppState> emit) async {
    if (event.username.isEmpty || event.password.isEmpty) {
      emit(FailureState(error: 'Email and password cannot be empty.'));
      return;
    }

    emit(LoadingState());

    try {

      await _savePreferences(UserData(username: event.username, email: '', mobile: '', password: '', passwordConfirmation: ''), 'dummy_token');
      emit(SuccessState(data: "Login Success"));
    } catch (e) {
      emit(FailureState(error: 'Login failed: ${e.toString()}'));
    }
  }


  Future<void> _savePreferences(UserData user, String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(SharedKeys.islogin, true);
    String jsonData = jsonEncode(user.toJson());
    prefs.setString(SharedKeys.user, jsonData);
    prefs.setString(SharedKeys.token, token);
  }
}
