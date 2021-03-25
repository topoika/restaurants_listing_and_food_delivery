class Category {
  final String imgURL;
  final String name;

  Category({this.imgURL, this.name});
}

final Category all = Category(name: 'All', imgURL: "assets/images/logo1.png");
final Category coffee =
    Category(imgURL: 'assets/images/coffee.png', name: "coffee");
final Category pizza =
    Category(imgURL: 'assets/images/pizza.png', name: 'pizza');
final Category drinks =
    Category(imgURL: 'assets/images/drinks.png', name: 'drinks');

final Category chicken =
    Category(imgURL: 'assets/images/chicken.png', name: 'chicken');
final Category burger =
    Category(imgURL: 'assets/images/burger.png', name: 'burger');

final Category cakes =
    Category(imgURL: 'assets/images/cake.png', name: 'cakes');
final Category fish = Category(imgURL: 'assets/images/cake.png', name: 'fish');

final Category greens =
    Category(imgURL: 'assets/images/cake.png', name: 'greens');

List categories = [
  Category(name: 'All', imgURL: "assets/images/logo1.png"),
  Category(imgURL: 'assets/images/coffee.png', name: "coffee"),
  Category(imgURL: 'assets/images/pizza.png', name: 'pizza'),
  Category(imgURL: 'assets/images/drinks.png', name: 'drinks'),
  Category(imgURL: 'assets/images/chicken.png', name: 'chicken'),
  Category(imgURL: 'assets/images/burger.png', name: 'burger'),
  Category(imgURL: 'assets/images/cake.png', name: 'cakes'),
  Category(imgURL: 'assets/images/cake.png', name: 'fish'),
  Category(imgURL: 'assets/images/cake.png', name: 'greens'),
];
