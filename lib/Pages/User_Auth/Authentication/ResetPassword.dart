import 'package:flutter/material.dart';
import 'package:wiil_food_and_restaurant_listing/Pages/User_Auth/Authentication/widgets.dart';

import '../../../theme_data.dart';
import 'SignInPage.dart';

class ResetPasswordPage extends StatefulWidget {
  ResetPasswordPage({Key key}) : super(key: key);

  @override
  _ResetPasswordPageState createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  bool obse = true;
  bool obse2 = true;
  Icon ic = Icon(Icons.visibility_off_outlined);
  Icon ic1 = Icon(
    Icons.visibility_rounded,
    color: Colors.green,
  );
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
              'Reset your Password',
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
              'Enter your new password and confirm',
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
                        color: Colors.white),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: TextFormField(
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
                              decoration: authTextInputDecoration(
                                  "Enter New Password")),
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
                    height: 20,
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
                            obscureText: obse2,
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
                                authTextInputDecoration("Confirm New Password"),
                          ),
                        ),
                        Expanded(
                          flex: 0,
                          child: IconButton(
                            onPressed: () {
                              setState(() {
                                obse2 = false;
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
                    height: 100,
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
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignInPage()),
                              ModalRoute.withName('/'));
                        },
                        child: Text(
                          'Done',
                          style: TextStyle(
                              fontFamily: MyColors.primaryFont,
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
