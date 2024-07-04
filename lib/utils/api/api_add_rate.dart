// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:http/http.dart';

class RateApi {
  static Future<void> postRate(int movie_id, double rate) async {
    const token =
        "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxNmFlZDlhYzAzNDgwOTk5MDdiMDFiMmYwYjlmMWJkNyIsIm5iZiI6MTcyMDA0MjE3Ny4wMzk1NTEsInN1YiI6IjY2ODNkYzE2YmQ1YjBlMmYxMWZiMThmOCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.8jVVJJwy25aSQTvPRmq4crB5ZehYpaNejloycFG8e38";
    const apiKey = "16aed9ac0348099907b01b2f0b9f1bd7";
    final url = Uri.parse(
        "https://api.themoviedb.org/3/movie/$movie_id/rating?api_key=$apiKey&session_id=$token");
    var response = await post(url,
        headers: {'Content-Type': 'application/json;charset=utf-8'},
        body: jsonEncode({'value': rate}));
    print(response.body);
  }
}
/*

token : eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJiMjA4MjEwN2IyNjk5MWFiOTkwMTA3YTM2MzU2MTViMSIsIm5iZiI6MTcyMDAxMDMyOS41MTU1MTksInN1YiI6IjY2ODNkYzE2YmQ1YjBlMmYxMWZiMThmOCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.vhjXhTk7Cz4dmnDyVuPq4KQsJcRJwKSHX29CYr5aJE8
/////////////////////////////////////////////////////////////////////////////////////////////////////////
api key: b2082107b26991ab990107a3635615b1
\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
base url : https://api.themoviedb.org/
//////////////////////////////////////////////
base url+ endpoint for add rating : https://api.themoviedb.org/3/movie/{movie_id}/rating

 */