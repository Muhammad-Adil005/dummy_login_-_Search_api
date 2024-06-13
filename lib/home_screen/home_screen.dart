import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_api_app/home_screen/home.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();

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
          if (state.errorMessage != null && state.errorMessage!.isNotEmpty) {
            return Center(
              child: Text(state.errorMessage!),
            );
          }
          // if (state.posts.isEmpty) {
          //   return const Center(
          //     child: Text('No Result Found'),
          //   );
          // }
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: TextField(
                        controller: searchController,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(12),
                          hintText: 'Search Here...',
                          border: OutlineInputBorder(),
                        ),
                        onSubmitted: (value) {
                          if (value.isNotEmpty) {
                            BlocProvider.of<HomeBloc>(context)
                                .add(PerformSearch(value));
                          }
                        },
                        // onSubmitted: (value) {
                        //   BlocProvider.of<HomeBloc>(context)
                        //       .add(PerformSearch(value));
                        // },
                      ),
                    ),
                    const SizedBox(width: 10),
                    GestureDetector(
                      // onTap: () {
                      //   BlocProvider.of<HomeBloc>(context)
                      //       .add(PerformSearch('qui'));
                      // },
                      onTap: () {
                        final query = searchController.text;
                        if (query.isNotEmpty) {
                          BlocProvider.of<HomeBloc>(context)
                              .add(PerformSearch(query));
                          searchController.clear();
                        }
                      },
                      child: Container(
                        height: 50,
                        width: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.blueAccent,
                        ),
                        child: Center(
                          child: Text(
                            'Search',
                            style: GoogleFonts.roboto(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                  ],
                ),
                if (state.posts.isEmpty)
                  const Expanded(
                    child: Center(
                      child: Text(
                        textAlign: TextAlign.center,
                        'No Result Found',
                      ),
                    ),
                  )
                else
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.posts.length,
                      itemBuilder: (context, index) {
                        final post = state.posts[index];
                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  post.title,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(post.body),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
