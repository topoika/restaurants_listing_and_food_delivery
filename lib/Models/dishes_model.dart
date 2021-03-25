import 'package:wiil_food_and_restaurant_listing/Models/categories_model.dart';

class Dish {
  final Category sortCategory;
  final int dishPrice, discount, prepAndDeliveryTime;
  final String dishName, image, dishDesc, category;
  final bool isAdded;

  Dish({
    this.dishPrice,
    this.dishDesc,
    this.isAdded,
    this.discount,
    this.prepAndDeliveryTime,
    this.category,
    this.sortCategory,
    this.dishName,
    this.image,
  });
}

List dishes = [
  Dish(
    category: 'burger',
    sortCategory: burger,
    dishName: "Burger Sandwhich",
    image: "assets/images/dishes/burger_sandwhich.png",
    dishDesc:
        "The owner of Philly Fair Trade Coffee Co. looks at his POS reports and decides that he needs to cut overhead costs. One of his options is to get coffee beans from a cheaper – but still fair trade – supplier in Costa Rica. He samples coffee produced by the new vendor and realizes that the quality of the coffee is not on par with that of his original, more expensive supplier. Since his cafe’s mission is to serve the best cup of coffee, and switching vendors would not further his mission, he wouldn’t switch suppliers. He would have to find another way to cut costs, like reducing business hours or finding new vendors for paper cups.",
    prepAndDeliveryTime: 40,
    discount: 23,
    dishPrice: 350,
    isAdded: true,
  ),
  Dish(
    category: 'burger',
    sortCategory: burger,
    dishName: "Burger Cheese",
    image: "assets/images/dishes/burger-king-whopper-with-cheese.png",
    dishDesc:
        "The owner of Philly Fair Trade Coffee Co. looks at his POS reports and decides that he needs to cut overhead costs. One of his options is to get coffee beans from a cheaper – but still fair trade – supplier in Costa Rica. He samples coffee produced by the new vendor and realizes that the quality of the coffee is not on par with that of his original, more expensive supplier. Since his cafe’s mission is to serve the best cup of coffee, and switching vendors would not further his mission, he wouldn’t switch suppliers. He would have to find another way to cut costs, like reducing business hours or finding new vendors for paper cups.",
    prepAndDeliveryTime: 50,
    discount: 32,
    dishPrice: 150,
    isAdded: true,
  ),
  Dish(
    category: 'pizza',
    sortCategory: pizza,
    dishName: "Bread Sandwhich",
    image: "assets/images/dishes/breadsandwhich.png",
    dishDesc:
        "The owner of Philly Fair Trade Coffee Co. looks at his POS reports and decides that he needs to cut overhead costs. One of his options is to get coffee beans from a cheaper – but still fair trade – supplier in Costa Rica. He samples coffee produced by the new vendor and realizes that the quality of the coffee is not on par with that of his original, more expensive supplier. Since his cafe’s mission is to serve the best cup of coffee, and switching vendors would not further his mission, he wouldn’t switch suppliers. He would have to find another way to cut costs, like reducing business hours or finding new vendors for paper cups.",
    prepAndDeliveryTime: 20,
    discount: 12,
    dishPrice: 145,
    isAdded: false,
  ),
  Dish(
      category: 'chicken',
      sortCategory: chicken,
      dishName: "Fried Chicken",
      image: "assets/images/dishes/fried-chickenfried-chicken.png",
      dishDesc:
          "The owner of Philly Fair Trade Coffee Co. looks at his POS reports and decides that he needs to cut overhead costs. One of his options is to get coffee beans from a cheaper – but still fair trade – supplier in Costa Rica. He samples coffee produced by the new vendor and realizes that the quality of the coffee is not on par with that of his original, more expensive supplier. Since his cafe’s mission is to serve the best cup of coffee, and switching vendors would not further his mission, he wouldn’t switch suppliers. He would have to find another way to cut costs, like reducing business hours or finding new vendors for paper cups.",
      prepAndDeliveryTime: 57,
      discount: 14,
      dishPrice: 540,
      isAdded: false),
  Dish(
      category: 'fish',
      sortCategory: fish,
      dishName: "Fried Fish",
      image: "assets/images/dishes/fried-fish.png",
      dishDesc:
          "The owner of Philly Fair Trade Coffee Co. looks at his POS reports and decides that he needs to cut overhead costs. One of his options is to get coffee beans from a cheaper – but still fair trade – supplier in Costa Rica. He samples coffee produced by the new vendor and realizes that the quality of the coffee is not on par with that of his original, more expensive supplier. Since his cafe’s mission is to serve the best cup of coffee, and switching vendors would not further his mission, he wouldn’t switch suppliers. He would have to find another way to cut costs, like reducing business hours or finding new vendors for paper cups.",
      prepAndDeliveryTime: 120,
      discount: 3,
      dishPrice: 130,
      isAdded: true),
  Dish(
    category: 'greens',
    sortCategory: greens,
    dishName: "Soup With Vegetable",
    image: "assets/images/dishes/soupsoupclear-soupshot.png",
    dishDesc:
        "The owner of Philly Fair Trade Coffee Co. looks at his POS reports and decides that he needs to cut overhead costs. One of his options is to get coffee beans from a cheaper – but still fair trade – supplier in Costa Rica. He samples coffee produced by the new vendor and realizes that the quality of the coffee is not on par with that of his original, more expensive supplier. Since his cafe’s mission is to serve the best cup of coffee, and switching vendors would not further his mission, he wouldn’t switch suppliers. He would have to find another way to cut costs, like reducing business hours or finding new vendors for paper cups.",
    prepAndDeliveryTime: 10,
    discount: 1,
    dishPrice: 79,
    isAdded: true,
  ),
  Dish(
      category: 'pizza',
      sortCategory: pizza,
      dishName: "Meat Sandwich",
      image: "assets/images/dishes/meat-sandwhich.png",
      dishDesc:
          "The owner of Philly Fair Trade Coffee Co. looks at his POS reports and decides that he needs to cut overhead costs. One of his options is to get coffee beans from a cheaper – but still fair trade – supplier in Costa Rica. He samples coffee produced by the new vendor and realizes that the quality of the coffee is not on par with that of his original, more expensive supplier. Since his cafe’s mission is to serve the best cup of coffee, and switching vendors would not further his mission, he wouldn’t switch suppliers. He would have to find another way to cut costs, like reducing business hours or finding new vendors for paper cups.",
      prepAndDeliveryTime: 50,
      discount: 24,
      dishPrice: 650,
      isAdded: true),
  Dish(
      category: 'greens',
      sortCategory: greens,
      dishName: "Beef With Greens",
      image: "assets/images/dishes/meat-plate.png",
      dishDesc:
          "The owner of Philly Fair Trade Coffee Co. looks at his POS reports and decides that he needs to cut overhead costs. One of his options is to get coffee beans from a cheaper – but still fair trade – supplier in Costa Rica. He samples coffee produced by the new vendor and realizes that the quality of the coffee is not on par with that of his original, more expensive supplier. Since his cafe’s mission is to serve the best cup of coffee, and switching vendors would not further his mission, he wouldn’t switch suppliers. He would have to find another way to cut costs, like reducing business hours or finding new vendors for paper cups.",
      prepAndDeliveryTime: 13,
      discount: 23,
      dishPrice: 350,
      isAdded: true),
  Dish(
      category: 'burger',
      sortCategory: burger,
      dishName: "Cheese Burger",
      image: "assets/images/dishes/cheeseburgerburger.png",
      dishDesc:
          "The owner of Philly Fair Trade Coffee Co. looks at his POS reports and decides that he needs to cut overhead costs. One of his options is to get coffee beans from a cheaper – but still fair trade – supplier in Costa Rica. He samples coffee produced by the new vendor and realizes that the quality of the coffee is not on par with that of his original, more expensive supplier. Since his cafe’s mission is to serve the best cup of coffee, and switching vendors would not further his mission, he wouldn’t switch suppliers. He would have to find another way to cut costs, like reducing business hours or finding new vendors for paper cups.",
      prepAndDeliveryTime: 54,
      discount: 13,
      dishPrice: 650,
      isAdded: false),
  Dish(
      category: 'greens',
      sortCategory: greens,
      dishName: "Fried Chicken With Greens",
      image: "assets/images/dishes/fried-chicken.png",
      dishDesc:
          "The owner of Philly Fair Trade Coffee Co. looks at his POS reports and decides that he needs to cut overhead costs. One of his options is to get coffee beans from a cheaper – but still fair trade – supplier in Costa Rica. He samples coffee produced by the new vendor and realizes that the quality of the coffee is not on par with that of his original, more expensive supplier. Since his cafe’s mission is to serve the best cup of coffee, and switching vendors would not further his mission, he wouldn’t switch suppliers. He would have to find another way to cut costs, like reducing business hours or finding new vendors for paper cups.",
      prepAndDeliveryTime: 32,
      discount: 19,
      dishPrice: 250,
      isAdded: false),
  Dish(
      category: 'greens',
      sortCategory: greens,
      dishName: "Potato Chips",
      image: "assets/images/dishes/potato-chips.png",
      dishDesc:
          "The owner of Philly Fair Trade Coffee Co. looks at his POS reports and decides that he needs to cut overhead costs. One of his options is to get coffee beans from a cheaper – but still fair trade – supplier in Costa Rica. He samples coffee produced by the new vendor and realizes that the quality of the coffee is not on par with that of his original, more expensive supplier. Since his cafe’s mission is to serve the best cup of coffee, and switching vendors would not further his mission, he wouldn’t switch suppliers. He would have to find another way to cut costs, like reducing business hours or finding new vendors for paper cups.",
      prepAndDeliveryTime: 30,
      discount: 34,
      dishPrice: 150,
      isAdded: false),
  Dish(
      category: 'pizza',
      sortCategory: pizza,
      dishName: "Red Meat Soup",
      image: "assets/images/dishes/soupsoupclear.png",
      dishDesc:
          "The owner of Philly Fair Trade Coffee Co. looks at his POS reports and decides that he needs to cut overhead costs. One of his options is to get coffee beans from a cheaper – but still fair trade – supplier in Costa Rica. He samples coffee produced by the new vendor and realizes that the quality of the coffee is not on par with that of his original, more expensive supplier. Since his cafe’s mission is to serve the best cup of coffee, and switching vendors would not further his mission, he wouldn’t switch suppliers. He would have to find another way to cut costs, like reducing business hours or finding new vendors for paper cups.",
      prepAndDeliveryTime: 54,
      discount: 17,
      dishPrice: 250,
      isAdded: false),
  Dish(
      category: 'chicken',
      sortCategory: chicken,
      dishName: "Chicken Parts",
      image: "assets/images/dishes/fried-chickenfried.png",
      dishDesc:
          "The owner of Philly Fair Trade Coffee Co. looks at his POS reports and decides that he needs to cut overhead costs. One of his options is to get coffee beans from a cheaper – but still fair trade – supplier in Costa Rica. He samples coffee produced by the new vendor and realizes that the quality of the coffee is not on par with that of his original, more expensive supplier. Since his cafe’s mission is to serve the best cup of coffee, and switching vendors would not further his mission, he wouldn’t switch suppliers. He would have to find another way to cut costs, like reducing business hours or finding new vendors for paper cups.",
      prepAndDeliveryTime: 120,
      discount: 60,
      dishPrice: 450,
      isAdded: false),
];
