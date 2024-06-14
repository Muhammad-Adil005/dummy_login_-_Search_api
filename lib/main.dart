import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_api_app/home_screen/home_bloc.dart';
import 'package:login_api_app/login_screen/login_bloc.dart';
import 'package:login_api_app/login_screen/login_screen.dart';

import 'db/user/dao.dart';
import 'db/user/table.dart';
import 'home_screen/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  bool isLoggedIn = await checkLoginStatus();

  //runApp(const MyApp());
  runApp(MyApp(isLoggedIn: isLoggedIn));
}

Future<bool> checkLoginStatus() async {
  UserTable? user = await UserDao.get().getLoggedUser();
  return user != null;
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;
  const MyApp({super.key, required this.isLoggedIn});

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
        // home: LoginScreen(),
        home: isLoggedIn ? const HomeScreen() : const LoginScreen(),
      ),
    );
  }
}
