import 'package:flutter/material.dart';

import '../customHttp/custom_http.dart';
import '../models/order_model.dart';

class OrderProvider with ChangeNotifier {
  List<OrderModel> orderList = [];

  getOrderListData() async {
    orderList = await CustomHttpRequest.fetchOrderData();
    notifyListeners();
  }
}
