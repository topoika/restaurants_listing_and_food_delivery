import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:wiil_food_and_restaurant_listing/Pages/User_Auth/Authentication/widgets.dart';

import '../../../theme_data.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  // final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  // bool _success;
  // String _userEmail;
  // Future _register() async {
  //   final User user = (await _firebaseAuth.createUserWithEmailAndPassword(
  //     email: _emailController.text,
  //     password: _passwordController.text,
  //   ))
  //       .user;
  //   if (user != null) {
  //     setState(() {
  //       _success = true;
  //       _userEmail = user.email;
  //     });
  //   } else {
  //     setState(() {
  //       _success = true;
  //     });
  //   }
  // }

  bool obse = true;
  Icon ic = Icon(Icons.visibility_off_outlined);
  Icon ic1 = Icon(
    Icons.visibility_rounded,
    color: Colors.green,
  );
  //final _formKey = GlobalKey<FormState>();

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
        //alignment: Alignment.center,
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
                      decoration: authTextInputDecoration("Full Name"),
                    ),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.white,
                    ),
                    child: TextFormField(
                        controller: _emailController,
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
                        decoration: authTextInputDecoration("Username")),
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
                  SizedBox(
                    height: 18,
                  ),
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
                        decoration:
                            authTextInputDecoration("Delivery Address")),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.white,
                    ),
                    child: TextFormField(
                        keyboardType: TextInputType.number,
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
                        decoration: authTextInputDecoration("Phone Number")),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        Checkbox(
                          activeColor: MyColors.primaryColor,
                          checkColor: Colors.white,
                          value: timeDilation != 1.0,
                          onChanged: (bool value) {
                            setState(() {
                              timeDilation = value ? 2.0 : 1.0;
                            });
                          },
                        ),
                        Text(
                          'I agree with the ',
                          style: TextStyle(
                            fontFamily: MyColors.primaryFont,
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Text(
                            'Terms & Contitions ',
                            style: TextStyle(
                              color: MyColors.primaryColor,
                              fontFamily: MyColors.primaryFont,
                            ),
                          ),
                        ),
                        Text(
                          'of Wiil Food',
                          style: TextStyle(
                            fontFamily: MyColors.primaryFont,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
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
                            //_register();
                          }
                        },
                        child: Text(
                          'Continue',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontFamily: MyColors.primaryFont,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                  ),
                  // Container(
                  //   alignment: Alignment.center,
                  //   padding: const EdgeInsets.symmetric(horizontal: 16),
                  //   child: Text(
                  //     _success == null
                  //         ? ''
                  //         : (_success
                  //             ? 'Successfully signed in ' + _userEmail
                  //             : 'Sign in failed'),
                  //     style: TextStyle(color: Colors.red),
                  //   ),
                  // )
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
