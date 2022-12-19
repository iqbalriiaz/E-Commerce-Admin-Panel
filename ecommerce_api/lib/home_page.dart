import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:ecommerce_api/screen/layouts/category_page.dart';
import 'package:ecommerce_api/screen/layouts/order_page.dart';
import 'package:ecommerce_api/screen/layouts/product_page.dart';
import 'package:ecommerce_api/screen/layouts/profile_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final myPages = [OrderPage(),CategoryPage(),ProductPage(),ProfilePage()];
  int indexPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        items: [
          Icon(
            Icons.list,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.category,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.add_chart_rounded,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.settings,
            size: 30,
            color: Colors.white,
          ),
        ],
        height: 50,
        color: Colors.blue,
        backgroundColor: Colors.transparent,
        onTap: (index) {
          setState(() {
            indexPage = index;
          });
        },
      ),
        body: myPages[indexPage]);
  }
}
