import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:untitled/shared/components/custom_text.dart';

import '../../core/viewModel/checkout_view_model.dart';
import '../../shared/components/custom_text_formfiled.dart';

class AddAddress extends StatelessWidget {
  const AddAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckOutViewModel>(
      init: Get.find(),
      builder:(controller)=>Expanded(
        child: SingleChildScrollView(
          child: Form(
            key: controller.formState,
            child: Padding(
              padding:  EdgeInsets.all(30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  Center(
                    child: Text('Billing Address Is Same As Delivery',
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    child: Column(
                      children: [
                        CustomText(
                          text: 'Street 1',
                          fontSize: 14,
                          color: Colors.grey.shade900, maxLine: 2,
                        ),
                        TextFormField(
                          validator: (value){
                            if(value!.isEmpty){
                              return 'you must write your street 1';
                            }
                          },
                          onSaved: (value){
                            controller.street1 = value;
                          },
                          decoration: InputDecoration(
                            hintText: '21, Alex Davidson Avenue',
                            hintStyle: TextStyle(
                              color: Colors.black,
                            ),
                            fillColor: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    child: Column(
                      children: [
                        CustomText(
                          text: 'Street 2',
                          fontSize: 14,
                          color: Colors.grey.shade900, maxLine: 2,
                        ),
                        TextFormField(
                          validator: (value){
                            if(value!.isEmpty){
                              return 'you must write your street 2';
                            }
                          },
                          onSaved: (value){
                            controller.street2 = value;
                          },
                          decoration: InputDecoration(
                            hintText: 'Opposite Omegatron , Vicent Quarters',
                            hintStyle: TextStyle(
                              color: Colors.black,
                            ),
                            fillColor: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    child: Column(
                      children: [
                        CustomText(
                          text: 'City',
                          fontSize: 14,
                          color: Colors.grey.shade900, maxLine: 2,
                        ),
                        TextFormField(
                          validator: (value){
                            if(value!.isEmpty){
                              return 'you must write your city';
                            }
                          },
                          onSaved: (value){
                            controller.city = value;
                          },
                          decoration: InputDecoration(
                            hintText: 'Victoria Island',
                            hintStyle: TextStyle(
                              color: Colors.black,
                            ),
                            fillColor: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    width: Get.width,
                    child: Row(
                      children: [
                        Expanded(child: Padding(
                          padding:EdgeInsets.only(right: 20,),
                          child: Container(
                            child: Column(
                              children: [
                                CustomText(
                                  text: 'State',
                                  fontSize: 14,
                                  color: Colors.grey.shade900, maxLine: 2,
                                ),
                                TextFormField(
                                  validator: (value){
                                    if(value!.isEmpty){
                                      return 'you must write your state';
                                    }
                                  },
                                  onSaved: (value){
                                    controller.state = value;
                                  },
                                  decoration: InputDecoration(
                                    hintText: 'Logos State',
                                    hintStyle: TextStyle(
                                      color: Colors.black,
                                    ),
                                    fillColor: Colors.white,
                                  ),
                                )
                              ],
                            ),
                          ),
                        )),
                        Expanded(child: Padding(
                          padding:  EdgeInsets.only(left: 20,),
                          child: Container(
                            child: Column(
                              children: [
                                CustomText(
                                  text: 'Country',
                                  fontSize: 14,
                                  color: Colors.grey.shade900, maxLine: 2,
                                ),
                                TextFormField(
                                  validator: (value){
                                    if(value!.isEmpty){
                                      return 'you must write your country';
                                    }
                                  },
                                  onSaved: (value){
                                    controller.country = value;
                                  },
                                  decoration: InputDecoration(
                                    hintText: 'Nigeria',
                                    hintStyle: TextStyle(
                                      color: Colors.black,
                                    ),
                                    fillColor: Colors.white,
                                  ),
                                )
                              ],
                            ),
                          ),

                        )),

                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    child: Column(
                      children: [
                        CustomText(
                          text: 'phone',
                          fontSize: 14,
                          color: Colors.grey.shade900, maxLine: 2,
                        ),
                        TextFormField(
                          validator: (value){
                            if(value!.isEmpty){
                              return 'you must write your phone';
                            }
                          },
                          onSaved: (value){
                            controller.phone = value;
                          },
                          decoration: InputDecoration(
                            hintText: '+20105146324',
                            hintStyle: TextStyle(
                              color: Colors.black,
                            ),
                            fillColor: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
