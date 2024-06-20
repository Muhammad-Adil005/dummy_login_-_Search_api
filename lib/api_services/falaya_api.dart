import 'package:dio/dio.dart';

class ApiService {
  //Future<dynamic> getFalayaList() async {
  Future<List<dynamic>> getFalayaList() async {
    try {
      Response response = await Dio().get(
        'https://devapi.falaya.com/api/listings/search/all?start=0&size=20&min_price=0&max_price=max&min_bedrooms=0&max_bedrooms=10&dwelling_type=%5B%22House%22,%22Condo%22,%22Townhouse%22,%22Multiple%20Family%22,%22Land%22%5D&listing_status=%5B%22For%20Sale%22%5D&min_baths=0&max_baths=10&sort_by=price&sort_type=desc&addressList=&cityList=&chipList',
      );
      print('Response : $response');
      if (response.statusCode == 200) {
        return response.data['data'];
        //return response.data;
      } else {
        print('Error: ${response.statusCode} - ${response.statusMessage}');
        throw Exception('Failed to load data');
      }
    } catch (error) {
      throw Exception('Failed to authenticate');
    }
  }
}
