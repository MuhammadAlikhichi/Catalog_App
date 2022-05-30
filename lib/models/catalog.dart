class CatalogModel {
  static final catModel = CatalogModel.internal();
  CatalogModel.internal();
  factory CatalogModel() => catModel;

  static List<Item>? items;

  // get item by id
  Item? getById(int id) =>
      items?.firstWhere((element) => element.id == id, orElse: null);
  //get item by position
  Item getByPosition(int pos) => items![pos];

  // = [
  //   Item(
  //     id: 1,
  //     name: 'iphone 12 pro',
  //     desc: 'apple iphone 12th generation',
  //     price: 999,
  //     color: '#33505a',
  //     image:
  //         'https://propakistani.pk/price/wp-content/uploads/2019/11/Apple-iPhone-12-Pro-Max-price-1.png',
  //   )
  // ];
}

class Item {
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item(
      {required this.id,
      required this.name,
      required this.desc,
      required this.price,
      required this.color,
      required this.image});
  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map["id"],
      name: map["name"],
      desc: map["desc"],
      price: map["price"],
      color: map["color"],
      image: map["image"],
    );
  }
  toMap() => {
        "id": id,
        "name": name,
        "desc": desc,
        "price": price,
        "color": color,
        "image": image,
      };
}
