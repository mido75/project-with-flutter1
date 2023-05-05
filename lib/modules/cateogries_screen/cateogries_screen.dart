import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/core/viewModel/cart_view_model.dart';
import 'package:untitled/core/viewModel/fav_view_model.dart';
import 'package:untitled/core/viewModel/home_view_model.dart';
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

  final String categoryName;
  final List<ProductModel> products;
  CateogriesScreen({required this.categoryName, required this.products});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                  CustomText(
                    text: categoryName,
                    fontSize: 20,
                    alignment: Alignment.bottomCenter,
                  ),
                  Container(
                    width: 24,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: 16, left: 16, bottom: 24),
              child: GridView.builder(
                padding: const EdgeInsets.all(0),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 15,
                  mainAxisExtent: 320,
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Get.to(
                        ProductScreen(model : products[index]),
                      );
                    },
                    child: Container(
                      width: 164,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: Colors.white,
                            ),
                            height: 240,
                            width: 164,
                            child: Image.network(
                              '${products[index].image}',
                              fit: BoxFit.cover,
                            ),
                          ),
                          CustomText(
                            text: '${products[index].name}',
                            fontSize: 16,
                          ),
                          CustomText(
                            text: '${products[index].description}',
                            fontSize: 12,
                            color: Colors.grey,
                            maxLine: 1,
                          ),
                          Row(
                            children: [
                              CustomText(
                                text: '\$${products[index].price}',
                                fontSize: 16,
                                color: defualtColor,
                              ),
                              Spacer(),
                              GetBuilder<FavViewModel>(
                                init: FavViewModel(),
                                builder: (controller) => IconButton(
                                  onPressed: () {
                                    print(products[index].id);
                                    print('ffffffffffffffff');
                                    controller.addFavProduct(
                                      FavProductModel(
                                        name: products[index].name,
                                        image: products[index].image,
                                        price: products[index].price,
                                        description: products[index].description,
                                        id: products[index].id,
                                      ),
                                    );
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
                                builder: (controller) => IconButton(
                                  onPressed: () {
                                    controller.addProduct(
                                      CartProductModel(
                                        name: products[index].name,
                                        image: products[index].image,
                                        price: products[index].price,
                                        quantity: 1,
                                        id: products[index].id,
                                      ),
                                    );
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
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

