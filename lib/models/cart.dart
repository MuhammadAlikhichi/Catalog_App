import 'package:fluttercatalog/models/catalog.dart';

class CartModel {
  static final cartModel = CartModel.internal();
  CartModel.internal();
  factory CartModel() => cartModel;
  //catalog field
  late CatalogModel _catalog;

  //colection of IDs _ store Ids of each item
  final List<int> _itemIds = [];

  //get catalog
  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newCatalog) {
    assert(newCatalog != null);
    _catalog = newCatalog;
  }

// get item in cart
  List<Item?> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

  //get total price
  num get totalprice =>
      items.fold(0, (total, current) => total + current!.price);

  //add item
  void add(Item item) {
    _itemIds.add(item.id);
  }

//remove item
  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}
