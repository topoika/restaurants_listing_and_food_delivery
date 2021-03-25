import 'package:flutter/material.dart';
import 'package:wiil_food_and_restaurant_listing/Pages/User_Auth/Authentication/widgets.dart';

import '../../../theme_data.dart';
import 'PasswordVerification.dart';

class ForgetPasswordPage extends StatefulWidget {
  ForgetPasswordPage({Key key}) : super(key: key);

  @override
  _ForgetPasswordPageState createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyColors.backColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: MyColors.backColor,
          leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
        ),
        body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: 30,
            ),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/logo1.png',
                    height: 70,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Forget Password',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w800,
                      fontFamily: MyColors.primaryFont,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Please enter your email so we can help you recover your password.',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontFamily: MyColors.primaryFont,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.white,
                          ),
                          child: TextFormField(
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please enter some text';
                                }
                                return null;
                              },
                              cursorColor: Colors.black,
                              style: TextStyle(
                                fontFamily: MyColors.primaryFont,
                                color: Colors.black,
                                fontSize: 16,
                              ),
                              decoration: authTextInputDecoration("Email")),
                        ),
                        SizedBox(
                          height: 100,
                        ),
                        Container(
                          height: 40,
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: MyColors.primaryColor),
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          PasswordVerificaionPage()));
                            },
                            child: Text(
                              'Next',
                              style: TextStyle(
                                  fontFamily: MyColors.primaryFont,
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                ])));
  }
}
