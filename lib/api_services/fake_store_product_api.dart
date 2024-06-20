import 'package:dio/dio.dart';

class ApiService {
  Future<dynamic> fakeStoreProducts() async {
    try {
      Response response = await Dio().get(
        'https://fakestoreapi.com/products/',
      );
      if (response.statusCode == 200) {
        return response.data;
      }
    } catch (error) {
      throw Exception('Failed to authenticate');
    }
  }
}
