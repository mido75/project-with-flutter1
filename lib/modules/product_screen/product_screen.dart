import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:untitled/core/viewModel/cart_view_model.dart';
import 'package:untitled/models/cart_product_model.dart';
import 'package:untitled/shared/styles/color.dart';

import '../../models/product_model.dart';

class ProductScreen extends StatelessWidget {

  ProductModel model;
  ProductScreen({required this.model});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0).w,
          child: Container(
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 270,
                  child: Image.network(
                    '${model.image}',
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.all(18).w,
                      child: Column(
                        children: [
                          Text(
                            '${model.name}',
                            style: TextStyle(
                              fontSize: 26.sp,
                            ),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                padding: EdgeInsets.all(16).w,
                                width: MediaQuery.of(context).size.width * .4,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20).w,
                                    border: Border.all(
                                      color: Colors.grey,
                                    )),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      'Size',
                                    ),
                                    Text(
                                      '${model.sized}',
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(16).w,
                                width: MediaQuery.of(context).size.width * .44,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20).w,
                                    border: Border.all(
                                      color: Colors.grey,
                                    )),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      'Color',
                                    ),
                                    Container(
                                      width: 30,
                                      height: 20,
                                      padding: EdgeInsets.all(12).w,
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey),
                                        borderRadius: BorderRadius.circular(20).w,
                                        //color: model.color,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Text(
                            'Details',
                            style: TextStyle(
                              fontSize: 18.sp,
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Text(
                            '${model.description}',
                            style: TextStyle(
                              fontSize: 18.sp,
                              height: 2.5.h,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, bottom: 15, top: 0).r,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            "PRICE ",
                            style: TextStyle(
                              fontSize: 15.sp,
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            '${model.price}\$',
                            style: TextStyle(
                              color: defualtColor,
                              fontSize: 18.sp,
                            ),
                          ),
                        ],
                      ),
                      GetBuilder<CartViewModel>(
                        init: CartViewModel(),
                        builder: (controller) => Container(
                          padding: EdgeInsets.all(20).w,
                          width: 180.w,
                          height: 80.h,
                          child: MaterialButton(
                            onPressed: (){
                              controller.addProduct(CartProductModel(
                                user_id: model.user_id,
                                name: model.name,
                                image: model.image,
                                price: model.price,
                                quantity: 1,
                                id: model.id,
                              ),);
                            },
                            color: defualtColor,
                            child: Text('Add',style: TextStyle(color: Colors.white),),
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

