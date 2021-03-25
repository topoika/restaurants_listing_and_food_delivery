import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:wiil_food_and_restaurant_listing/Pages/Customer_Screens/Home_page/homepage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WiilFood & Restaurants Listing',
      home: HomePage(),
    );
  }
}
