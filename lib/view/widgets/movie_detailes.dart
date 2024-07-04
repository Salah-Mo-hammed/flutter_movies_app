// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:movie_2nd/utils/api/api_add_rate.dart';

class MovieDetailes extends StatelessWidget {
  MovieDetailes(
      {required this.id,
      required this.image,
      required this.movieBody,
      required this.movieTitle,
      super.key});
  String movieTitle;
  String movieBody;
  String image;
  String id;
  late String rateValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          movieTitle,
          style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Expanded(child: Image.network(image))),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                margin: const EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    movieBody,
                    style: const TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
            ),
            Text(
              "put your rate",
              style: TextStyle(fontSize: 20),
            ),
            Container(
              width: 70,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
                child: TextField(
                  onChanged: (value) => rateValue = value,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: 100,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(15)),
              child: TextButton(
                onPressed: () {
                  RateApi.postRate(int.parse(id),double.parse( rateValue));
                },
                child: Text(
                  "Rate",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}