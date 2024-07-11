// ignore_for_file: avoid_print

import 'package:get/get.dart';
import 'package:movie_2nd/models/result.dart';
import 'package:movie_2nd/utils/api/api_popular.dart';
import 'package:movie_2nd/utils/api/api_search.dart';

class HomeController extends GetxController {
  RxBool loading = true.obs;
  RxBool search = false.obs;
  RxList<Result> resultList = <Result>[].obs;
  RxList<Result> searchList = <Result>[].obs;
  RxInt page = 1.obs;

  @override
  void onInit() {
    fetchResults();
    super.onInit();
  }

  void changePage(int newPage) {
    page.value = newPage;
    fetchResults();
  }

  void showSearch(String query) async {
    search.value = true;
    loading.value = true;
    var searchResult = await ApiSearch().searchData(query);
    if (searchResult.isNotEmpty) {
      try {
        searchList.assignAll(searchResult);
        loading.value = false;
      } catch (e) {
        print(e);
      }
    }
  }

  void fetchResults() async {
        search.value = false;
    loading.value = true;
    var results = await ApiPopular.fetchData(page.value);
    if (results.isNotEmpty) {
      try {
        resultList.assignAll(results);
      } catch (e) {
        print(e);
      } finally {
        loading.value = false;
      }
    }
  }
}
