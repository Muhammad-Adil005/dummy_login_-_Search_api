import 'package:flutter/material.dart';

import 'db/user/dao.dart';
import 'db/user/table.dart';
import 'home_screen/home_screen.dart';
import 'login_screen/login_screen.dart';

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
    return MaterialApp(
      scrollBehavior: const ScrollBehavior().copyWith(overscroll: false),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      // home: LoginScreen(),
      home: isLoggedIn ? const HomeScreen() : const LoginScreen(),
    );
  }
}
