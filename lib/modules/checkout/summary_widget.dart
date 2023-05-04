import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/core/viewModel/checkout_view_model.dart';
import '../../core/viewModel/cart_view_model.dart';
import '../../shared/components/custom_text.dart';
import '../../shared/styles/color.dart';


class CheckOutSummary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GetBuilder<CartViewModel>(
        init: CartViewModel(),
        builder: (controller)=>SingleChildScrollView(
          child: Column(
            children:[
              SizedBox(
                height: 20.0,
              ),
              Container(
                height: 350,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context,index)=>Container(
                      child: Container(
                        width: 150,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 150,
                              height: 180,
                              child: Image.network('${controller.cartProductModel[index].image}',
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                            CustomText(text:'${controller.cartProductModel[index].name}',maxLine:2),
                            SizedBox(height: 10.0,),
                            CustomText(text:'\$${controller.cartProductModel[index].price.toString()}',maxLine:2,color:defualtColor,
                              alignment: Alignment.bottomLeft,
                            ),


                          ],
                        ),
                      ),

                    ),
                    itemCount: controller.cartProductModel.length,
                    separatorBuilder:(context,index){
                      return SizedBox(width: 15.0,);
                    },
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomText(
                  text: 'Shipping Address',
                  fontSize: 24, maxLine: 2,
                ),
              ),
              GetBuilder<CheckOutViewModel>(
                init: Get.put(CheckOutViewModel()),
                builder:(controller)=>Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomText(maxLine: 2,
                  fontSize: 24,
                  color: Colors.grey,
                  text:'${controller.street1}${', '} ${controller.street2} ${', '}${controller.state}${', '}${controller.city}${', '}${controller.country}' ,
                ),
              ), ),

            ],
          ),
        ),
      ),
    );
  }
}
