import 'dart:convert';

import 'package:http/http.dart';
import 'package:movie_2nd/models/result.dart';

class ApiSearch {
   Future searchData(String query) async {
    var respons = await get(Uri.parse(
        "https://api.themoviedb.org/3/search/movie?api_key=16aed9ac0348099907b01b2f0b9f1bd7&query=$query"));
    if (respons.statusCode == 200) {
      var jsonRespons = jsonDecode(respons.body);
      List<Result> data = ((jsonRespons['results']) as List)
          .map((data) => Result.fromJson(data))
          .toList();
      return data;
    }
  }
}
