import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:untitled/core_trader/service/store.dart';
import 'package:untitled/core_trader/viewModel_trader/control_view_model_t.dart';
import 'package:untitled/models/product_model.dart';
import 'package:untitled/modules/product_screen/product_screen.dart';
import 'package:untitled/modules_trader/EditProduct_screen/EditProduct_screen.dart';
import 'package:untitled/shared/components/components.dart';
import 'package:untitled/shared/constants/constants.dart';

class ManageProducts extends StatefulWidget {
  //static String id = 'ManageProducts';
  @override
  _ManageProductsState createState() => _ManageProductsState();
}
/*
class _ManageProductsState extends State<ManageProducts> {
  final _store = Store();
  List<ProductModel> products = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        elevation: 0.0,
        title: Padding(
          padding: const EdgeInsets.only(left: 60),
          child: Text(
            'Products',
            style: TextStyle(
                color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
              stream: _store.loadProducts(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  for (var doc in snapshot.data!.docs) {
                    var data = doc.data;
                    products.add(ProductModel(
                        id: doc.id,
                        price: doc.get('price'),
                        name: doc.get('name'),
                        description: doc.get('description'),
                        image: doc.get('image'),
                        category: doc.get('category')));
                  }
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: .8,
                    ),
                    itemBuilder: (context, index) => Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: GestureDetector(
                        onTapUp: (details) async {
                          double dx = details.globalPosition.dx;
                          double dy = details.globalPosition.dy;
                          double dx2 = MediaQuery.of(context).size.width - dx;
                          double dy2 = MediaQuery.of(context).size.width - dy;

                    await showMenu(
                        context: context,
                        position: RelativeRect.fromLTRB(dx, dy, dx2, dy2),
                        items: [
                          MyPopupMenuItem(
                            onClick: () {
                              Get.to(EditProductScreen(model: products[index],));
                             /* Navigator.pushNamed(context, EditProduct.id,
                                  arguments: products[index]);

                              */
                            },
                            child: Text('Edit'),
                          ),
                          MyPopupMenuItem(
                            onClick: () {
                              _store.deleteProduct(products[index].id);
                              Navigator.pop(context);
                            },
                            child: Text('Delete'),
                          ),
                        ]);


                        },
                        child: Stack(
                          children: <Widget>[
                            Positioned.fill(
                              child: Image.network(
                                '${products[index].image}',
                                fit: BoxFit.fill,
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              child: Opacity(
                                opacity: .6,
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 60,
                                  color: Colors.white,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 5),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          '${products[index].name}',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          '${products[index].description}',
                                          maxLines: 1,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text('\$ ${products[index].price}')
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    itemCount: products.length,
                  );
                } else {
                  return Center(child: Text('Loading...'));
                }
              },
            ),
    );
  }
}

 */

class _ManageProductsState extends State<ManageProducts> {
  final _store = Store();
  List<ProductModel> products = [];

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _store.loadProducts(),
      builder: (context, snapshot) {
        for (var doc in snapshot.data!.docs) {
          var data = doc.data;
          products.add(ProductModel(
              id: doc.id,
              price: doc.get('price'),
              name: doc.get('name'),
              description: doc.get('description'),
              image: doc.get('image'),
              category: doc.get('category')));
        }
        return snapshot.hasData == null
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'imagies/undraw_empty_cart_co35.svg',
                      width: 150,
                      height: 150,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Products Empty',
                      style: TextStyle(
                        fontSize: 32,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              )
            : Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.white,
                  automaticallyImplyLeading: false,
                  leading: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                    ),
                  ),
                  elevation: 0.0,
                  title: Padding(
                    padding: const EdgeInsets.only(left: 60),
                    child: Text(
                      'Products',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                body: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: .8,
                  ),
                  itemBuilder: (context, index) => Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: GestureDetector(
                      onTapUp: (details) async {
                        double dx = details.globalPosition.dx;
                        double dy = details.globalPosition.dy;
                        double dx2 = MediaQuery.of(context).size.width - dx;
                        double dy2 = MediaQuery.of(context).size.width - dy;

                        await showMenu(
                            context: context,
                            position: RelativeRect.fromLTRB(dx, dy, dx2, dy2),
                            items: [
                              MyPopupMenuItem(
                                onClick: () {
                                  Get.to(EditProductScreen(
                                    model: products[index],
                                  ));
                                  /* Navigator.pushNamed(context, EditProduct.id,
                                  arguments: products[index]);

                              */
                                },
                                child: Text('Edit'),
                              ),
                              MyPopupMenuItem(
                                onClick: () {
                                  _store.deleteProduct(products[index].id);
                                  Navigator.pop(context);
                                },
                                child: Text('Delete'),
                              ),
                            ]);
                      },
                      child: Stack(
                        children: <Widget>[
                          Positioned.fill(
                            child: Image.network(
                              '${products[index].image}',
                              fit: BoxFit.fill,
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            child: Opacity(
                              opacity: .6,
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: 60,
                                color: Colors.white,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        '${products[index].name}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        '${products[index].description}',
                                        maxLines: 1,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text('\$ ${products[index].price}')
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  itemCount: products.length,
                ),
              );
      },
    );
  }
}
