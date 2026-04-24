class CatalogModel {
  static final items = [
    Item(
        id: 1,
        name: "iPhone 13 Pro Max",
        desc: "Apple iPhone 13th generation",
        price: 1099,
        color: "#33505a",
        image: "assets/images/13Pro Max.jpg"),
    Item(
        id: 2,
        name: "Samsung S21 Ultra",
        desc: "Samsung Galaxy S21 Ultra 5G",
        price: 1199,
        color: "#000000",
        image: "assets/images/Samsung S21Ultra.png"),
    Item(
        id: 3,
        name: "Airpods Pro",
        desc: "Apple Airpods Pro with MagSafe",
        price: 249,
        color: "#ffffff",
        image: "assets/images/Airpods Pro.png"),
    Item(
        id: 4,
        name: "Smart TV",
        desc: "Samsung 4K Ultra HD Smart LED TV",
        price: 499,
        color: "#000000",
        image: "assets/images/Smart TV.jpg"),
    Item(
        id: 5,
        name: "Google Pixel 6",
        desc: "Google Pixel 6th generation",
        price: 599,
        color: "#f5f5f7",
        image: "assets/images/Google Pixel 6.jpg"),
    Item(
        id: 6,
        name: "Macbook",
        desc: "Macbook M3 Pro",
        price: 999,
        color: "#f5f5f7",
        image: "assets/images/Macbook.png"),
  ];

  // Get Item by ID
  Item getById(int id) =>
      items.firstWhere((element) => element.id == id);

  // Get Item by position
  Item getByPosition(int pos) => items[pos];
}

class Item {
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;
  final double? height;
  final double? width;

  Item({
    required this.id,
    required this.name,
    required this.desc,
    required this.price,
    required this.color,
    required this.image,
    this.height,
    this.width,
  });
}
