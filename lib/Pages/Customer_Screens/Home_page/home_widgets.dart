import 'package:flutter/material.dart';
import 'package:wiil_food_and_restaurant_listing/Pages/Customer_Screens/CartProcess/cart_page.dart';

import '../../../theme_data.dart';

class SearchTopBar extends StatelessWidget {
  const SearchTopBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(left: 10, right: 5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.white),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
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
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Search for Dishes & Restaurants',
                      hintStyle: TextStyle(
                        color: Colors.black87,
                        fontSize: 14,
                        fontFamily: MyColors.primaryFont,
                      ),
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      //
                    },
                    icon: Icon(
                      Icons.search,
                      color: MyColors.primaryColor,
                    )),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 0,
          child: Stack(
            alignment: Alignment.topRight,
            children: [
              IconButton(
                alignment: Alignment.centerRight,
                icon: Icon(
                  Icons.shopping_bag,
                  color: Colors.white,
                  size: 30,
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CartPage()));
                },
              ),
              Align(
                alignment: Alignment.topRight,
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
        )
      ],
    );
  }
}

class Location {}
