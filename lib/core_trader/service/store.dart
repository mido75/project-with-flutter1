
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:untitled/models/product_model.dart';

class Store {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  addProduct(ProductModel product) {
    _firestore.collection('products').add({
      'name': product.name,
      'description': product.description,
      'sized': product.sized,
      'image': product.image,
      'category': product.category,
      'price': product.price,
      'id': ''
    });
    _firestore.collection('my_products').add({
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
    return _firestore.collection('my_products').snapshots();
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
/*
  storeOrders(data, List<Product> products) {
    var documentRef = _firestore.collection(kOrders).document();
    documentRef.setData(data);
    for (var product in products) {
      documentRef.collection(kOrderDetails).document().setData({
        kProductName: product.pName,
        kProductPrice: product.pPrice,
        kProductQuantity: product.pQuantity,
        kProductLocation: product.pLocation,
        kProductCategory: product.pCategory
      });
    }
  }

 */
}