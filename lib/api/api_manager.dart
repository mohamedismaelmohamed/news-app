import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/newsResponce.dart';
import '../model/sourceResponse.dart';
import 'api_constants.dart';
import 'end_points.dart';


class ApiManager {
  /*
  https://newsapi.org/v2/top-headlines/sources?
  apiKey=500c5a4f9b244f3db92a47f436f1819e
   */
  static Future<SourceResponse?> getSources() async {
    Uri url = Uri.https(ApiConstants.baseUrl, EndPoints.sourceApi,
        {'apiKey': ApiConstants.apiKey, });
    try {
      var response = await http.get(url);
      var bodyString = response.body; // String
      var json = jsonDecode(bodyString); // json
      return SourceResponse.fromJson(json); // object
    } catch (e) {
      throw e;
    }

    // SourceResponse.fromJson(jsonDecode(response.body));
    // String => json => object
  }

  /*
  https://newsapi.org/v2/everything?q=bitcoin&apiKey=500c5a4f9b244f3db92a47f436f1819e
   */
  static Future<NewsResponse?> getNewsBySourceId(String sourceId) async {
    Uri url = Uri.https(ApiConstants.baseUrl, EndPoints.newsApi,
        {'apiKey': ApiConstants.apiKey, 'sources': sourceId});
    try {
      var response = await http.get(url);
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      return NewsResponse.fromJson(json);
    } catch (e) {
      throw e;
    }

    // NewsResponse.fromJson(jsonDecode(response.body));
  }
}
