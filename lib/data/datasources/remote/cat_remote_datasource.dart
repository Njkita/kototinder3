import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../models/cat_model.dart';

abstract class CatRemoteDataSource {
  Future<Cat> fetchRandomCat();
}

class CatRemoteDataSourceImpl implements CatRemoteDataSource {
  final String _baseUrl = 'https://api.thecatapi.com/v1';
  
  @override
  Future<Cat> fetchRandomCat() async {
    final response = await http.get(
      Uri.parse('$_baseUrl/images/search?has_breeds=1'),
      headers: {'x-api-key': 'live_Kf9mXhXnqd05Dyjk11mUq5eNoWgHyXw4YtEqIfwbPuGTfSjsUaNEEQ4s0TfPXiBe'},
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return Cat.fromJson(data[0]);
    } else {
      throw Exception('Failed to load cat');
    }
  }
}