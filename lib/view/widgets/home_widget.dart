// ignore_for_file: must_be_immutable, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_2nd/view/widgets/movie_detailes.dart';

class HomeWidget extends StatelessWidget {
  HomeWidget({super.key, required this.length,required this.show});
  int length;
  List show;
  @override
  Widget build(BuildContext context) {
    return  GridView.builder(
    itemCount: length,
    itemBuilder: (context, index) => Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: InkWell(
          onTap: () {
            Get.to(() => MovieDetailes(
              image: "https://image.tmdb.org/t/p/w500/${show[index].backdropPath}",
              movieBody: show[index].overview,
              movieTitle: show[index].title,
              id: '$index',
            ));
          },
          child: Column(
            children: [
              Expanded( // حرك Expanded ليكون حول الصورة والحاوية
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      stops: [.5, .9],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withOpacity(.9)
                      ],
                    ),
                  ),
                  child: Stack(
                    children: [
                      Image.network(
                        "https://image.tmdb.org/t/p/w500/${show[index].backdropPath}",
                        fit: BoxFit.cover,
                        height: double.infinity,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            stops: [.4, .9],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.black.withOpacity(0.35),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.all(2),
                      child: Row(
                        children: [
                          show[index].adult
                              ? Icon(Icons.family_restroom)
                              : Icon(Icons.man),
                          SizedBox(
                            width: 5,
                          ),
                          show[index].adult ? Text(("family")) : Text(("+18"))
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ),
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      childAspectRatio: 1 / 1,
      mainAxisSpacing: 20,
      crossAxisSpacing: 20,
    ),
  );
}
  }

