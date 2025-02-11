import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/sourceResponse.dart';

import '../model/sourceResponse.dart';
import 'api_constants.dart';
import 'end_points.dart';


class ApiManager {
//   https://newsapi.org/v2/top-headlines/sources?apiKey=a28b23360f55408d8d5c4f99187544df
  static Future<SourceResponse?> getSources() async {
    Uri url = Uri.https(ApiConstants.baseUrl, EndPoints.sourcesApi,
        {'apiKey': ApiConstants.apiKey});
    try {
      var response = await http.get(url);
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      return SourceResponse.fromJson(json);
      // SourceResponse.fromJson(jsonDecode(responseBody));
    } catch (e) {
      throw e;
    }
  }
}
