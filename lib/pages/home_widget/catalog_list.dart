import 'package:flutter/material.dart';
import 'package:fluttercatalog/models/cart.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../models/catalog.dart';
import '../home_detail_page.dart';
import 'catalog_image.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: CatalogModel.items?.length,
        itemBuilder: (context, index) {
          final catalog = CatalogModel.items![index];
          return InkWell(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => homedetailpage(
                  catalog: catalog,
                ),
              ),
            ),
            child: CatalogItem(
              catalog: catalog,
            ),
          );
        });
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({Key? key, required this.catalog}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          Hero(
            tag: (catalog.id.toString()),
            child: CatalogImage(
              image: catalog.image,
            ).w32(context),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                catalog.name.text.bold.lg.color(context.accentColor).make(),
                catalog.desc.text.textStyle(context.captionStyle).make(),
                10.heightBox,
                ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  buttonPadding: EdgeInsets.zero,
                  children: [
                    "\$${catalog.price}".text.bold.xl.make(),
                    _AddtoCart(catalog: catalog),
                  ],
                ).pOnly(right: 8.0),
              ],
            ),
          ),
        ],
      ),
    ).color(context.cardColor).rounded.square(150).make().py16();
  }
}

class _AddtoCart extends StatefulWidget {
  final Item catalog;
  const _AddtoCart({Key? key, required this.catalog}) : super(key: key);

  @override
  State<_AddtoCart> createState() => _AddtoCartState();
}

class _AddtoCartState extends State<_AddtoCart> {
  final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    bool isInCart = _cart.items.contains(widget.catalog) ?? false;
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(context.theme.buttonColor),
        shape: MaterialStateProperty.all(
          StadiumBorder(),
        ),
      ),
      onPressed: () {
        if (!isInCart) {
          isInCart = isInCart.toggle();
          final _catalog = CatalogModel();

          _cart.catalog = _catalog;
          _cart.add(widget.catalog);
          setState(() {});
        }
      },
      child: isInCart ? Icon(Icons.done) : "Add to cart".text.make(),
    );
  }
}
