import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreSearch
{
  searchProdect(text){
    return FirebaseFirestore.instance.collection('products').where('name',isLessThanOrEqualTo: text).get();
  }
}