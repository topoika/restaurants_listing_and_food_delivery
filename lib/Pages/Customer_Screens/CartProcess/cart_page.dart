import 'package:flutter/material.dart';
import 'package:wiil_food_and_restaurant_listing/Models/dishes_model.dart';
import 'package:wiil_food_and_restaurant_listing/theme_data.dart';

class CartPage extends StatefulWidget {
  CartPage({Key key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int items = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.backColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_outlined,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              //Go to settings
            },
            icon: Icon(
              Icons.more_vert_outlined,
              color: Colors.black,
            ),
          )
        ],
        elevation: 5,
        centerTitle: true,
        backgroundColor: MyColors.backColor,
        title: Text(
          "My Orders",
          style: TextStyle(
              color: Colors.black,
              fontFamily: MyColors.primaryFont,
              fontSize: 20),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              //child: cartEmpty
              child: ListView.builder(
                itemCount: dishes.length,
                itemBuilder: (context, int index) {
                  var dish = dishes[index];
                  var totalPrice = dish.dishPrice * items;
                  return dish.isAdded == true
                      ? Container(
                          padding: EdgeInsets.all(5),
                          margin: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          height: 80,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                spreadRadius: 2.0,
                                blurRadius: 2,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: 80,
                                child: Image.asset(
                                  dish.image,
                                ),
                              ),
                              Container(
                                width: 140,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      dish.dishName,
                                      softWrap: true,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: MyColors.primaryFont,
                                          fontSize: 18),
                                    ),
                                    Container(
                                      width: 130,
                                      margin: EdgeInsets.only(top: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              if (items != 1) {
                                                setState(() {
                                                  items = items - 1;
                                                });
                                              }
                                            },
                                            child: Container(
                                              alignment: Alignment.center,
                                              height: 24,
                                              width: 24,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.redAccent
                                                    .withOpacity(0.1),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey,
                                                    spreadRadius: 2.0,
                                                    blurRadius: 2,
                                                    offset: Offset(0, 3),
                                                  ),
                                                ],
                                              ),
                                              child: Icon(Icons.remove),
                                            ),
                                          ),
                                          Container(
                                            alignment: Alignment.center,
                                            height: 30,
                                            width: 30,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.white,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey,
                                                  spreadRadius: 2.0,
                                                  blurRadius: 2,
                                                  offset: Offset(0, 3),
                                                ),
                                              ],
                                            ),
                                            child: Text(
                                              items.toString(),
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontFamily:
                                                      MyColors.primaryFont,
                                                  fontSize: 18),
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                items = items + 1;
                                              });
                                            },
                                            child: Container(
                                              alignment: Alignment.center,
                                              height: 24,
                                              width: 24,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.redAccent
                                                    .withOpacity(0.1),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey,
                                                    spreadRadius: 2.0,
                                                    blurRadius: 2,
                                                    offset: Offset(0, 3),
                                                  ),
                                                ],
                                              ),
                                              child: Icon(Icons.add),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Spacer(),
                              Container(
                                margin: EdgeInsets.only(right: 10),
                                alignment: Alignment.topCenter,
                                child: Column(
                                  children: [
                                    Text(
                                      totalPrice.toString() + ' KSH',
                                      softWrap: true,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: MyColors.primaryFont,
                                          fontSize: 16),
                                    ),
                                    Spacer(),
                                    Container(
                                      child: TextButton(
                                        style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(Colors
                                                    .redAccent
                                                    .withOpacity(0.1)),
                                            padding: MaterialStateProperty.all(
                                                EdgeInsets.symmetric(
                                                    horizontal: 10))),
                                        onPressed: () {
                                          //remove from cart
                                        },
                                        child: Text(
                                          'Remove',
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: MyColors.primaryColor,
                                            fontFamily: MyColors.primaryFont,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      : Container(
                          child: null,
                        );
                },
              ),
            ),
            Container(
              //height: 100,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(right: 15, left: 15),
                    margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    height: 50,
                    decoration: BoxDecoration(
                      color: MyColors.primaryColor.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          spreadRadius: 2.0,
                          blurRadius: 2,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.cloud,
                          size: 35,
                          color: Colors.yellow,
                        ),
                        Spacer(),
                        Container(
                          width: 200,
                          child: TextFormField(
                            cursorColor: Colors.white70,
                            style: TextStyle(
                              fontFamily: MyColors.primaryFont,
                              color: Colors.black,
                              fontSize: 16,
                            ),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Apply Coupons',
                              hintStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontFamily: MyColors.primaryFont,
                              ),
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.arrow_forward_sharp,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 8),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text("Items Total", style: textStyle()),
                              ),
                              Text("1243.00 KSH", style: textStyle2())
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 8),
                          child: Row(
                            children: [
                              Expanded(
                                child:
                                    Text("Delivery Charge", style: textStyle()),
                              ),
                              Text("1243.00 KSH", style: textStyle2())
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 8),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text("Tax", style: textStyle()),
                              ),
                              Text("1243.00 KSH", style: textStyle2())
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 8),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text("Total :",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 19,
                                      fontFamily: MyColors.primaryFont,
                                    )),
                              ),
                              Text("1243.00 KSH",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 19,
                                    fontFamily: MyColors.primaryFont,
                                  ))
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            //Go to check out page
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 70, vertical: 13),
                            decoration: BoxDecoration(
                                color: MyColors.primaryColor,
                                borderRadius: BorderRadius.circular(10)),
                            margin: EdgeInsets.only(
                                top: 20, right: 30, left: 39, bottom: 10),
                            child: Text(
                              "Confirm Order 👍",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontFamily: MyColors.primaryFont,
                              ),
                            ),
                          ),
                        )
                      ],
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

textStyle() {
  return TextStyle(
    color: Colors.grey[600],
    fontSize: 14,
    fontFamily: MyColors.primaryFont,
  );
}

textStyle2() {
  return TextStyle(
    color: Colors.black,
    fontSize: 14,
    fontFamily: MyColors.primaryFont,
  );
}
