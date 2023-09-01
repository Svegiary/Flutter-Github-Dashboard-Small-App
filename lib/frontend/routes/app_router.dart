import 'package:assignment/data/repositories/user_repository.dart';
import 'package:assignment/frontend/pages/profile.dart';
import 'package:assignment/logic/repo_tab_cubit/repo_tab_cubit.dart';
import 'package:assignment/logic/tab_bar_cubit/tabbar_cubit.dart';
import 'package:assignment/logic/user_cubit/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../pages/homepage.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings, UserRepository userRepository) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => const MyHomePage(),
        );

      case '/profile':
        final String username = settings.arguments as String; //support arguments
        return MaterialPageRoute(
            builder: (context) => MultiBlocProvider(
                  //bloc providers
                  providers: [
                    BlocProvider(
                      //users
                      create: (context) => UserCubit(userRepository: userRepository, username: username),
                    ),
                    BlocProvider(
                      //tab bar
                      create: (context) => TabbarCubit(),
                    ),
                    BlocProvider(
                      //repository tab cubit(sorting)
                      create: (context) => RepoTabCubit(),
                    )
                  ],
                  child: ProfilePage(username: username),
                ));

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text('Error: Route not found'),
            ),
          ),
        );
    }
  }
}
