// This is the cubit that handles the user data fetching logic

import 'package:assignment/data/repositories/user_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/models/user.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final UserRepository userRepository;
  final String username;
  UserCubit({required this.userRepository, required this.username}) : super(NoUser()) {
    searchUser();
  }

  void searchUser() async {
    emit(UserLoading());
    final GithubUser? user = await userRepository.getUserInfo(username); //get the user information
    if (user == null) {
      //if the request was not successful
      emit(HttpError()); //http error state
    } else {
      //else
      if (user.username == "No User") {
        //if the user was not found
        emit(UserNotFound()); //user not found state
      } else {
        emit(UserLoaded(user: user)); //user found state and add the user to the state
      }
    }
  }
}
