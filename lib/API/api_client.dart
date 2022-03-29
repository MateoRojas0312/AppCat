import 'package:catapp/models/breeds.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class ApiService {
  String apiKey = 'bda53789-d59e-46cd-9bc4-2936630fde39';

  Future<List<Breeds>> getAllBreeds() async {
    try {
      var response = await http.get(
        Uri.parse('https://api.thecatapi.com/v1/breeds'),
        headers: {
          "x-api-key": apiKey,
        },
      );
      return breedsFromJson(response.body);
    } on DioError {
      rethrow;
    }
  }
}
