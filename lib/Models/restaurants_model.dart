class Restaurant {
  final String restName;
  final String imageURL;
  final String restDesc;
  final String location;
  final String deliveryTime;
  final double reviews;
  final int noOfReviews;

  Restaurant({
    this.restName,
    this.imageURL,
    this.restDesc,
    this.location,
    this.deliveryTime,
    this.reviews,
    this.noOfReviews,
  });
}

List restaurants = [
  Restaurant(
    restName: "Clarion",
    imageURL: "assets/images/rest1.png",
    restDesc:
        "The owner of Philly Fair Trade Coffee Co.looks at his POS reports and decides that he needs to cut overhead costs. One of his options is to get coffee beans from a cheaper – but still fair trade – supplier in Costa Rica. He samples coffee produced by the new vendor and realizes that the quality of the coffee is not on par with that of his original, more expensive supplier. Since his cafe’s mission is to serve the best cup of coffee, and switching vendors would not further his mission, he wouldn’t switch suppliers. He would have to find another way to cut costs, like reducing business hours or finding new vendors for paper cups.",
    location: "Nairobi",
    deliveryTime: "20-25",
    reviews: 4.9,
    noOfReviews: 243,
  ),
  Restaurant(
    restName: "Pronto",
    imageURL: "assets/images/rest2.png",
    restDesc:
        "The owner of Philly Fair Trade Coffee Co.looks at his POS reports and decides that he needs to cut overhead costs. One of his options is to get coffee beans from a cheaper – but still fair trade – supplier in Costa Rica. He samples coffee produced by the new vendor and realizes that the quality of the coffee is not on par with that of his original, more expensive supplier. Since his cafe’s mission is to serve the best cup of coffee, and switching vendors would not further his mission, he wouldn’t switch suppliers. He would have to find another way to cut costs, like reducing business hours or finding new vendors for paper cups.",
    location: "Nairobi",
    deliveryTime: "20-25",
    reviews: 4.7,
    noOfReviews: 123,
  ),
  Restaurant(
    restName: "Nokras Spa",
    imageURL: "assets/images/rest3.png",
    restDesc:
        "The owner of Philly Fair Trade Coffee Co.looks at his POS reports and decides that he needs to cut overhead costs. One of his options is to get coffee beans from a cheaper – but still fair trade – supplier in Costa Rica. He samples coffee produced by the new vendor and realizes that the quality of the coffee is not on par with that of his original, more expensive supplier. Since his cafe’s mission is to serve the best cup of coffee, and switching vendors would not further his mission, he wouldn’t switch suppliers. He would have to find another way to cut costs, like reducing business hours or finding new vendors for paper cups.",
    location: "Muranga",
    deliveryTime: "20-25",
    reviews: 5.0,
    noOfReviews: 138,
  ),
  Restaurant(
    restName: "Triple F",
    imageURL: "assets/images/rest4.png",
    restDesc:
        "The owner of Philly Fair Trade Coffee Co.looks at his POS reports and decides that he needs to cut overhead costs. One of his options is to get coffee beans from a cheaper – but still fair trade – supplier in Costa Rica. He samples coffee produced by the new vendor and realizes that the quality of the coffee is not on par with that of his original, more expensive supplier. Since his cafe’s mission is to serve the best cup of coffee, and switching vendors would not further his mission, he wouldn’t switch suppliers. He would have to find another way to cut costs, like reducing business hours or finding new vendors for paper cups.",
    location: "Kitengela",
    deliveryTime: "20-25",
    reviews: 4.0,
    noOfReviews: 234,
  ),
  Restaurant(
    restName: "Cafeteria",
    imageURL: "assets/images/rest5.png",
    restDesc:
        "The owner of Philly Fair Trade Coffee Co.looks at his POS reports and decides that he needs to cut overhead costs. One of his options is to get coffee beans from a cheaper – but still fair trade – supplier in Costa Rica. He samples coffee produced by the new vendor and realizes that the quality of the coffee is not on par with that of his original, more expensive supplier. Since his cafe’s mission is to serve the best cup of coffee, and switching vendors would not further his mission, he wouldn’t switch suppliers. He would have to find another way to cut costs, like reducing business hours or finding new vendors for paper cups.",
    location: "Athi River",
    deliveryTime: "3-10",
    reviews: 3.8,
    noOfReviews: 879,
  ),
  Restaurant(
    restName: "Njiwa",
    imageURL: "assets/images/rest6.png",
    restDesc:
        "The owner of Philly Fair Trade Coffee Co.looks at his POS reports and decides that he needs to cut overhead costs. One of his options is to get coffee beans from a cheaper – but still fair trade – supplier in Costa Rica. He samples coffee produced by the new vendor and realizes that the quality of the coffee is not on par with that of his original, more expensive supplier. Since his cafe’s mission is to serve the best cup of coffee, and switching vendors would not further his mission, he wouldn’t switch suppliers. He would have to find another way to cut costs, like reducing business hours or finding new vendors for paper cups.",
    location: "Narok",
    deliveryTime: "20-25",
    reviews: 5.0,
    noOfReviews: 138,
  ),
  Restaurant(
    restName: "Savannah Hotel",
    imageURL: "assets/images/rest7.png",
    restDesc:
        "The owner of Philly Fair Trade Coffee Co.looks at his POS reports and decides that he needs to cut overhead costs. One of his options is to get coffee beans from a cheaper – but still fair trade – supplier in Costa Rica. He samples coffee produced by the new vendor and realizes that the quality of the coffee is not on par with that of his original, more expensive supplier. Since his cafe’s mission is to serve the best cup of coffee, and switching vendors would not further his mission, he wouldn’t switch suppliers. He would have to find another way to cut costs, like reducing business hours or finding new vendors for paper cups.",
    location: "Narok",
    deliveryTime: "20-25",
    reviews: 4.0,
    noOfReviews: 234,
  ),
  Restaurant(
    restName: "Pine Breeze",
    imageURL: "assets/images/rest8.png",
    restDesc:
        "The owner of Philly Fair Trade Coffee Co.looks at his POS reports and decides that he needs to cut overhead costs. One of his options is to get coffee beans from a cheaper – but still fair trade – supplier in Costa Rica. He samples coffee produced by the new vendor and realizes that the quality of the coffee is not on par with that of his original, more expensive supplier. Since his cafe’s mission is to serve the best cup of coffee, and switching vendors would not further his mission, he wouldn’t switch suppliers. He would have to find another way to cut costs, like reducing business hours or finding new vendors for paper cups.",
    location: "Athi River",
    deliveryTime: "3-10",
    reviews: 4.8,
    noOfReviews: 879,
  ),
  Restaurant(
    restName: "Nokras Spa",
    imageURL: "assets/images/rest3.png",
    restDesc:
        "The owner of Philly Fair Trade Coffee Co.looks at his POS reports and decides that he needs to cut overhead costs. One of his options is to get coffee beans from a cheaper – but still fair trade – supplier in Costa Rica. He samples coffee produced by the new vendor and realizes that the quality of the coffee is not on par with that of his original, more expensive supplier. Since his cafe’s mission is to serve the best cup of coffee, and switching vendors would not further his mission, he wouldn’t switch suppliers. He would have to find another way to cut costs, like reducing business hours or finding new vendors for paper cups.",
    location: "Muranga",
    deliveryTime: "20-25",
    reviews: 5.0,
    noOfReviews: 138,
  ),
  Restaurant(
    restName: "Umoja Hotel",
    imageURL: "assets/images/rest11.png",
    restDesc:
        "The owner of Philly Fair Trade Coffee Co.looks at his POS reports and decides that he needs to cut overhead costs. One of his options is to get coffee beans from a cheaper – but still fair trade – supplier in Costa Rica. He samples coffee produced by the new vendor and realizes that the quality of the coffee is not on par with that of his original, more expensive supplier. Since his cafe’s mission is to serve the best cup of coffee, and switching vendors would not further his mission, he wouldn’t switch suppliers. He would have to find another way to cut costs, like reducing business hours or finding new vendors for paper cups.",
    location: "Kitengela",
    deliveryTime: "20-25",
    reviews: 4.0,
    noOfReviews: 234,
  ),
  Restaurant(
    restName: "Cafeteria",
    imageURL: "assets/images/rest5.png",
    restDesc:
        "The owner of Philly Fair Trade Coffee Co.looks at his POS reports and decides that he needs to cut overhead costs. One of his options is to get coffee beans from a cheaper – but still fair trade – supplier in Costa Rica. He samples coffee produced by the new vendor and realizes that the quality of the coffee is not on par with that of his original, more expensive supplier. Since his cafe’s mission is to serve the best cup of coffee, and switching vendors would not further his mission, he wouldn’t switch suppliers. He would have to find another way to cut costs, like reducing business hours or finding new vendors for paper cups.",
    location: "Athi River",
    deliveryTime: "3-10",
    reviews: 3.8,
    noOfReviews: 879,
  ),
  Restaurant(
    restName: "Jangwani",
    imageURL: "assets/images/rest6.png",
    restDesc:
        "The owner of Philly Fair Trade Coffee Co.looks at his POS reports and decides that he needs to cut overhead costs. One of his options is to get coffee beans from a cheaper – but still fair trade – supplier in Costa Rica. He samples coffee produced by the new vendor and realizes that the quality of the coffee is not on par with that of his original, more expensive supplier. Since his cafe’s mission is to serve the best cup of coffee, and switching vendors would not further his mission, he wouldn’t switch suppliers. He would have to find another way to cut costs, like reducing business hours or finding new vendors for paper cups.",
    location: "Muranga",
    deliveryTime: "20-25",
    reviews: 5.0,
    noOfReviews: 138,
  ),
  Restaurant(
    restName: "Chaka Ranch",
    imageURL: "assets/images/rest10.png",
    restDesc:
        "The owner of Philly Fair Trade Coffee Co.looks at his POS reports and decides that he needs to cut overhead costs. One of his options is to get coffee beans from a cheaper – but still fair trade – supplier in Costa Rica. He samples coffee produced by the new vendor and realizes that the quality of the coffee is not on par with that of his original, more expensive supplier. Since his cafe’s mission is to serve the best cup of coffee, and switching vendors would not further his mission, he wouldn’t switch suppliers. He would have to find another way to cut costs, like reducing business hours or finding new vendors for paper cups.",
    location: "Nyeri",
    deliveryTime: "20-25",
    reviews: 4.0,
    noOfReviews: 234,
  ),
  Restaurant(
    restName: "Pine Breeze",
    imageURL: "assets/images/rest8.png",
    restDesc:
        "The owner of Philly Fair Trade Coffee Co.looks at his POS reports and decides that he needs to cut overhead costs. One of his options is to get coffee beans from a cheaper – but still fair trade – supplier in Costa Rica. He samples coffee produced by the new vendor and realizes that the quality of the coffee is not on par with that of his original, more expensive supplier. Since his cafe’s mission is to serve the best cup of coffee, and switching vendors would not further his mission, he wouldn’t switch suppliers. He would have to find another way to cut costs, like reducing business hours or finding new vendors for paper cups.",
    location: "Athi River",
    deliveryTime: "3-10",
    reviews: 4.8,
    noOfReviews: 879,
  ),
];
