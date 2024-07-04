import 'dart:convert';

import 'package:http/http.dart';
import 'package:movie_2nd/models/result.dart';

class ApiPopular {
  static Future<List<Result>> fetchData(int page) async {
    var respons = await get(Uri.parse(
        "https://api.themoviedb.org/3/movie/popular?api_key=16aed9ac0348099907b01b2f0b9f1bd7&page=$page"));

    var data = jsonDecode(respons.body);

    if (respons.statusCode == 200) {
      List<Result> results = (data['results'] as List)
          .map((result) => Result.fromJson(result))
          .toList();
      return results;
    } else {
      throw Exception("${respons.statusCode}");
    }
  }
}




// you can replace the name movie with folder (more lookike)
