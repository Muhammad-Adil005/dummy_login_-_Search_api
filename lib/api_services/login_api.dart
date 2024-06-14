import 'dart:io';

import 'package:dio/dio.dart';

class ApiService {
  Future<dynamic> authenticate(String username, String password) async {
    Map<String, dynamic> requestBody = {
      'username': username,
      'password': password,
    };
    try {
      Response response = await Dio().post(
        'https://jsonplaceholder.typicode.com/users',
        data: requestBody,
      );
      // print('ApiService Response Data: ${response.data}');

      if (response.statusCode == 201) {
        return response.data;
      }
    } catch (error) {
      print('ApiService Error: $error');
      throw Exception('Failed to authenticate');
    }
  }

  Future<dynamic> searchPosts(String query) async {
    try {
      Response response = await Dio().get(
        'https://jsonplaceholder.typicode.com/posts?q=$query',
      );
      if (response.statusCode == 200) {
        return response.data;
      }
    } catch (error) {
      throw Exception('Failed to search: $error');
    }
  }

  Future<void> uploadImage(File imageFile) async {
    const String apiUrl = 'https://jsonplaceholder.typicode.com/photos';

    try {
      FormData formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(imageFile.path),
      });

      Response response = await Dio().post(apiUrl, data: formData);

      if (response.statusCode == 201) {
        print('Image uploaded successfully: ${response.data}');
      } else {
        print('Failed to upload image: ${response.statusCode}');
        throw Exception('Failed to upload image');
      }
    } catch (e) {
      print('Error uploading image: $e');
      throw Exception('Error uploading image: $e');
    }
  }
}
