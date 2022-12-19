import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../models/admin_profile_model.dart';
import '../models/category_model.dart';
import '../models/order_model.dart';
import '../models/product_model.dart';
import '../widget/common_widget.dart';

class CustomHttpRequest {
  static Future<Map<String, String>> getHeaderWithToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    var header = {
      "Accept": "Application/json",
      "Authorization": "bearer ${sharedPreferences.getString("token")}"
    };
    // print("Saved token is ${sharedPreferences.getString("token")}");
    return header;
  }

  static Future<List<OrderModel>> fetchOrderData() async {
    List<OrderModel> orderList = [];
    OrderModel orderModel;
    var uri = "${baseUrl}all/orders";
    var response = await http.get(Uri.parse(uri),
        headers: await CustomHttpRequest.getHeaderWithToken());
    var data = jsonDecode(response.body);
    for (var i in data) {
      orderModel = OrderModel.fromJson(i);
      orderList.add(orderModel);
    }
    return orderList;
  }

  static Future<List<CategoryModel>> fetchCategoryData() async {
    List<CategoryModel> categoryList = [];
    CategoryModel categoryModel;
    var uri = "${baseUrl}category";
    var response = await http.get(Uri.parse(uri),
        headers: await CustomHttpRequest.getHeaderWithToken());
    var data = jsonDecode(response.body);
    // print("wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww${data}");
    for (var i in data) {
      categoryModel = CategoryModel.fromJson(i);
      categoryList.add(categoryModel);
    }
    return categoryList;
  }

  static Future<List<AdminProfileModel>> fetchAdminProfileData() async {
    List<AdminProfileModel> adminProfileList = [];
    AdminProfileModel adminProfileModel;
    var uri = "${baseUrl}profile";
    var response = await http.get(Uri.parse(uri),
        headers: await CustomHttpRequest.getHeaderWithToken());
    var data = jsonDecode(response.body);
    // print("wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww${data}");
    for (var i in data) {
      adminProfileModel = AdminProfileModel.fromJson(i);
      adminProfileList.add(adminProfileModel);
    }
    return adminProfileList;
  }

  static Future<List<ProductModel>> fetchProductData() async {
    List<ProductModel> productList = [];
    ProductModel productModel;
    var uri = "${baseUrl}products";
    var response = await http.get(Uri.parse(uri),
        headers: await CustomHttpRequest.getHeaderWithToken());
    var data = jsonDecode(response.body);

    // print("wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww${data}");
    for (var i in data) {
      productModel = ProductModel.fromJson(i);

      //adding this extra line of code because in api, price array has empty field
      //which gives a null in the list view
      //so removing that map which has empty price field .
      productList.removeWhere((ProductModel model) => model.price!.isEmpty);
      productList.add(productModel);
    }
    return productList;
  }
}
