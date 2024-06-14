import 'package:dio/dio.dart';

class ApiService {
  Future<dynamic> fakeStoreProducts() async {
    try {
      Response response = await Dio().post(
        'https://fakestoreapi.com/products/',
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
}
