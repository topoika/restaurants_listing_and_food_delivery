import 'package:flutter/material.dart';
import 'package:wiil_food_and_restaurant_listing/Pages/User_Auth/Authentication/SignInPage.dart';

class UserProfile extends StatefulWidget {
  UserProfile({Key key}) : super(key: key);

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return SignInPage();
  }
}
