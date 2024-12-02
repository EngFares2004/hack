import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/configuration/theme.dart';
import '../bloc/profillecubit/profille_cubit.dart';
import '../models/profile_model.dart';
import '../widgets/profile_item_tile.dart';
import '../widgets/profile_user_header.dart';
import '../widgets/profile_wallet.dart';


class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserDataCubit>(
      create: (context) => UserDataCubit()..loadUserData(),
      child: Scaffold(
        backgroundColor: App_theme.backgroundwhite,
        appBar: AppBar(
          centerTitle: false,

          title: const Text(
            'Profile',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          backgroundColor:Colors.transparent,
          elevation: 0,
        ),
        body: BlocBuilder<UserDataCubit, UserDataState>(
          builder: (context, state) {
            if (state is UserDataLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is UserDataError) {
              return Center(child: Text('Error: ${state.message}'));
            } else if (state is UserDataState) {
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    children: [
                      const SizedBox(height: 24),
                      ProfileHeader(username: state.username, email: state.email),
                      const SizedBox(height: 24),
                      const SizedBox(height: 32),
                      ProfileDesign(items: items),
                    ],
                  ),
                ),
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}

