// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:wiil_food_and_restaurant_listing/Pages/Customer_Screens/Home_page/homepage.dart';

// class Auth {
//   final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
//   final GoogleSignIn googleSignIn = GoogleSignIn();

//   Future signInWithGoogle() async {
//     final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
//     final GoogleSignInAuthentication googleSignInAuthentication =
//         await googleSignInAccount.authentication;

//     final AuthCredential credential = GoogleAuthProvider.credential(
//       accessToken: googleSignInAuthentication.accessToken,
//       idToken: googleSignInAuthentication.idToken,
//     );a
//     print(credential);

//     final UserCredential authResult =
//         await _firebaseAuth.signInWithCredential(credential);
//     final User user = authResult.user;
//     print(user);
//   }

//   Future signInWithEmail(_emailController, _passwordController) async {
//     try {
//       UserCredential result = await _firebaseAuth.signInWithEmailAndPassword(
//         email: _emailController,
//         password: _passwordController,
//       );
//       User user = result.user;
//       print(user);
//       Navigator.push(
//           context, MaterialPageRoute(builder: (context) => HomePage()));
//     } catch (e) {
//       print(e.toString);
//       return Container();
//     }
//   }
// }
