import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_api_app/home_screen/home_bloc.dart';
import 'package:login_api_app/login_screen/login_bloc.dart';
import 'package:login_api_app/login_screen/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(
          lazy: false,
          create: (context) => LoginBloc(),
        ),
        BlocProvider<HomeBloc>(
          lazy: false,
          create: (context) => HomeBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: const LoginScreen(),
      ),
    );
  }
}
