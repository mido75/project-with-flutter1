import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

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
                  CustomTextFormField(
                    onSave:(value){
                      controller.street1 = value;
                    } ,
                    validator: (String value){
                      if(value.isEmpty){
                        return 'you must write your street';
                      }
                    },
                    text: 'Street 1',
                    hint: '21, Alex Davidson Avenue',
                  ),

                  SizedBox(height: 10,),

                  CustomTextFormField(
                    onSave: (value){
                      controller.street2 = value;
                    },
                    validator: (String value){
                      if(value.isEmpty){
                        return 'you must write your street 2';
                      }
                    },
                    text: 'Street 2',
                    hint: 'Opposite Omegatron , Vicent Quarters',
                  ),

                  SizedBox(height: 10,),

                  CustomTextFormField(
                    onSave: (value){
                      controller.city = value;
                    },
                    validator: (String value){
                      if(value.isEmpty){
                        return 'you must write your city';
                      }
                    },
                    text: 'City',
                    hint: 'Victoria Island',
                  ),

                  SizedBox(height: 10,),

                  Container(
                    width: Get.width,
                    child: Row(
                      children: [
                        Expanded(child: Padding(
                          padding:EdgeInsets.only(right: 20,),
                          child: CustomTextFormField(text: 'State', hint: 'Logos State',
                            onSave: (value){
                              controller.state = value;
                            },
                            validator: (String value){
                              if(value.isEmpty){
                                return 'you must write your state';
                              }
                            },
                          ),
                        )),
                        Expanded(child: Padding(
                          padding:  EdgeInsets.only(left: 20,),
                          child: CustomTextFormField(text: 'Country', hint: 'Nigeria',
                            onSave: (value){
                              controller.country = value;
                            },
                            validator: (String value){
                              if(value.isEmpty){
                                return 'you must write your country';
                              }
                            },
                          ),
                        )),

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
