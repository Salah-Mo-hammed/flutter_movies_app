// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_2nd/utils/controller/home_controller.dart';
import 'package:movie_2nd/view/widgets/home_widget.dart';

class PagesScreen extends StatelessWidget {
  const PagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.put(HomeController());
    String searchValue = "";
    print(controller.page);

    return Scaffold(
      appBar: AppBar(
        title: const Text("movies list"),
        actions: [
          Row(
            children: [
              SizedBox(
                width: 200,
                child: TextField(
                  onChanged: (value) => searchValue = value,
                ),
              ),
              IconButton(
                onPressed: () {
                  searchValue.isNotEmpty
                      ? controller.showSearch(searchValue)
                      : null;
                },
                icon: Icon(Icons.search),
              ),
            ],
          )
        ],
      ),
      body: Stack(
        children: [
          Obx(() {
            if (controller.loading.value) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return HomeWidget(
                  show: controller.search.value
                      ? controller.searchList
                      : controller.resultList,
                  length: controller.search.value
                      ? controller.searchList.length
                      : controller.resultList.length);
            }
          }),
          Positioned(
            left: 50,
            right: 50,
            bottom: 10,
            child: Container(
              width: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 22,
                      child: IconButton(
                        onPressed: () {
                          if ((controller.page.value) > 1) {
                            --controller.page.value;
                            print(controller.page);

                            controller.fetchResults();
                          }
                        },
                        icon: Icon(Icons.arrow_back_ios),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    CircleAvatar(
                      radius: 22,
                      child: IconButton(
                        onPressed: () {
                          Get.defaultDialog(
                              title: "put your page",
                              content: Column(
                                children: [
                                  TextField(
                                    onChanged: (value) => controller
                                        .page.value = int.parse(value),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      print(controller.page);

                                      controller.fetchResults();
                                      Get.back();
                                    },
                                    child: const Text(
                                      "search",
                                      style: TextStyle(color: Colors.lightBlue),
                                    ),
                                  ),
                                ],
                              ));
                        },
                        icon: Icon(Icons.search),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    CircleAvatar(
                      radius: 22,
                      child: IconButton(
                          onPressed: () {
                            if ((controller.page.value) >= 1) {
                              ++controller.page.value;
                              print(controller.page);

                              controller.fetchResults();
                            }
                          },
                          icon: Icon(Icons.arrow_forward_ios)),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/* 
CachedNetworkImage(
                          imageUrl: "https://image.tmdb.org/t/p/w500${movie.posterPath}", // Use the correct URL format
                          placeholder: (context, url) => const CircularProgressIndicator(),
                          errorWidget: (context, url, error) => const Icon(Icons.error),
                        ),
  
 */