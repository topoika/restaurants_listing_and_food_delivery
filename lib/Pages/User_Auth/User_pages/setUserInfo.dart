import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:wiil_food_and_restaurant_listing/Pages/User_Auth/Authentication/widgets.dart';
import 'package:wiil_food_and_restaurant_listing/Pages/User_Auth/User_pages/customer_database.dart';

import '../../../theme_data.dart';

class SetUserInfo extends StatefulWidget {
  final String address;
  SetUserInfo({Key key, this.address}) : super(key: key);

  @override
  _SetUserInfoState createState() => _SetUserInfoState();
}

class _SetUserInfoState extends State<SetUserInfo> {
  // String email = FirebaseAuth.instance.currentUser.email;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _fullName = TextEditingController();
  final TextEditingController _userName = TextEditingController();
  final TextEditingController _phoneNumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.backColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: MyColors.backColor,
        centerTitle: true,
        title: Text(
          'Set Your Details For Better Services',
          style: TextStyle(
              color: Colors.black,
              fontFamily: MyColors.primaryFont,
              fontSize: 18,
              fontWeight: FontWeight.w800),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: 30,
        ),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                // Ask for permision to acces and upload the profile image
              },
              child: CircleAvatar(
                backgroundImage: NetworkImage(_auth.currentUser.photoURL),
                radius: 40,
                child: _auth.currentUser.photoURL != null
                    ? null
                    : Icon(
                        Icons.person,
                        size: 52,
                      ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  _auth.currentUser.displayName != null
                      ? Container(
                          margin: EdgeInsets.only(bottom: 18),
                          alignment: Alignment.centerLeft,
                          height: 48,
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.white,
                          ),
                          child: Text(
                            _auth.currentUser.displayName,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontFamily: MyColors.primaryFont,
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                        )
                      : Container(
                          margin: EdgeInsets.only(bottom: 18),
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.white,
                          ),
                          child: TextFormField(
                            controller: _fullName,
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
                  Container(
                    alignment: Alignment.centerLeft,
                    height: 48,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.white,
                    ),
                    child: Text(
                      _auth.currentUser.email,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontFamily: MyColors.primaryFont,
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 18),
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.white,
                    ),
                    child: TextFormField(
                        controller: _userName,
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
                  Container(
                    alignment: Alignment.centerLeft,
                    height: 48,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.white,
                    ),
                    child: Text(
                      widget.address.toString(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontFamily: MyColors.primaryFont,
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 18),
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.white,
                    ),
                    child: TextFormField(
                        controller: _phoneNumber,
                        keyboardType: TextInputType.phone,
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
                            Map<String, String> customerMap = {
                              "fullName": _auth.currentUser.displayName != null
                                  ? _auth.currentUser.displayName
                                  : _fullName.text,
                              "email": _auth.currentUser.email,
                              "phoneNumber": _phoneNumber.text,
                              "userName": _userName.text,
                              "address": widget.address.toString(),
                              "userId": _auth.currentUser.uid,
                            };
                            var customerId = _auth.currentUser.uid.toString();
                            CustomerData()
                                .createCustomer(customerMap, customerId);
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
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
