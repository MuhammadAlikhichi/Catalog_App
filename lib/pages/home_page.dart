import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttercatalog/utils/routes.dart';
import 'package:velocity_x/velocity_x.dart';

import '../models/catalog.dart';
import 'home_widget/catalog_header.dart';
import 'home_widget/catalog_list.dart';
//import '../widgets/theme.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final int days = 30;

  final String name = 'Pakistan';
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    final catalogjson = await rootBundle.loadString("files/catalog.json");
    final decodedData = jsonDecode(catalogjson);
    var productsData = decodedData["products"];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // final dummylist = List.generate(10, (index) => CatalogModel.Items[0]);

    return Scaffold(
        backgroundColor: context.canvasColor,
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
          child: Icon(
            CupertinoIcons.cart,
            color: Colors.white,
          ),
          backgroundColor: context.theme.buttonColor,
        ),
        body: SafeArea(
          child: Container(
            padding: Vx.m32,
            //alignment: Alignment.topLeft,
            //padding: EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CatalogHeader(),
                if (CatalogModel.items != null &&
                    CatalogModel.items!.isNotEmpty)
                  CatalogList().py16().expand()
                else
                  CircularProgressIndicator().centered().expand(),
              ],
            ),
          ),
        ));
  }
}

// ListView.builder(
// padding: EdgeInsets.all(16.0),
// itemCount: CatalogModel.items?.length,
// itemBuilder: (BuildContext context, int index) {
// return ItemWidget(
// item: CatalogModel.items![index],
// );
// },
// )
//////////////////////////////////
// appBar: AppBar(
// title: Center(child: Text('Catalog App')),
// ),
//////////////////////
// Padding(
// padding: const EdgeInsets.all(8.0),
// child: (CatalogModel.items != null && CatalogModel.items!.isNotEmpty)
// ? GridView.builder(
// gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
// crossAxisCount: 2,
// mainAxisSpacing: 16.0,
// crossAxisSpacing: 16,
// ),
// itemBuilder: (context, index) {
// final item = CatalogModel.items![index];
// return Card(
// clipBehavior: Clip.antiAlias,
// shape: RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(10.0)),
// child: GridTile(
// child: Image.network(item.image),
// header: Container(
// child: Text(
// item.name,
// style: TextStyle(
// color: Colors.white,
// ),
// ),
// padding: EdgeInsets.all(12.0),
// decoration: BoxDecoration(
// color: Colors.deepPurple,
// ),
// ),
// footer: Container(
// child: Text(
// item.price.toString(),
// style: TextStyle(
// color: Colors.white,
// ),
// ),
// padding: EdgeInsets.all(12.0),
// decoration: BoxDecoration(
// color: Colors.black,
// ),
// ),
// ),
// );
// },
// itemCount: CatalogModel.items?.length,
// )
// : Center(
// child: CircularProgressIndicator(),
// ),
// ),
// drawer: MyDrawer(),
