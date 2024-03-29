
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:untitled/models/product_model.dart';

class Store {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final CollectionReference _myProductCollection = FirebaseFirestore.instance
      .collection('Users')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection('my_products');

  addProduct(ProductModel product) {
    _firestore.collection('products').add({
      'user_id': product.user_id,
      'name': product.name,
      'description': product.description,
      'sized': product.sized,
      'image': product.image,
      'category': product.category,
      'price': product.price,
      'id': ''
    });

    _myProductCollection.add({
      'user_id': product.user_id,
      'name': product.name,
      'description': product.description,
      'sized': product.sized,
      'image': product.image,
      'category': product.category,
      'price': product.price,
      'id':''
    });
  }

  Stream<QuerySnapshot> loadProducts() {
    return _myProductCollection.snapshots();
  }

  Stream<QuerySnapshot> loadHomeProducts() {
    return _firestore.collection('products').snapshots();
  }

  /*
  Stream<QuerySnapshot> loadOrders() {
    return _firestore.collection(kOrders).snapshots();
  }

   */
/*
  Stream<QuerySnapshot> loadOrderDetails(documentId) {
    return _firestore
        .collection(kOrders)
        .document(documentId)
        .collection(kOrderDetails)
        .snapshots();
  }
*/

  deleteProduct(documentId) {
    _firestore.collection('my_products').doc(documentId).delete();
    _firestore.collection('products').doc(documentId).delete();

  }

  editProduct(data, documentId) {
    _firestore
        .collection('my_products')
        .doc(documentId)
        .update(data);

    _firestore
        .collection('products')
        .doc(documentId)
        .update(data);
  }


}