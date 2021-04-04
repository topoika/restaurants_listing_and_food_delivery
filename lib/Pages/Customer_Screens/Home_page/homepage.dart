import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:wiil_food_and_restaurant_listing/Maps_Nav/mainPage.dart';
import 'package:wiil_food_and_restaurant_listing/Models/categories_model.dart';
import 'package:wiil_food_and_restaurant_listing/Models/dishes_model.dart';
import 'package:wiil_food_and_restaurant_listing/Models/restaurants_model.dart';
import 'package:wiil_food_and_restaurant_listing/Pages/Customer_Screens/CartProcess/cart_page.dart';
import 'package:wiil_food_and_restaurant_listing/Pages/Customer_Screens/Home_page/dish_details.dart';
import 'package:wiil_food_and_restaurant_listing/Pages/User_Auth/User_pages/UserProfile.dart';
import 'package:wiil_food_and_restaurant_listing/Pages/User_Auth/User_pages/setUserInfo.dart';

import '../../../theme_data.dart';
import 'home_widgets.dart';
import 'rest_details.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  List data;
  //int _value = 0;
  String location = "Set Your  Delivery Adress";
  editLocation() {
    setState(() {
      location = addressControler.text;
      addressControler.text = "";
    });
  }

  TextEditingController addressControler = TextEditingController();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  void signOut() {
    try {
      _firebaseAuth.signOut();
      googleSignIn.signOut();
    } catch (e) {
      print(e.toString());
    }
  }

  var locationText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: MyColors.backColor,
      appBar: AppBar(
        elevation: 5,
        backgroundColor: MyColors.primaryColor,
        leading: GestureDetector(
          child: Icon(
            Icons.menu,
            color: Colors.white,
            size: 28,
          ),
          onTap: () => _scaffoldKey.currentState.openDrawer(),
        ),
        title: Container(
          child: SearchTopBar(),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.fromLTRB(15, 7, 20, 0),
              //height: 150,
              width: double.infinity,
              decoration: BoxDecoration(color: MyColors.primaryColor),
              child: Column(
                children: [
                  Container(
                    height: 30,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 0,
                          child: Row(
                            children: [
                              GestureDetector(
                                  child: Icon(
                                    Icons.delivery_dining,
                                    color: Colors.white,
                                    size: 32,
                                  ),
                                  onTap: () {}
                                  // _scaffoldKey.currentState.openDrawer(),
                                  ),
                              SizedBox(width: 7),
                              Container(
                                child: Text(
                                  'Delivery  To : ',
                                  style: TextStyle(
                                      color: Colors.black87,
                                      fontSize: 22,
                                      fontFamily: MyColors.primaryFont),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Stack(
                            alignment: Alignment.centerRight,
                            children: [
                              IconButton(
                                alignment: Alignment.centerRight,
                                icon: Icon(
                                  Icons.shopping_bag,
                                  color: Colors.white,
                                  size: 30,
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(0, 0, 0, 3),
                                  height: 15,
                                  width: 15,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(30),
                                    ),
                                  ),
                                  child: Text(
                                    '2',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: MyColors.primaryColor,
                                      fontFamily: MyColors.primaryFont,
                                      fontSize: 10,
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
                  GestureDetector(
                    onTap: () {
                      //_settingModalBottomSheet(context);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => MapsPage()));
                    },
                    child: Container(
                      child: Row(
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            color: Colors.white,
                            size: 32,
                          ),
                          SizedBox(width: 10),
                          Container(
                            margin: EdgeInsets.only(bottom: 10),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Colors.black45,
                                  width: 3,
                                ),
                              ),
                            ),
                            height: 40,
                            width: 240,
                            child: Row(
                              children: [
                                Text(
                                  location,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontFamily: MyColors.primaryFont),
                                ),
                                Spacer(),
                                Icon(
                                  Icons.keyboard_arrow_down_outlined,
                                  color: Colors.white,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.fromLTRB(15, 15, 0, 0),
              height: 120,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: MyColors.backColor,
              ),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: restaurants == null ? 0 : restaurants.length,
                itemBuilder: (BuildContext context, int index) {
                  final restaurant = restaurants[index];
                  return Container(
                    height: 235,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: MyColors.backColor,
                    ),
                    child: SingleChildScrollView(
                      dragStartBehavior: DragStartBehavior.start,
                      scrollDirection: Axis.horizontal,
                      clipBehavior: Clip.hardEdge,
                      child: Row(
                        children: [
                          InkWell(
                              child: buildRestaurantsTiles(restaurant),
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) => RetaurantDetails(
                                          restaurant: restaurant)),
                                );
                              })
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              color: MyColors.backColor,
              padding: EdgeInsets.symmetric(horizontal: 20),
              height: 35,
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      'Categories',
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: MyColors.primaryFont,
                          fontSize: 20),
                    ),
                  ),
                  Expanded(
                    flex: 0,
                    child: InkWell(
                      onTap: () {
                        //
                      },
                      child: Row(
                        children: [
                          Text(
                            'View all',
                            style: TextStyle(
                                fontFamily: MyColors.primaryFont,
                                color: MyColors.primaryColor,
                                fontSize: 15,
                                fontWeight: FontWeight.w400),
                          ),
                          Icon(
                            Icons.double_arrow_rounded,
                            size: 15,
                            color: MyColors.primaryColor,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 105,
              padding: EdgeInsets.only(left: 15),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: MyColors.backColor,
              ),
              child: Container(
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    itemBuilder: (BuildContext context, int index) {
                      var category = categories[index];
                      return Container(
                        padding: EdgeInsets.only(right: 15),
                        child: Container(
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.all(5),
                                height: 70,
                                width: 70,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey,
                                      spreadRadius: 2.0,
                                      blurRadius: 2,
                                      offset: Offset(0, 3),
                                    )
                                  ],
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  color: Colors.white,
                                ),
                                child: Image.asset(category.imgURL),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                category.name,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontFamily: MyColors.primaryFont),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              color: Colors.white30,
              alignment: Alignment.center,
              height: 50,
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      'Most Ordered Dishes',
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: MyColors.primaryFont,
                          fontSize: 20),
                    ),
                  ),
                  Expanded(
                    flex: 0,
                    child: InkWell(
                      onTap: () {
                        //
                      },
                      child: Row(
                        children: [
                          Text(
                            'View all',
                            style: TextStyle(
                                fontFamily: MyColors.primaryFont,
                                color: MyColors.primaryColor,
                                fontSize: 15,
                                fontWeight: FontWeight.w400),
                          ),
                          Icon(
                            Icons.double_arrow_rounded,
                            size: 15,
                            color: MyColors.primaryColor,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 235,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: MyColors.backColor,
              ),
              child: Container(
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: dishes.length,
                    itemBuilder: (BuildContext context, int index) {
                      var dish = dishes[index];
                      return Container(
                        padding: EdgeInsets.fromLTRB(15, 10, 0, 0),
                        height: 235,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: MyColors.backColor,
                        ),
                        child: SingleChildScrollView(
                          dragStartBehavior: DragStartBehavior.start,
                          scrollDirection: Axis.horizontal,
                          clipBehavior: Clip.hardEdge,
                          child: Row(
                            children: [
                              InkWell(
                                  child: buildDishCard(dish),
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              DishDeatils(dishs: dish)),
                                    );
                                  })
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              color: Colors.white30,
              alignment: Alignment.center,
              height: 50,
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      'Fevourite Restaurants',
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: MyColors.primaryFont,
                          fontSize: 20),
                    ),
                  ),
                  Expanded(
                    flex: 0,
                    child: InkWell(
                      onTap: () {
                        //
                      },
                      child: Row(
                        children: [
                          Text(
                            'View all',
                            style: TextStyle(
                                fontFamily: MyColors.primaryFont,
                                color: MyColors.primaryColor,
                                fontSize: 15,
                                fontWeight: FontWeight.w400),
                          ),
                          Icon(
                            Icons.double_arrow_rounded,
                            size: 15,
                            color: MyColors.primaryColor,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 235,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: MyColors.backColor,
              ),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: restaurants.length,
                itemBuilder: (BuildContext context, int index) {
                  var restaurant = restaurants[index];
                  return Container(
                      padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                      height: 235,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: MyColors.backColor,
                      ),
                      child: InkWell(
                          child: buildContainer(restaurant),
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => RetaurantDetails(
                                        restaurant: restaurant,
                                      )),
                            );
                          }));
                },
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              color: Colors.white30,
              alignment: Alignment.center,
              height: 50,
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      'Listed Restaurants',
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: MyColors.primaryFont,
                          fontSize: 20),
                    ),
                  ),
                  Expanded(
                    flex: 0,
                    child: InkWell(
                      onTap: () {
                        //
                      },
                      child: Row(
                        children: [
                          Text(
                            'View all',
                            style: TextStyle(
                                fontFamily: MyColors.primaryFont,
                                color: MyColors.primaryColor,
                                fontSize: 15,
                                fontWeight: FontWeight.w400),
                          ),
                          Icon(
                            Icons.double_arrow_rounded,
                            size: 15,
                            color: MyColors.primaryColor,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                final restaurant = restaurants[index];
                return Container(
                  //padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                  height: 250,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: MyColors.backColor,
                  ),
                  child: InkWell(
                    child: listedRest(restaurant),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => RetaurantDetails(
                                  restaurant: restaurant,
                                )),
                      );
                    },
                  ),
                );
              },
              childCount: restaurants.length,
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 50,
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 7),
              child: Container(
                color: MyColors.primaryColor,
                child: SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () {
                      //Go to the main restaurants pages
                    },
                    child: Text(
                      'Explore All Vendors',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontFamily: MyColors.primaryFont),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Divider(
              color: Colors.black54,
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              alignment: Alignment.topCenter,
              height: 60,
              width: double.infinity,
              color: MyColors.backColor,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          //
                        },
                        child: Text(
                          'Home',
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: 17,
                              fontFamily: MyColors.primaryFont),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          //
                        },
                        child: Text(
                          'My Account',
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: 17,
                              fontFamily: MyColors.primaryFont),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          //
                        },
                        child: Text(
                          'All Restaurnts',
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: 17,
                              fontFamily: MyColors.primaryFont),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          'Log Out',
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: 17,
                              fontFamily: MyColors.primaryFont),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () async {
                          await FirebaseAuth.instance.signOut();
                          await GoogleSignIn().signOut();

                          //print(User);
                        },
                        child: Text(
                          'Cart',
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: 17,
                              fontFamily: MyColors.primaryFont),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 50),
          children: [
            Container(
              height: 150,
              child: DrawerHeader(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  alignment: Alignment.centerLeft,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SetUserInfo()));
                            },
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(
                                  FirebaseAuth.instance.currentUser.photoURL),
                              child:
                                  FirebaseAuth.instance.currentUser.photoURL !=
                                          null
                                      ? null
                                      : Text("M D"),
                              backgroundColor: MyColors.backColor,
                            ),
                          ),
                          SizedBox(width: 10),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                FirebaseAuth.instance.currentUser.displayName !=
                                        null
                                    ? FirebaseAuth
                                        .instance.currentUser.displayName
                                        .toString()
                                    : "My Name David",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontFamily: MyColors.primaryFont),
                              ),
                              Text(
                                FirebaseAuth.instance.currentUser.email != null
                                    ? FirebaseAuth.instance.currentUser.email
                                        .toString()
                                    : "myname@something.com",
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 13,
                                    fontFamily: MyColors.primaryFont),
                              )
                            ],
                          )
                        ],
                      ),
                      Text(
                        'Menu',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontFamily: MyColors.primaryFont),
                      )
                    ],
                  ),
                ),
                decoration: BoxDecoration(color: MyColors.primaryColor),
              ),
            ),
            ListTile(
              title: Text(
                'Home',
                style: TextStyle(
                    color: Colors.black87,
                    fontSize: 16,
                    fontFamily: MyColors.primaryFont),
              ),
              leading: Icon(Icons.house),
              onTap: () {
                //
              },
            ),
            ListTile(
              title: Text(
                'Restaurants',
                style: TextStyle(
                    color: Colors.black87,
                    fontSize: 16,
                    fontFamily: MyColors.primaryFont),
              ),
              leading: Icon(Icons.food_bank),
              onTap: () {
                //
              },
            ),
            ListTile(
              title: Text(
                'Dishes',
                style: TextStyle(
                    color: Colors.black87,
                    fontSize: 16,
                    fontFamily: MyColors.primaryFont),
              ),
              leading: Icon(Icons.fastfood_outlined),
              onTap: () {
                //
              },
            ),
            ListTile(
              title: Text(
                'My Cart',
                style: TextStyle(
                    color: Colors.black87,
                    fontSize: 16,
                    fontFamily: MyColors.primaryFont),
              ),
              leading: Icon(
                Icons.shopping_bag,
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CartPage()));
              },
            ),
            ListTile(
              title: Text(
                'My Account',
                style: TextStyle(
                    color: Colors.black87,
                    fontSize: 16,
                    fontFamily: MyColors.primaryFont),
              ),
              leading: Icon(Icons.account_circle_sharp),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => UserProfile()));
              },
            ),
            ListTile(
              title: Text(
                'Log Out',
                style: TextStyle(
                    color: Colors.black87,
                    fontSize: 16,
                    fontFamily: MyColors.primaryFont),
              ),
              leading: Icon(Icons.arrow_forward_ios_outlined),
              onTap: () {
                signOut();
              },
            )
          ],
        ),
      ),
    );
  }

  SingleChildScrollView buildSingleChildScrollView(dish, BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(0, 35, 0, 0),
                height: 220,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        dish.image,
                      ),
                      fit: BoxFit.fill),
                ),
              ),
              Container(
                height: 260,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black54,
                        Colors.black12,
                      ]),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  vertical: 35,
                  horizontal: 20,
                ),
                alignment: Alignment.topLeft,
                height: 30,
                color: Colors.transparent,
                child: Row(
                  children: [
                    Expanded(
                      flex: 0,
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 30,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Stack(
                        alignment: Alignment.centerRight,
                        children: [
                          IconButton(
                            alignment: Alignment.centerRight,
                            icon: Icon(
                              Icons.shopping_bag,
                              color: Colors.white,
                              size: 30,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Container(
                              padding: EdgeInsets.fromLTRB(0, 0, 0, 3),
                              height: 15,
                              width: 15,
                              decoration: BoxDecoration(
                                color: MyColors.primaryColor,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(30),
                                ),
                              ),
                              child: Text(
                                '2',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: MyColors.primaryFont,
                                  fontSize: 10,
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
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
            color: Colors.white,
            height: 169,
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(
                        dish.dishName,
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: MyColors.primaryFont,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 0,
                      child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        height: 40,
                        width: 100,
                        decoration: BoxDecoration(
                          border: Border.all(width: 0, color: Colors.black),
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(27)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Text(
                              dish.dishPrice.toString(),
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: MyColors.primaryFont,
                                fontSize: 22,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(2, 5, 0, 0),
                              alignment: Alignment.centerRight,
                              decoration: BoxDecoration(),
                              child: Text(
                                'KSH',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: MyColors.primaryFont,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          //Got to the ratings page
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 22,
                            ),
                            Text(
                              '4.9',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black54,
                                fontFamily: MyColors.primaryFont,
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Container(
                        alignment: Alignment.bottomCenter,
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Icon(
                          Icons.circle,
                          size: 6,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        '\$\$ Min Order 0 Ksh',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black54,
                          fontFamily: MyColors.primaryFont,
                        ),
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Container(
                        alignment: Alignment.bottomCenter,
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Icon(
                          Icons.circle,
                          size: 6,
                          color: Colors.black54,
                        ),
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        'Delivey fee 100 Ksh',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black54,
                          fontFamily: MyColors.primaryFont,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 8, 0, 0),
                  height: 43,
                  color: Colors.white,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 0,
                        // ignore: deprecated_member_use
                        child: FlatButton(
                          color: Colors.redAccent.withOpacity(0.1),
                          onPressed: () {},
                          child: Text(
                            'Sold By',
                            style: TextStyle(
                              fontSize: 18,
                              color: MyColors.primaryColor,
                              fontFamily: MyColors.primaryFont,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: IconButton(
                          alignment: Alignment.centerRight,
                          icon: Icon(
                            Icons.arrow_drop_down_sharp,
                            size: 34,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            //
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Divider(
            color: Colors.black45,
          ),
          Container(
            padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
            height: 200,
            color: Colors.white,
            child: Center(
              child: Text(
                dish.dishDesc,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                  fontFamily: MyColors.primaryFont,
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              width: double.infinity,
              // ignore: deprecated_member_use
              child: FlatButton(
                color: MyColors.primaryColor,
                onPressed: () {},
                child: Text(
                  'Add To Cart',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontFamily: MyColors.primaryFont,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container buildRestaurantsTiles(restaurant) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(right: 10.0),
        child: Stack(
          children: [
            Container(
              //padding: EdgeInsets.symmetric(vertical: 5),
              height: 100,
              width: 300,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  color: Colors.red,
                  image: DecorationImage(
                    image: AssetImage(restaurant.imageURL),
                    fit: BoxFit.cover,
                  )),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: const EdgeInsets.only(top: 15.0),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black,
                        ]),
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    color: Colors.red,
                  ),
                  child: Text(
                    restaurant.restName,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: MyColors.primaryFont),
                  ),
                ),
              ),
            ),
            Container(
              height: 100,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.red,
                      Colors.black,
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container buildContainer(restaurant) {
    return Container(
      alignment: Alignment.center,
      height: 200,
      width: 150,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            spreadRadius: 2.0,
            blurRadius: 2,
            offset: Offset(0, 3),
          ),
        ],
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        children: [
          Container(
            height: 140,
            width: 150,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                color: Colors.red,
                image: DecorationImage(
                  image: AssetImage(restaurant.imageURL),
                  fit: BoxFit.cover,
                )),
          ),
          Container(
            height: 60,
            alignment: Alignment.center,
            child: Column(
              children: [
                Text(
                  restaurant.restName,
                  textAlign: TextAlign.center,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontFamily: MyColors.primaryFont),
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 0,
                      child: Row(
                        children: [
                          Icon(
                            Icons.star,
                            size: 18,
                            color: Colors.yellow,
                          ),
                          Text(
                            restaurant.reviews.toString() +
                                '(' +
                                restaurant.noOfReviews.toString() +
                                ') reviews',
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 15,
                                fontFamily: MyColors.primaryFont,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        restaurant.location,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                            fontFamily: MyColors.primaryFont,
                            fontWeight: FontWeight.w400),
                      ),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Container listedRest(restaurant) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
      height: 300,
      width: 170,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            spreadRadius: 2.0,
            blurRadius: 2,
            offset: Offset(0, 3),
          ),
        ],
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        children: [
          Container(
            height: 120,
            width: 170,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                color: Colors.red,
                image: DecorationImage(
                  image: AssetImage(restaurant.imageURL),
                  fit: BoxFit.cover,
                )),
          ),
          Container(
            height: 44,
            alignment: Alignment.center,
            child: Column(
              children: [
                Text(
                  restaurant.restName,
                  textAlign: TextAlign.center,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontFamily: MyColors.primaryFont),
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 0,
                      child: Row(
                        children: [
                          Icon(
                            Icons.star,
                            size: 18,
                            color: Colors.yellow,
                          ),
                          Text(
                            restaurant.reviews.toString() +
                                '(' +
                                restaurant.noOfReviews.toString() +
                                ') reviews',
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 15,
                                fontFamily: MyColors.primaryFont,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        restaurant.location,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                            fontFamily: MyColors.primaryFont,
                            fontWeight: FontWeight.w400),
                      ),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Container buildDishCard(dish) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            height: 200,
            width: 140,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  spreadRadius: 2.0,
                  blurRadius: 2,
                  offset: Offset(0, 3),
                ),
              ],
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Column(
              children: [
                Container(
                  height: 140,
                  width: 140,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                      image: DecorationImage(
                        image: AssetImage(dish.image),
                        fit: BoxFit.cover,
                      )),
                ),
                Container(
                  height: 60,
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Text(
                        dish.dishName,
                        textAlign: TextAlign.center,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontFamily: MyColors.primaryFont),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 5),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 0,
                              child: Icon(
                                Icons.format_align_right_rounded,
                                size: 18,
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(
                                dish.category,
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16,
                                    fontFamily: MyColors.primaryFont,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(
                                dish.dishPrice.toString() + ' KSH',
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 16,
                                    fontFamily: MyColors.primaryFont,
                                    fontWeight: FontWeight.w400),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _settingModalBottomSheet(context) {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext bc) {
        return SingleChildScrollView(
          child: Container(
              //child: GoogleMap(initialCameraPosition: CameraPosition(target: ),),
              ),
        );
      },
    );
  }
}
