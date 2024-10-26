// ignore_for_file: avoid_print

import 'package:http/http.dart' as http;
import 'news_model.dart';

class ApiService {
  final String apiUrl =
      "https://api.apileague.com/retrieve-top-news?api-key=ebceffccc9ad4dd0aac46b8d1c0a58a3&source-country=us&language=en&date=2024-06-11"; // Replace with your actual API URL

  Future<TopNews?> fetchTopNews() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        return topNewsFromJson(response.body);
      } else {
        print("Failed to load news: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print("Error: $e");
      return null;
    }
  }
}
