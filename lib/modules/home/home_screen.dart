import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/core/viewModel/cart_view_model.dart';
import 'package:untitled/core/viewModel/fav_view_model.dart';
import 'package:untitled/models/cart_product_model.dart';
import 'package:untitled/models/fav_product_model.dart';
import 'package:untitled/models/product_model.dart';
import 'package:untitled/modules/notifications_screen/notifications_screen.dart';
import 'package:untitled/modules/search_screen/search_screen.dart';
import 'package:untitled/shared/styles/color.dart';
import '../../core/viewModel/home_view_model.dart';
import '../cateogries_screen/cateogries_screen.dart';
import '../product_screen/product_screen.dart';
import 'package:untitled/helper/building.dart';

class HomeScreen extends StatelessWidget {
  var searchController = TextEditingController();

  // FirebaseAuth _auth = FirebaseAuth.instance;
//Get.find<HomeViewModel>()
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      init: Get.find<HomeViewModel>(),
      builder: (controller) => controller.loading.value
          ? Center(child: CircularProgressIndicator())
          : Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white10,
                elevation: 0.0,
                leading: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 80,
                    width: 80,
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
                        Get.to(NotificationsScreen());
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
                  padding: const EdgeInsets.all(8.0),
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
                            borderRadius: BorderRadius.circular(20),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: defualtColor, width: 2.0),
                          ),
                          labelText: 'Search',
                          /*
                          prefixIcon: IconButton(
                            onPressed: (){

                            },
                            icon: Icon(Icons.search,),
                          ),
                           */
                          prefixIcon: Icon(Icons.search,),
                        ),
                        onFieldSubmitted: (value){
                          Get.to(SearchScreen(value));
                        },
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10.0,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Categories',
                              style: TextStyle(
                                fontSize: 24.0,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Container(
                              height: 80.0,
                              width: double.infinity,
                              child: ListView.separated(
                                physics: BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      Get.to(CateogriesScreen(
                                        model: controller.categoryModel![index],
                                      ));
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: defualtColor,
                                          width: 2.0,
                                          style: BorderStyle.solid,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            Text(
                                                '${controller.categoryModel![index].name}'),
                                            SizedBox(
                                              width: 40.0,
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
                                separatorBuilder: (context, index) => SizedBox(
                                  width: 10.0,
                                ),
                                itemCount: controller.categoryModel!.length,
                              ),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Text(
                              'New Products',
                              style: TextStyle(
                                fontSize: 24.0,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
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
                            controller.productModel!.length,
                            (index) => GestureDetector(
                                onTap: () {
                                  Get.to(ProductScreen(
                                    model: controller.productModel![index],
                                  ));
                                },
                                child: GridProduct(context, index,controller.productModel )),
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

  Widget GridProduct(context, index , model) => GetBuilder<HomeViewModel>(
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
                          '${controller.productModel![index].image}'),
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
                      '${controller.productModel![index].name}',
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
                      '${controller.productModel![index].description}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        height: 1.1,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          '${controller.productModel![index].price}\$',
                          style: TextStyle(
                            fontSize: 12.0,
                            color: defualtColor,
                          ),
                        ),
                        SizedBox(
                          width: 0.5,
                        ),
                        Spacer(),
                        GetBuilder<FavViewModel>(
                          init: FavViewModel(),
                          builder:(controller) => IconButton(
                            onPressed: () {
                              controller.addFavProduct(FavProductModel(
                                name: model[index].name,
                                image: model[index].image,
                                price: model[index].price,
                                description: model[index].description,
                                id: model[index].id,
                              ),);
                            },
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
                        ),
                        GetBuilder<CartViewModel>(
                          init: CartViewModel(),
                          builder:(controller) => IconButton(
                            onPressed: () {
                              controller.addProduct(CartProductModel(
                                name: model[index].name,
                                image: model[index].image,
                                price: model[index].price,
                                quantity: 1,
                                id: model[index].id,
                              ),);
                            },
                            icon: CircleAvatar(
                              radius: 15.0,
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
      );
}

//                        backgroundColor:ShopCubit.get(context).favorites[model.id]? defualtColor : Colors.grey,