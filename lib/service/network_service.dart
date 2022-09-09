import 'package:http/http.dart' as http;

class NetworkService {
  String url;
  NetworkService(this.url);

  Future<http.Response> fetchData() async {
    try {
      http.Response data = await http.get(Uri.parse(url));
      if (data.statusCode == 200) {
        return data;
      } else {
        throw Exception();
      }
    } catch (e) {
      throw 'Failed to load';
    }
  }
}
