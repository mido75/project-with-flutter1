import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:untitled/core/viewModel/cart_view_model.dart';
import 'package:untitled/core/viewModel/fav_view_model.dart';
import 'package:untitled/core/viewModel/home_view_model.dart';
import 'package:untitled/core_trader/service/store.dart';
import 'package:untitled/models/cart_product_model.dart';
import 'package:untitled/models/categories_model.dart';
import 'package:untitled/models/fav_product_model.dart';
import 'package:untitled/models/product_model.dart';
import 'package:untitled/modules/product_screen/product_screen.dart';
import 'package:untitled/shared/components/custom_text.dart';
import 'package:untitled/shared/styles/color.dart';
/*
class CateogriesScreen extends StatelessWidget {

  //CategoryModel model;
//  CateogriesScreen({required this.model});

  final String categoryName;
  final List<ProductModel> products;

  CateogriesScreen({required this.categoryName, required this.products});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      init: HomeViewModel(),
      builder:(controller) => Scaffold(
        appBar: AppBar(
          backgroundColor: defualtColor,
          title: Text('${categoryName}'),
        ),
        body: Container(
          color: Colors.grey[300],
          child: GridView.count(
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            crossAxisCount: 2,
            mainAxisSpacing: 1.0,
            crossAxisSpacing: 1.0,
            childAspectRatio: 1 / 1.50,
            children: List.generate(
              products.length,
                  (index) => GestureDetector(
                  onTap: () {
                    Get.to(ProductScreen(model: products[index]));
                  },
                  child: GridProduct(context, index)),
            ),
          ),
        ),
      ),
    );
  }

  Widget GridProduct(context, index) => GetBuilder<HomeViewModel>(
    //init: HomeViewModel(),
    builder: (controller) => Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                Image(
                  image: NetworkImage(
                      '${products[index].image}'),
                  width: double.infinity,
                  height: 150.0,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 5.0,
              left: 5.0,
              right: 5.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${products[index].name}',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    height: 1.1,
                  ),
                ),
                SizedBox(
                  height: 1.0,
                ),
                Text(
                  '${products[index].description}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    height: 1.1,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      '${products[index].price}',
                      style: TextStyle(
                        fontSize: 12.0,
                        color: defualtColor,
                      ),
                    ),
                    SizedBox(
                      width: 0.5,
                    ),
                    Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: CircleAvatar(
                        radius: 15.0,
                        backgroundColor: defualtColor,
                        child: Icon(
                          Icons.favorite_border,
                          size: 20.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

 */

class CateogriesScreen extends StatelessWidget {
  final _store = Store();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  var Pid;
  final String categoryName;
  CateogriesScreen({required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: _store.loadHomeProducts(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<ProductModel> products = [];
            List<ProductModel> products2 = [];
            var i=0;
            for (var doc in snapshot.data!.docs) {
              var data = doc.data;
              Pid = doc.id;
              //print('ssssssssssssssssssddddddddddddddd');
              products2.add(ProductModel(
                  id: doc.id,
                  price: doc.data().toString().contains('price')
                      ? doc.get('price')
                      : '',
                  name: doc.data().toString().contains('name')
                      ? doc.get('name')
                      : '',
                  description: doc.data().toString().contains('description')
                      ? doc.get('description')
                      : '',
                  image: doc.data().toString().contains('image')
                      ? doc.get('image')
                      : '',
                  category: doc.data().toString().contains('category')
                      ? doc.get('category')
                      : '',
                  user_id: doc.data().toString().contains('user_id')
                      ? doc.get('user_id')
                      : '',
                ));
              if(categoryName == products2[i].category){
                products.add(products2[i]);
              }
              _firestore.collection('products').doc(Pid).update({'id': Pid});
              i++;
            }
            return GetBuilder<HomeViewModel>(
              init: Get.find<HomeViewModel>(),
              builder: (controller) => controller.loading.value
                  ? Center(child: CircularProgressIndicator())
                  : Scaffold(
                      body: Column(
                        children: [
                          Container(
                            height: 130,
                            child: Padding(
                              padding: EdgeInsets.only(
                                      bottom: 24, left: 16, right: 16)
                                  .r,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                  CustomText(
                                    text: categoryName,
                                    fontSize: 20.sp,
                                    alignment: Alignment.bottomCenter,
                                  ),
                                  Container(
                                    width: 24.w,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(
                                      right: 16, left: 16, bottom: 24).r,
                              child: GridView.builder(
                                padding: const EdgeInsets.all(0).w,
                                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 16,
                                  crossAxisSpacing: 15,
                                  mainAxisExtent: 350,
                                ),
                                itemCount: products.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      Get.to(
                                        ProductScreen(model: products[index]),
                                      );
                                    },
                                    child: Container(
                                      width: 164.w,
                                      child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(4).w,
                                              color: Colors.white,
                                            ),
                                            height: 240.h,
                                            width: 164.w,
                                            child: Image.network(
                                              '${products[index].image}',
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          CustomText(
                                            text: '${products[index].name}',
                                            fontSize: 16.sp,
                                          ),
                                          CustomText(
                                            text:
                                            '${products[index].description}',
                                            fontSize: 12.sp,
                                            color: Colors.grey,
                                            maxLine: 1,
                                          ),
                                          Row(
                                            children: [
                                              CustomText(
                                                text:
                                                '\$${products[index].price}',
                                                fontSize: 16.sp,
                                                color: defualtColor,
                                              ),
                                              Spacer(),
                                              GetBuilder<FavViewModel>(
                                                init: FavViewModel(),
                                                builder: (controller) =>
                                                    IconButton(
                                                      onPressed: () {
                                                        print(products[index].id);
                                                        print('ffffffffffffffff');
                                                        controller.addFavProduct(
                                                          FavProductModel(
                                                            name: products[index]
                                                                .name,
                                                            image: products[index]
                                                                .image,
                                                            price: products[index]
                                                                .price,
                                                            description:
                                                            products[index]
                                                                .description,
                                                            id: products[index].id,
                                                          ),
                                                        );
                                                      },
                                                      icon: CircleAvatar(
                                                        radius: 15.0.r,
                                                        backgroundColor:
                                                        defualtColor,
                                                        child: Icon(
                                                          Icons.favorite_border,
                                                          size: 20.0,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                              ),
                                              GetBuilder<CartViewModel>(
                                                init: CartViewModel(),
                                                builder: (controller) =>
                                                    IconButton(
                                                      onPressed: () {
                                                        controller.addProduct(
                                                          CartProductModel(
                                                            name: products[index]
                                                                .name,
                                                            image: products[index]
                                                                .image,
                                                            price: products[index]
                                                                .price,
                                                            quantity: 1,
                                                            id: products[index].id,
                                                            user_id: products[index]
                                                                .user_id,
                                                          ),
                                                        );
                                                      },
                                                      icon: CircleAvatar(
                                                        radius: 15.0.r,
                                                        backgroundColor:
                                                        defualtColor,
                                                        child: Icon(
                                                          Icons.shopping_cart,
                                                          size: 20.0,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}
