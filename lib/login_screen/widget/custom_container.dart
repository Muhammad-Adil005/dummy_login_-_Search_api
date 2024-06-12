// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:login_api_app/login_screen/login.dart';
// import 'package:reactive_forms/reactive_forms.dart';
//
// class CustomContainer extends StatelessWidget {
//   final FormGroup form;
//   final bool loading;
//
//   const CustomContainer({
//     super.key,
//     required this.form,
//     required this.loading,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         if (form.valid) {
//           final username = form.control('username').value as String;
//           final password = form.control('password').value as String;
//           BlocProvider.of<LoginBloc>(context).add(
//             CallLoginApi(userName: username, password: password),
//           );
//         } else {
//           form.markAllAsTouched();
//         }
//       },
//       child: Container(
//         width: 250,
//         height: 50,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(20),
//           color: const Color(0xff0B7D05),
//         ),
//         child: Center(
//           child: loading
//               ? const CircularProgressIndicator(
//                   color: Colors.white,
//                 )
//               : Text(
//                   'Login',
//                   style: GoogleFonts.roboto(
//                     color: Colors.white,
//                   ),
//                 ),
//         ),
//       ),
//     );
//   }
// }
