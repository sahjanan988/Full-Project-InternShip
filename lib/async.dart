import 'dart:async';

Future<String> fetchData() async {
  await Future.delayed(Duration(seconds: 2));
  return 'Data fetched!';
}

void main() async {
  String data = await fetchData();
  print(data);
}