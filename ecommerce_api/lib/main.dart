import 'package:ecommerce_api/providers/admin_profile_provider.dart';
import 'package:ecommerce_api/providers/category_provider.dart';
import 'package:ecommerce_api/providers/order_provider.dart';
import 'package:ecommerce_api/providers/product_provider.dart';
import 'package:ecommerce_api/providers/selected_provider.dart';
import 'package:ecommerce_api/screen/authentication/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>OrderProvider()),
        ChangeNotifierProvider(create: (context)=>CategoryProvider()),
        ChangeNotifierProvider(create: (context)=>SelectedProvider()),
        ChangeNotifierProvider(create: (context)=>ProductProvider()),
        ChangeNotifierProvider(create: (context)=>AdminProfileProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SplashScreen()
      ),
    );
  }
}
