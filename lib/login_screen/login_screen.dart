import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_api_app/login_screen/login.dart';
import 'package:login_api_app/login_screen/widget/custom_reactive_textfield.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../home_screen/home_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocListener<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state.success) {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()));
            } else if (state.errorMessage != null) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.errorMessage!)),
              );
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ReactiveForm(
                  formGroup: BlocProvider.of<LoginBloc>(context).loginForm,
                  child: Column(
                    children: [
                      const CustomTextField(
                        formControlName: 'username',
                        labelText: 'Username',
                        validationMessage: 'Username is required',
                      ),
                      const CustomTextField(
                        formControlName: 'password',
                        labelText: 'Password',
                        validationMessage: 'Password is required',
                      ),
                      const SizedBox(height: 20),
                      BlocBuilder<LoginBloc, LoginState>(
                          builder: (context, state) {
                        return GestureDetector(
                          onTap: () {
                            final form =
                                BlocProvider.of<LoginBloc>(context).loginForm;
                            if (form.valid) {
                              final username = form.control('username').value;
                              final password = form.control('password').value;
                              BlocProvider.of<LoginBloc>(context).add(
                                CallLoginApi(
                                    userName: username, password: password),
                              );
                            } else {
                              form.markAllAsTouched();
                            }
                          },
                          child: Container(
                            width: 250,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color(0xff0B7D05),
                            ),
                            child: Center(
                              child: state.loading
                                  ? const CircularProgressIndicator(
                                      color: Colors.white,
                                    )
                                  : Text(
                                      'Login',
                                      style: GoogleFonts.roboto(
                                        color: Colors.white,
                                      ),
                                    ),
                            ),
                          ),
                        );
                      })
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
