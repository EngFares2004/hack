import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/cupertino.dart';
import '../../configuration/end_point.dart';
import '../../models/user_data.dart';
import '../../configuration/shared_keys.dart';
import '../../shared_handler/shared_handler.dart';
import 'signup_event.dart';
import 'signup_state.dart';

class SignupBloc extends Bloc<AppEvent, AppState> {

  SignupBloc() : super(InitialState()) {
    on<SignupEvent>(_signup);
  }

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final Dio dio = Dio(
    BaseOptions(
      headers: {"Accept": "application/json"},
    ),
  );

  void _signup(SignupEvent event, Emitter<AppState> emit) async {
    emit(LoadingState());
    UserData userData = event.userData;

    try {
      Response response = await dio.post(
        AppEndPoint.register,
        data: userData.toJson(),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final String? token = response.data['access_token'];
        if (token != null) {
          await SharedHandler.instance.setData(SharedKeys.token, token);
          await SharedHandler.instance.setData(SharedKeys.user, userData.toJson().toString());
          await SharedHandler.instance.setData(SharedKeys.islogin, 'true');
        }
        emit(SuccessState(data: 'Registration successful.'));
      } else {
        emit(FailureState(error: 'Registration failed. Response: ${response.data['message'] ?? 'Unknown error'}'));
      }
    } on DioException catch (e){
      log('statusCode: ${e.response!.statusCode}');
      log('Dio exception: ${e.stackTrace}');
      log('message: ${e.message}');
      log('error: ${e.error.toString()}');
      log('token headers: ${e.response!.headers.value('Accept')}');
      log('headers: ${e.response!.requestOptions.headers}');
      log('headers map: ${e.response!.headers.map}');
      log('data: ${e.response!.data}');
      emit(FailureState(error: 'Registration failed. Response: ${e.response!.data['message'] ?? 'Unknown error'}'));
    }

    catch (e) {
      emit(FailureState(error: 'Network error: ${e.toString()}. Please check your connection.'));
    }

  }

  }
