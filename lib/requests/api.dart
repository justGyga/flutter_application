import 'package:http/http.dart' as http;
import 'dart:convert';

Future<Map<String, dynamic>> getNasaData() async {
  Uri url = Uri.parse(
      'https://api.nasa.gov/mars-photos/api/v1/rovers/opportunity/photos?sol=150&camera=fhaz&api_key=DEMO_KEY');
  final response = await http.get(url);

  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    print("Error");
    print(response.reasonPhrase);
    throw Exception('Error ${response.reasonPhrase}');
  }
}
