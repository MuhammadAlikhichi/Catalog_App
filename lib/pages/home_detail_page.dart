import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../models/catalog.dart';

class homedetailpage extends StatelessWidget {
  final Item catalog;
  const homedetailpage({Key? key, required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      bottomNavigationBar: Container(
        color: context.cardColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${catalog.price}".text.bold.xl4.red800.make(),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(context.theme.buttonColor),
                shape: MaterialStateProperty.all(
                  StadiumBorder(),
                ),
              ),
              onPressed: () {},
              child: "Add to cart".text.xl.make(),
            ).wh(130, 50),
          ],
        ).p24(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
              tag: (catalog.id.toString()),
              child: Image.network(
                catalog.image,
                // height: 300,
                // width: 300,
              ).w56(context),
            ).p16(),
            Expanded(
              child: VxArc(
                arcType: VxArcType.CONVEY,
                edge: VxEdge.TOP,
                height: 30,
                child: Container(
                  color: context.cardColor,
                  width: context.screenWidth,
                  child: Column(
                    children: [
                      catalog.name.text.bold.lg.xl4
                          .color(context.accentColor)
                          .make(),
                      catalog.desc.text.xl
                          .textStyle(context.captionStyle)
                          .make(),
                      10.heightBox,
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. "
                          .text
                          .textStyle(context.captionStyle)
                          .make()
                          .py4(),
                    ],
                  ).py32(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
