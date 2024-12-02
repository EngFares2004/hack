import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/bloc/forgetpasswordbloc/forgot_state.dart';
import 'forgot_event.dart';


class ForgetBloc extends Bloc<AppEvent, AppState> {
  ForgetBloc() : super(InitialState())
  {
    on<ForgetEvent>(Forget);
  }

   TextEditingController emailaddressController = TextEditingController();

  void Forget (ForgetEvent event,Emitter emit )async{
    emit(LoadingState());
    try{
      await _loginRequest(event.emailaddress);
      emit(SuccessState(data: "login Success"));
    }
    catch(e){
      emit(ErrorState(message: e.toString()));

    }


  }
  Future<void> _loginRequest(String username,) async{
    await Future.delayed(Duration(seconds: 5));

  }
}
