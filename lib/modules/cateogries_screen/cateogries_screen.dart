import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/core/viewModel/home_view_model.dart';
import 'package:untitled/models/categories_model.dart';
import 'package:untitled/modules/product_screen/product_screen.dart';
import 'package:untitled/shared/styles/color.dart';

class CateogriesScreen extends StatelessWidget {

  CategoryModel model;
  CateogriesScreen({required this.model});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      init: HomeViewModel(),
      builder:(controller) => Scaffold(
        appBar: AppBar(
          backgroundColor: defualtColor,
          title: Text('${model.name}'),
        ),
        body: Container(
          color: Colors.grey[300],
          child: GridView.count(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            crossAxisCount: 2,
            mainAxisSpacing: 1.0,
            crossAxisSpacing: 1.0,
            childAspectRatio: 1 / 1.50,
            children: List.generate(
              2,
                  (index) => GestureDetector(
                  onTap: () {
                    Get.to(ProductScreen(
                      model: controller.productModel![index],
                    ));
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
                      '${controller.productModel![index].price}',
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
