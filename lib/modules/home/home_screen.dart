import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:untitled/core/viewModel/cart_view_model.dart';
import 'package:untitled/core/viewModel/fav_view_model.dart';
import 'package:untitled/core_trader/service/store.dart';
import 'package:untitled/models/cart_product_model.dart';
import 'package:untitled/models/fav_product_model.dart';
import 'package:untitled/models/product_model.dart';
import 'package:untitled/modules/notifications_screen/notifications_screen.dart';
import 'package:untitled/modules/search_screen/search_screen.dart';
import 'package:untitled/shared/styles/color.dart';
import '../../core/viewModel/home_view_model.dart';
import '../cateogries_screen/cateogries_screen.dart';
import '../notifications_screen/notificationList.dart';
import '../product_screen/product_screen.dart';
import 'package:untitled/helper/building.dart';

class HomeScreen extends StatelessWidget {
  var searchController = TextEditingController();

  final _store = Store();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  var Pid;

  // FirebaseAuth _auth = FirebaseAuth.instance;
//Get.find<HomeViewModel>()
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: _store.loadHomeProducts(),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            List<ProductModel> products = [];
            for (var doc in snapshot.data!.docs) {
              var data = doc.data;
              Pid = doc.id;
              print(doc.id);
              products.add(ProductModel(
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
                    ? doc.get('user_id') : '',
              ));

              _firestore.collection('products').doc(Pid).update({'id': Pid});
            }
            return GetBuilder<HomeViewModel>(
              init: Get.find<HomeViewModel>(),
              builder: (controller) => controller.loading.value
                  ? Center(child: CircularProgressIndicator())
                  : Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.white10,
                  elevation: 0.0,
                  leading: Padding(
                    padding: const EdgeInsets.all(8.0).w,
                    child: Container(
                      height: 80.h,
                      width: 80.w,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                "imagies/269969424_655870578924985_1432197706298581466_nn.png"),
                            fit: BoxFit.fill),
                      ),
                    ),
                  ),
                  actions: [
                    IconButton(
                        onPressed: () {
                          Get.to(NotificationList());
                        },
                        icon: Icon(
                          Icons.notifications,
                          color: defualtColor,
                        )),
                  ],
                ),
                body: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0).w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          controller: searchController,
                          keyboardType: TextInputType.text,
                          style: TextStyle(
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20).w,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: defualtColor, width: 2.0.w),
                            ),
                            labelText: 'Search',
                            /*
                          prefixIcon: IconButton(
                            onPressed: (){

                            },
                            icon: Icon(Icons.search,),
                          ),
                           */
                            prefixIcon: Icon(
                              Icons.search,
                            ),
                          ),
                          onFieldSubmitted: (value) {
                            Get.to(SearchScreen(value));
                          },
                        ),
                        SizedBox(
                          height: 20.0.h,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10.0,
                          ).w,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Categories',
                                style: TextStyle(
                                  fontSize: 24.0.sp,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              SizedBox(
                                height: 10.0.h,
                              ),
                              Container(
                                height: 80.0.h,
                                width: double.infinity,
                                child: ListView.separated(
                                  physics: BouncingScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: () {
                                        CateogriesScreen(
                                          categoryName: 'load',
                                          products: controller.productModel!.toList(),
                                        );
                                        Get.to(CateogriesScreen(
                                          products: controller.productModel!.where((product) => product.category == controller.categoryModel![index].name!.toLowerCase()).toList(),
                                          categoryName: '${controller.categoryModel![index].name}',
                                        ));
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: defualtColor,
                                            width: 2.0.w,
                                            style: BorderStyle.solid,
                                          ),
                                        ),
                                        child: Padding(
                                          padding:
                                          const EdgeInsets.all(8.0).w,
                                          child: Row(
                                            children: [
                                              Text(
                                                  '${controller.categoryModel![index].name}'),
                                              SizedBox(
                                                width: 40.0.w,
                                              ),
                                              Image(
                                                image: NetworkImage(
                                                    '${controller.categoryModel![index].image}'),
                                              ),
                                              //  Image.network('${controller.categoryModel![index].image}'),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                  separatorBuilder: (context, index) =>
                                      SizedBox(
                                        width: 10.0.w,
                                      ),
                                  itemCount:
                                  controller.categoryModel!.length,
                                ),
                              ),
                              SizedBox(
                                height: 20.0.h,
                              ),
                              Text(
                                'New Products',
                                style: TextStyle(
                                  fontSize: 24.0.sp,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10.0.h,
                        ),
                        Container(
                          color: Colors.grey[300],
                          child: GridView.count(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            crossAxisCount: 2,
                            mainAxisSpacing: 1.0,
                            crossAxisSpacing: 1.0,
                            childAspectRatio: 1 / 1.50,
                            children: List.generate(
                              products.length,
                                  (index) => GestureDetector(
                                onTap: () {
                                  Get.to(ProductScreen(
                                    model: products[index],
                                  ));
                                },
                                child: GridProduct(context, index, products),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        });
  }

  Widget GridProduct(context, index, model) => GetBuilder<HomeViewModel>(
    //init: HomeViewModel(),
    builder: (controller) => Container(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0).w,
              child: Stack(
                alignment: AlignmentDirectional.bottomStart,
                children: [
                  Image(
                    image: NetworkImage(
                        '${model[index].image}'),
                    width: double.infinity,
                    height: 150.0.h,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 5.0,
                left: 5.0,
                right: 5.0,
              ).r,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${model[index].name}',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      height: 1.1.h,
                    ),
                  ),
                  SizedBox(
                    height: 1.0.h,
                  ),
                  Text(
                    '${model[index].description}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      height: 1.1.h,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        '${model[index].price}\$',
                        style: TextStyle(
                          fontSize: 12.0.sp,
                          color: defualtColor,
                        ),
                      ),
                      SizedBox(
                        width: 0.5.w,
                      ),
                      Spacer(),
                      GetBuilder<FavViewModel>(
                        init: FavViewModel(),
                        builder: (controller) => IconButton(
                          onPressed: () {
                            print(model[index].id);
                            print('ffffffffffffffff');
                            controller.addFavProduct(
                              FavProductModel(
                                name: model[index].name,
                                image: model[index].image,
                                price: model[index].price,
                                description: model[index].description,
                                id: model[index].id,
                              ),
                            );
                          },
                          icon: CircleAvatar(
                            radius: 15.0.r,
                            backgroundColor: defualtColor,
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
                        builder: (controller) => IconButton(
                          onPressed: () {
                            controller.addProduct(
                              CartProductModel(
                                name: model[index].name,
                                image: model[index].image,
                                price: model[index].price,
                                quantity: 1,
                                id: model[index].id,
                                user_id: model[index].user_id,
                              ),
                            );
                          },
                          icon: CircleAvatar(
                            radius: 15.0.r,
                            backgroundColor: defualtColor,
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
          ],
        ),
      ),
    ),
  );
}
