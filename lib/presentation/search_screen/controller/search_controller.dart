import 'package:flutter/cupertino.dart';
import 'package:flutter_elearning_app/core/app_export.dart';
import 'package:flutter_elearning_app/data/models/course_model.dart';
import 'package:flutter_elearning_app/data/repositories/course_repository.dart';
import '../models/recentclearallrow_item_model.dart';
import '../models/search_model.dart';

class SearchController extends GetxController {
  final CourseRepository _repo = Get.find<CourseRepository>();
  TextEditingController searchController = TextEditingController();
  RxList<RecentclearallrowItemModel> searchList = SearchModel.getSearchData().obs;
  RxList<CourseModel> searchResults = <CourseModel>[].obs;
  RxBool isLoading = false.obs;

  void onSearch(String query) async {
    if (query.isEmpty) {
      searchResults.clear();
      return;
    }
    isLoading.value = true;
    final allCourses = await _repo.getCourses();
    searchResults.value = allCourses.where((c) =>
      c.title!.toLowerCase().contains(query.toLowerCase()) ||
      c.category!.toLowerCase().contains(query.toLowerCase())
    ).toList();
    isLoading.value = false;

    // Add to recent if not exists
    if (!searchList.any((e) => e.searchMsg == query)) {
      searchList.insert(0, RecentclearallrowItemModel(query));
    }
  }
}
