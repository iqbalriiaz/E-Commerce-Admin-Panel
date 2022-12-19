import 'package:flutter/material.dart';

import '../customHttp/custom_http.dart';
import '../models/category_model.dart';

class CategoryProvider with ChangeNotifier {
  List<CategoryModel> categoryList = [];

  getCategoryData() async {
    categoryList = await CustomHttpRequest.fetchCategoryData();
    notifyListeners();
  }
}
