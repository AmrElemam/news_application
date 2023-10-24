import 'dart:convert';

import 'package:http/http.dart';
import 'package:news_application/data/model/SourcesResponse.dart';

abstract class ApiManager {
  static const String baseUrl = "newsapi.org";
  static const String apiKey = "c06ecefc49c54dceb82778c6b380e1ad";
  static const String sourcesEndPoint = "/v2/top-headlines/sources";

  static Future<List<Source>> getSources() async {
    //convert string link to url
    Uri url = Uri.parse("https://${baseUrl}$sourcesEndPoint?apiKey=$apiKey");
    //get request from api
    Response response = await get(url);
    //convert body of response as string to json map
    Map json = jsonDecode(response.body);
    //convert json map to object of class SourcesResponse
    SourcesResponse sourcesResponse = SourcesResponse.fromJson(json);
    if (response.statusCode >= 200 &&
        response.statusCode < 300 &&
        sourcesResponse.sources?.isNotEmpty == true) {
      return sourcesResponse.sources!;
    }
    throw Exception(sourcesResponse.message);
  }

  static getArticles() {}
}
