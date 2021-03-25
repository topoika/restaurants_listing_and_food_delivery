import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:wiil_food_and_restaurant_listing/Pages/Customer_Screens/Home_page/homepage.dart';
import 'package:wiil_food_and_restaurant_listing/Pages/User_Auth/Authentication/widgets.dart';

import '../../../theme_data.dart';
import 'ForgetPassword.dart';
import 'SignUpPage.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // bool _success;
  // String _userEmail;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  Future signInWithEmail() async {
    try {
      UserCredential result = await _firebaseAuth.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      User user = result.user;
      print(user);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    } catch (e) {
      print(e.toString);
      return Container();
    }
  }

  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
    final GoogleAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    // print("User signed  ${credential.rawNonce} In");

    User user =
        (await FirebaseAuth.instance.signInWithCredential(credential)) as User;
    if (user != null) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    }

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool signUp = true;
  bool obse = true;
  Icon ic = Icon(Icons.visibility_off_outlined);
  Icon ic1 = Icon(
    Icons.visibility_rounded,
    color: Colors.green,
  );
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomPadding: false,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 4,
            ),
            Image.asset(
              'assets/images/logo1.png',
              height: 100,
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'WIIL',
                  style: TextStyle(
                      fontFamily: MyColors.primaryFont,
                      color: Colors.pink,
                      fontSize: 28,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'FOOD',
                  style: TextStyle(
                      fontFamily: MyColors.primaryFont,
                      color: Colors.orange,
                      fontSize: 28,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              'The best food for you!',
              style: TextStyle(
                color: Colors.black87,
                fontFamily: MyColors.primaryFont,
              ),
            ),
            SizedBox(
              height: 60,
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
                ],
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ForgetPasswordPage()));
                },
                child: Text(
                  'Forgot password!',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: MyColors.primaryFont,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
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
                // ignore: deprecated_member_use
                child: FlatButton(
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      signInWithEmail();
                    }
                  },
                  child: Text(
                    'Sign In',
                    style: TextStyle(
                        fontFamily: MyColors.primaryFont,
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
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
                  onPressed: () => signInWithGoogle(),
                  child: Text(
                    'Sign In with Google',
                    style: TextStyle(
                        fontFamily: MyColors.primaryFont,
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              height: 40,
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.blue),
              child: SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Sign In with FaceBook',
                    style: TextStyle(
                        fontFamily: MyColors.primaryFont,
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 70),
              height: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'I don\'t have an account? ',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: MyColors.primaryFont,
                      fontSize: 15,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUpPage()));
                    },
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Colors.orange,
                        fontFamily: MyColors.primaryFont,
                        fontSize: 15,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
