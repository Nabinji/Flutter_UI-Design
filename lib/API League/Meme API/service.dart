import 'package:http/http.dart' as http;
import 'meme_model.dart';

class ApiService {
  final String apiUrl =
      "https://api.apileague.com/retrieve-random-meme?api-key=ebceffccc9ad4dd0aac46b8d1c0a58a3&keywords=rocket";

  Future<RandomMeme?> fetchRandomMeme() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        return randomMemeFromJson(response.body);
      } else {
        print("Failed to load meme: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print("Error: $e");
      return null;
    }
  }
}
