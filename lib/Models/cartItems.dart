class CartItems {
  final String dishName, category, image;
  final int dishPrice, quantity, prepAndDeliveryTime;

  CartItems({
    this.category,
    this.image,
    this.prepAndDeliveryTime,
    this.dishName,
    this.dishPrice,
    this.quantity,
  });
}

List cartItems = [
  CartItems(
    category: 'chicken',
    dishName: "Chicken Parts",
    image: "assets/images/dishes/fried-chickenfried.png",
    prepAndDeliveryTime: 120,
    dishPrice: 450,
  ),
  CartItems(
    category: 'greens',
    dishName: "Potato Chips",
    image: "assets/images/dishes/potato-chips.png",
    prepAndDeliveryTime: 30,
    dishPrice: 150,
  ),
  CartItems(
    category: 'pizza',
    dishName: "Red Meat Soup",
    image: "assets/images/dishes/soupsoupclear.png",
    prepAndDeliveryTime: 54,
    dishPrice: 250,
  ),
];
