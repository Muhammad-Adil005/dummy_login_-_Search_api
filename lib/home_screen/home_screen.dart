// home_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_api_app/home_screen/home.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('HomeScreen'),
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Center(
            child: GestureDetector(
              onTap: () {
                BlocProvider.of<HomeBloc>(context).add(PerformSearch('qui'));
              },
              child: Text(
                'Search',
                style: GoogleFonts.roboto(
                  fontSize: 30,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
