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
      // if (response.statusCode == 200) {
      //   return (response.data as List)
      //       .map((json) => Post.fromJson(json))
      //       .toList();
      // }
      //print('Response dara inside searchPosts : ${response.data}');
    } catch (error) {
      throw Exception('Failed to search: $error');
    }
  }

  // Future<List<Post>> fetchPosts() async {
  //   try {
  //     Response response = await Dio().get(
  //       'https://jsonplaceholder.typicode.com/posts',
  //     );
  //     if (response.statusCode == 200) {
  //       return (response.data as List)
  //           .map((json) => Post.fromJson(json))
  //           .toList();
  //     } else {
  //       throw Exception('Failed to fetch posts');
  //     }
  //   } catch (error) {
  //     throw Exception('Failed to fetch posts: $error');
  //   }
  // }
}
