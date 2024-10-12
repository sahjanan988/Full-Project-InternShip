import 'package:http/http.dart' as http;

Future<void> fetchData() async {
  final url =  Uri.parse(apiUrl);
  try {
    final response = await http.get(Uri.parse(url)); 

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      // Process the data here
      print(data);
    } else {
      // Handle error
      print('Error: ${response.statusCode}');
    }
  } catch (error) {
    // Handle network or other errors
    print('Error: $error');
  }
}
