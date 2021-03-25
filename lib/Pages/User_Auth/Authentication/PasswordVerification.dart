import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../theme_data.dart';
import 'ResetPassword.dart';

class PasswordVerificaionPage extends StatefulWidget {
  PasswordVerificaionPage({Key key}) : super(key: key);

  @override
  _PasswordVerificaionPageState createState() =>
      _PasswordVerificaionPageState();
}

class _PasswordVerificaionPageState extends State<PasswordVerificaionPage> {
  final String text = '';
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
                          constraints: const BoxConstraints(maxWidth: 500),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              otpNumberWidget(0),
                              otpNumberWidget(1),
                              otpNumberWidget(2),
                              otpNumberWidget(3),
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: MyColors.primaryColor),
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ResetPasswordPage()));
                            },
                            child: Text(
                              'Submit',
                              style: TextStyle(
                                  fontFamily: MyColors.primaryFont,
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ])));
  }

  Widget otpNumberWidget(int position) {
    try {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.black, width: 0),
            borderRadius: const BorderRadius.all(Radius.circular(8))),
        child: Center(
          child: TextFormField(
            cursorColor: Colors.black,
            style: TextStyle(
              fontFamily: MyColors.primaryFont,
              fontSize: 18,
              color: Colors.black,
            ),
            inputFormatters: [LengthLimitingTextInputFormatter(1)],
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            decoration: InputDecoration(
              border: InputBorder.none,
            ),
          ),
        ),
      );
    } catch (e) {
      return Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.black, width: 0),
            borderRadius: const BorderRadius.all(Radius.circular(8))),
      );
    }
  }
}
