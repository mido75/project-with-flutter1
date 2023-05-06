import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/core/service/database/firestore_checkout.dart';
import 'package:untitled/models/product_model.dart';
import 'package:untitled/models/setting_model.dart';

class OrderDetails extends StatelessWidget {
  String documentId;
  OrderDetails({required this.documentId});
  final FirestoreCheckout _store = FirestoreCheckout();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
          stream: _store.loadOrderDetails(documentId),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<ProductModel> products = [];
              for (var doc in snapshot.data!.docs) {
                products.add(ProductModel(
                  name: doc.data().toString().contains('name')
                      ? doc.get('name')
                      : '',
                  user_id: doc.data().toString().contains('user_id')
                      ? doc.get('user_id')
                      : '',
                  price: doc.data().toString().contains('price')
                      ? doc.get('price')
                      : '',
                ));
              }
              return Column(
                children: [
                  Container(
                    height: 130,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 24, left: 16, right: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          IconButton(
                            padding: EdgeInsets.zero,
                            constraints: BoxConstraints(),
                            onPressed: () {
                              Get.back();
                            },
                            icon: Icon(
                              Icons.arrow_back_ios,
                              color: Colors.black,
                            ),
                          ),
                          Container(
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              'OrderDetails',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Container(
                            width: 24,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.separated(
                      itemBuilder: (context, index) {
                        print(products[index].user_id);
                        print(Get.find<SettingModel>().currentUser!.userId);
                        return Padding(
                          padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                          child: Card(
                            child: Padding(
                              padding: EdgeInsets.all(16),
                              child: Container(
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          child: Text(
                                            'Pending',
                                            style: TextStyle(
                                              color: Colors.red.shade300,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Divider(
                                      thickness: 1,
                                      color: Colors.grey.shade200,
                                    ),
                                    Container(
                                      child: Text(
                                        '${products[index].name}',
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                        '${products[index].price}',
                                      ),
                                    ),
                                    Divider(
                                      thickness: 1,
                                      color: Colors.grey.shade200,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => Divider(
                        thickness: 1,
                        color: Colors.grey.shade200,
                      ),
                      itemCount: products.length,
                    ),
                  ),
                ],
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          }),
    );

  }
}