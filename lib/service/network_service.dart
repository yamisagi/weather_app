import 'dart:developer';

import 'package:http/http.dart' as http;

class NetworkService {
  String url;
  NetworkService(this.url);

  Future<http.Response> fetchData() async {
    try {
      http.Response data = await http.get(Uri.parse(url));
      if (data.statusCode == 200) {
        log(data.body);

        return data;
      } else {
        throw Exception();
      }
    } catch (e) {
      log(e.toString());
      throw 'Failed to load';
    }
  }
}
