import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserDataState {
  final String username;
  final String email;

  UserDataState({required this.username, required this.email});
}

class UserDataLoading extends UserDataState {
  UserDataLoading() : super(username: 'Loading...', email: 'Loading...');
}

class UserDataError extends UserDataState {
  final String message;

  UserDataError(this.message) : super(username: 'Error', email: 'Error');
}

class UserDataCubit extends Cubit<UserDataState> {
  UserDataCubit() : super(UserDataState(username: 'Unknown', email: 'Unknown'));

  // Get data from sharedpreferences
  Future<void> loadUserData() async {
    try {
      emit(UserDataLoading()); // Emit loading state

      SharedPreferences prefs = await SharedPreferences.getInstance();
      String username = prefs.getString('username') ?? 'Unknown';
      String email = prefs.getString('email') ?? 'Unknown';

      emit(UserDataState(username: username, email: email)); // Emit loaded data
    } catch (e) {
      emit(UserDataError('Failed to load user data')); // Emit error state
    }
  }
}
