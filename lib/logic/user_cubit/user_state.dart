//These are the sates for the user search cubit
part of 'user_cubit.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class NoUser extends UserState {} //No user is searched for

class UserLoading extends UserState {} //fetching user info

class UserLoaded extends UserState {
  //user found
  final GithubUser user;
  const UserLoaded({
    required this.user,
  });
}

class UserNotFound extends UserState {} //user does not exist

class HttpError extends UserState {} //http request failed
