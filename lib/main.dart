import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users_app_bloc/repository/users/users_repository_impl.dart';
import 'package:users_app_bloc/ui/screens/users_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: RepositoryProvider(
          create: (context) => UsersRepositoryImpl(),
          child: const UsersScreen(),
        ));
  }
}
