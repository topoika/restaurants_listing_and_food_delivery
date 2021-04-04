import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wiil_food_and_restaurant_listing/Pages/User_Auth/Authentication/widgets.dart';

import '../../../theme_data.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  Future _register() async {
    try {
      UserCredential results = await _auth.createUserWithEmailAndPassword(
          email: _emailController.text, password: _passwordController.text);
      User user = results.user;

      print(user);
    } catch (e) {
      print(e.toString);
    }
  }

  bool obse = true;
  Icon ic = Icon(Icons.visibility_off_outlined);
  Icon ic1 = Icon(
    Icons.visibility_rounded,
    color: Colors.green,
  );

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
          children: [
            Image.asset(
              'assets/images/logo1.png',
              height: 70,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Create New Account',
              style: TextStyle(
                  fontFamily: MyColors.primaryFont,
                  fontSize: 28,
                  fontWeight: FontWeight.w800),
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
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
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
                    height: 18,
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.white),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: TextFormField(
                              controller: _passwordController,
                              obscureText: obse,
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
                              decoration: authTextInputDecoration("Password")),
                        ),
                        Expanded(
                          flex: 0,
                          child: IconButton(
                            onPressed: () {
                              setState(() {
                                obse = false;
                                ic = ic1;
                              });
                            },
                            icon: ic,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 60),
                    height: 40,
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: MyColors.primaryColor),
                    child: SizedBox(
                      width: double.infinity,
                      child: TextButton(
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            _register();
                          }
                        },
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontFamily: MyColors.primaryFont,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
