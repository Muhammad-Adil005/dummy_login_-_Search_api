import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:login_api_app/fake_store_product/fake-store_product_screen.dart';
import 'package:login_api_app/home_screen/home.dart';
import 'package:path/path.dart';

import '../falaya/falaya_screen.dart';
import '../login_screen/login_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController searchController;
  File? _imageFile;
  bool _isUploading = false;

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  Future<void> _captureImageFromCamera() async {
    final imagePicker = ImagePicker();
    final XFile? image = await imagePicker.pickImage(
      source: ImageSource.camera,
    );
    if (image != null) {
      setState(() {
        _imageFile = File(image.path);
      });
    }
  }

  Future<void> _uploadImage(File imageFile) async {
    setState(() {
      _isUploading = true;
    });

    try {
      final dio = Dio();
      final fileName = basename(imageFile.path);
      final formData = FormData.fromMap({
        'file':
            await MultipartFile.fromFile(imageFile.path, filename: fileName),
      });

      final response = await dio.post(
        //'http://ip:8082/composer/predict',
        //'https://jsonplaceholder.typicode.com/',
        'https://reqres.in/api/users',
        data: formData,
      );

      if (response.statusCode == 200) {
        print('Upload successful: ${response.data}');
      } else {
        print('Upload failed: ${response.statusCode}');
      }
    } catch (e) {
      print('Error uploading image: $e');
    } finally {
      setState(() {
        _isUploading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(),
      child: BlocConsumer<HomeBloc, HomeState>(listener: (context, state) {
        if (state.loggedOut) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              duration: Duration(seconds: 1),
              content: Text('Logged out successfully'),
            ),
          );
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const LoginScreen()),
          );
        }
      }, builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FalayaScreen(),
                  ),
                );
              },
              child: const Text('HomeScreen'),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  BlocProvider.of<HomeBloc>(context).add(Logout());
                },
                icon: const Icon(Icons.logout),
              ),
            ],
            leading: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FakeStoreProductScreen(),
                    ),
                  );
                },
                child: const Icon(Icons.near_me)),
          ),
          body: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (state.loading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state.errorMessage != null &&
                  state.errorMessage!.isNotEmpty) {
                return Center(
                  child: Text(state.errorMessage!),
                );
              }
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
                          ),
                        ),
                        const SizedBox(width: 10),
                        GestureDetector(
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
                            child: const Center(
                              child: Text(
                                'Search',
                                style: TextStyle(
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
                    const SizedBox(height: 10),
                    Expanded(
                      child: state.posts.isEmpty
                          ? const Center(
                              child: Text(
                                'No Result Found',
                                textAlign: TextAlign.center,
                              ),
                            )
                          : Column(
                              children: [
                                Expanded(
                                  child: ListView.builder(
                                    itemCount: state.posts.length,
                                    itemBuilder: (context, index) {
                                      final post = state.posts[index];
                                      return Card(
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 10),
                                        child: Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                post.title,
                                                style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              const SizedBox(height: 4),
                                              Text(post.body),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                if (_imageFile != null) ...[
                                  Container(
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    height: 200,
                                    child: Image.file(
                                      _imageFile!,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  _isUploading
                                      ? const Center(
                                          child: CircularProgressIndicator())
                                      : ElevatedButton(
                                          onPressed: () {
                                            _uploadImage(_imageFile!);
                                          },
                                          child: const Text('Save'),
                                        ),
                                ] else ...[
                                  GestureDetector(
                                    onTap: _captureImageFromCamera,
                                    child: Container(
                                      height: 50,
                                      width: 70,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.blueAccent,
                                      ),
                                      child: const Center(
                                        child: Icon(
                                          Icons.camera_alt,
                                          color: Colors.white,
                                          size: 40,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ],
                            ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      }),
    );
  }
}
