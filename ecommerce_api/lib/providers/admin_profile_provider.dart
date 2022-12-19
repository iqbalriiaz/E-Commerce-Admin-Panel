import 'package:ecommerce_api/models/admin_profile_model.dart';
import 'package:flutter/material.dart';

import '../customHttp/custom_http.dart';

class AdminProfileProvider with ChangeNotifier {
  List<AdminProfileModel> adminProfileList = [];

  getAdminProfileListData() async {
    adminProfileList = await CustomHttpRequest.fetchAdminProfileData();
    notifyListeners();
  }
}
