import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/core/service/database/firestore_checkout.dart';
import 'package:untitled/core/viewModel/checkout_view_model.dart';
import 'package:untitled/models/checkout_model.dart';
import 'package:untitled/models/setting_model.dart';
import 'package:untitled/modules_trader/OrderDetails_screen/OrderDetails_screen.dart';

class OrdersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final FirestoreCheckout _store = FirestoreCheckout();
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
          stream: _store.loadAllOrders(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<CheckoutModel> orders = [];
              for (var doc in snapshot.data!.docs) {
                orders.add(CheckoutModel(
                    street1: doc.data().toString().contains('street1')
                        ? doc.get('street1')
                        : '',
                    documentId: doc.id,
                    street2: doc.data().toString().contains('street2')
                        ? doc.get('street2')
                        : '',
                    city: doc.data().toString().contains('city')
                        ? doc.get('city')
                        : '',
                    state: doc.data().toString().contains('state')
                    ? doc.get('state')
                    : '',
                    country: doc.data().toString().contains('country')
                    ? doc.get('country')
                    : '',
                    phone: doc.data().toString().contains('phone')
                    ? doc.get('phone')
                    : '',
                    totalPrice: doc.data().toString().contains('totalPrice')
                    ? doc.get('totalPrice')
                    : '',
                    date: doc.data().toString().contains('date')
                    ? doc.get('date')
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
                              'Orders',
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
                        // FirebaseFirestore.instance.collection('ِallOrders').doc(orders[index].documentId).collection('OrderDetails').doc().get(user_id);
                        //print(Get.find<SettingModel>().currentUser!.userId);
                          return Padding(
                            padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                            child: GestureDetector(
                              onTap: () {
                                Get.to(OrderDetails(documentId: '${orders[index].documentId}',));
                              },
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
                                                '${orders[index].date}',
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                ),
                                              ),
                                            ),
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
                                            '${orders[index].street1}',
                                          ),
                                        ),
                                        Container(
                                          child: Text(
                                            '${orders[index].street2}',
                                          ),
                                        ),
                                        Container(
                                          child: Text(
                                            '${orders[index].city}',
                                          ),
                                        ),
                                        Container(
                                          child: Text(
                                            '${orders[index].country}',
                                          ),
                                        ),
                                        Container(
                                          child: Text(
                                            '+${orders[index].phone}',
                                          ),
                                        ),
                                        Divider(
                                          thickness: 1,
                                          color: Colors.grey.shade200,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              child: Text(
                                                'Total Billed',
                                              ),
                                            ),
                                            Container(
                                              child: Text(
                                                '\$${orders[index].totalPrice}',
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
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
                      itemCount: orders.length,
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
