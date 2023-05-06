import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:untitled/models/cart_product_model.dart';
import 'package:untitled/models/checkout_model.dart';
import 'package:untitled/models/product_model.dart';

class FirestoreCheckout {

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final CollectionReference _ordersCollection = FirebaseFirestore.instance
      .collection('Users').doc(FirebaseAuth.instance.currentUser!.uid)
      .collection('orders');

  final CollectionReference _allOrdersCollection = FirebaseFirestore.instance.collection('ِallOrders');

  Future<List<QueryDocumentSnapshot>> getOrdersFromFirestore() async {
    var _orders = await _ordersCollection.orderBy('date', descending: true).get();
    return _orders.docs;
  }

  Future<List<QueryDocumentSnapshot>> getAllOrdersFromFirestore() async {
    var _allOrders = await _allOrdersCollection.orderBy('date', descending: true).get();
    return _allOrders.docs;
  }



  addOrderToFirestore(CheckoutModel checkoutModel,List<CartProductModel> products) async {
    var documentRef = _ordersCollection.doc();
    await documentRef.set(checkoutModel.toJson());
    for (var product in products) {
      documentRef.collection('OrderDetails').doc().set({
        'name': product.name,
        'price': product.price,
        'id': product.id,
        'quantity': product.quantity,
        'image': product.image,
        'user_id':product.user_id
      });
    }
   // await _allOrdersCollection.doc().set(checkoutModel.toJson());

  }
  addAllOrderToFirestore(CheckoutModel checkoutModel,List<CartProductModel> products) async {
    var documentRef = _allOrdersCollection.doc();
    await documentRef.set(checkoutModel.toJson());
    for (var product in products) {
      documentRef.collection('OrderDetails').doc().set({
        'name': product.name,
        'price': product.price,
        'id': product.id,
        'quantity': product.quantity,
        'image': product.image,
        'user_id':product.user_id
      });
    }
    // await _allOrdersCollection.doc().set(checkoutModel.toJson());

  }
/*
  storeOrders(List<CartProductModel> products) async {
    var documentRef = _ordersCollection.doc();
    for (var product in products) {
      documentRef.collection('OrderDetails').doc().set({
        'name': product.name,
        'price': product.price,
        'id': product.id,
        'quantity': product.quantity,
        'image': product.image,
        'user_id':product.user_id
      });
    }
  }

 */

  Stream<QuerySnapshot> loadAllOrders() {
    return _firestore.collection('ِallOrders').snapshots();
  }

  Stream<QuerySnapshot> loadOrderDetails(documentId) {
    return _firestore
        .collection('ِallOrders')
        .doc(documentId)
        .collection('OrderDetails')
        .snapshots();
  }

}