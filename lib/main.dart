import 'package:assignment/data/repositories/user_repository.dart';
import 'package:assignment/frontend/routes/app_router.dart';
import 'package:flutter/material.dart';

void main() async {
  UserRepository userRepository = const UserRepository(); //user repository
  runApp(MyApp(
    userRepository: userRepository,
  ));
}

class MyApp extends StatelessWidget {
  final UserRepository userRepository;
  const MyApp({super.key, required this.userRepository});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      onGenerateRoute: (settings) {
        return AppRouter.onGenerateRoute(settings, userRepository); //Generated routes
      },
    );
  }
}
