import 'package:ecommerce_api/models/product_model.dart';
import 'package:flutter/material.dart';

import '../customHttp/custom_http.dart';

class ProductProvider with ChangeNotifier {
  List<ProductModel> productList = [];

  getProductListData() async {
    productList = await CustomHttpRequest.fetchProductData();
    notifyListeners();
  }
}
