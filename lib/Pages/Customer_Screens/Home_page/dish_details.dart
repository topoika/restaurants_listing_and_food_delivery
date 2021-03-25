import 'package:flutter/material.dart';
import 'package:wiil_food_and_restaurant_listing/Models/dishes_model.dart';

import '../../../theme_data.dart';

class DishDeatils extends StatefulWidget {
  final dishs;
  const DishDeatils({Key key, this.dishs}) : super(key: key);

  @override
  _DishDeatilsState createState() => _DishDeatilsState();
}

class _DishDeatilsState extends State<DishDeatils> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              child: Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 35),
                    height: 220,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                            widget.dishs.image,
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
                            Colors.black26,
                            Colors.black12,
                          ]),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
              color: Colors.white,
              height: 136,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 5),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text(
                            widget.dishs.dishName,
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(27)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                Text(
                                  widget.dishs.dishPrice.toString(),
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
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 8, 0, 0),
                    height: 43,
                    color: Colors.white,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 0,
                          child: TextButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.redAccent.withOpacity(0.0)),
                                padding: MaterialStateProperty.all(
                                    EdgeInsets.symmetric(horizontal: 10))),
                            onPressed: () {},
                            child: Text(
                              'Specifications',
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
                                _settingModalBottomSheet(context);
                              }),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Divider(
              color: Colors.black45,
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
              height: 200,
              color: Colors.white,
              child: Center(
                child: Text(
                  widget.dishs.dishDesc,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                    fontFamily: MyColors.primaryFont,
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              color: Colors.white24,
              alignment: Alignment.center,
              height: 50,
              child: Text(
                'Other Awesome Dishes',
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: MyColors.primaryFont,
                    fontSize: 20),
              ),
            ),
          ),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                final dish = dishes[index];

                return GestureDetector(
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DishDeatils(
                                  dishs: dish,
                                )),
                        ModalRoute.withName('/'));
                  },
                  child: dishCard(dish),
                );
              },
              childCount: dishes.length,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: MyColors.primaryColor,
        onPressed: () {
          // to add to cart
        },
        child: Icon(
          Icons.add_shopping_cart_sharp,
          color: Colors.white,
          size: 32,
        ),
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
            child: Container(
              padding: EdgeInsets.all(20),
              height: 300,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10))),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: 50,
                        width: 50,
                        color: MyColors.primaryColor,
                        child: Text("S"),
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: 50,
                        width: 50,
                        color: Colors.yellow,
                        child: Text("M"),
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: 50,
                        width: 50,
                        color: MyColors.primaryColor,
                        child: Text("L"),
                      )
                    ],
                  ),
                  IconButton(
                    icon: Icon(Icons.arrow_forward_ios),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Container dishCard(dish) {
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
                image: DecorationImage(
                  image: AssetImage(dish.image),
                  fit: BoxFit.cover,
                )),
          ),
          Container(
            height: 46,
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
                  padding: EdgeInsets.symmetric(horizontal: 8),
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
    );
  }
}
