import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/core_trader/viewModel_trader/control_view_model_t.dart';
import 'package:untitled/modules_trader/setting_screen_t/setting_screen_t.dart';

import '../../shared/styles/color.dart';

class MyProductsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: IconButton(onPressed: (){
          Get.to(ControlViewModel_T());
        },icon:Icon(Icons.arrow_back_ios,color: Colors.black,),),
        elevation: 0.0,
        title: Padding(
          padding: const EdgeInsets.only(left: 60),
          child: Text('Products',style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            color: Colors.grey[300],
            child: GridView.count(
              physics:BouncingScrollPhysics(),
              shrinkWrap: true,
              crossAxisCount: 2,
              mainAxisSpacing: 1.0,
              crossAxisSpacing: 1.0,
              childAspectRatio: 1 / 1.50,
              children: List.generate(
                12,
                    (index) => GestureDetector(
                    onTap: () {
                     // Get.to(ProductScreen(model: controller.productModel![index]));
                    },
                    child: GridProduct(context, index)),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget GridProduct(context, index) => Container(
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
                  image: NetworkImage('https://images.ctfassets.net/yp0eyja3qz0n/5Glj5hh4bSagent6cTC2An/0f319099844178119b7038313744d9ae/4084500311015_Luminous-Serum_0308.jpg?fm=png'),
                  width: double.infinity,
                  height: 150.0,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 5.0,
              left: 10.0,
              right: 5.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'name',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    height: 1.1,
                  ),
                ),
                SizedBox(
                  height: 3.0,
                ),
                Text(
                  'description',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    height: 1.1,
                  ),
                ),
                SizedBox(
                  height: 3.0,
                ),
                Row(
                  children: [
                    Text(
                      'price',
                      style: TextStyle(
                        fontSize: 12.0,
                        color: defualtColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
  );

}
