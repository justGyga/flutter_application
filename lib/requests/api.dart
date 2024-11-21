import 'package:http/http.dart' as http;
import 'dart:convert';

Future<Map<String, dynamic>> getNasaData() async {
  const String name = 'curiosity';
  const int sol = 1000;
  const String apiKey = 'DEMO_KEY';
  Uri url = Uri.parse(
          'https://api.nasa.gov/mars-photos/api/v1/rovers/${name}/photos?sol=${sol}&api_key=${apiKey}');
  final response = await http.get(url);

  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    print("Error");
    print(response.reasonPhrase);
    throw Exception('Error ${response.reasonPhrase}');
  }
}
