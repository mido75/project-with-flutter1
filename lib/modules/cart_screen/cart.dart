import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/parser.dart';
import 'package:get/get.dart';
import 'package:untitled/core/viewModel/cart_view_model.dart';
import 'package:untitled/models/cart_product_model.dart';

class CartScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartViewModel>(
      init: CartViewModel(),
      builder:(controller) =>controller.cartProductModel.length == 0 
          ? Center(
            child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset('imagies/undraw_empty_cart_co35.svg',width: 150,height: 150,),
                SizedBox(height: 20,),
                Text(
                  'Cart Empty',
                  style: TextStyle(fontSize: 32,),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          )
          : Scaffold(
       body: Padding(
         padding: const EdgeInsets.only(top: 30.0),
         child: Column(
           children: [
           Expanded(
             child: Container(
               child: ListView.separated(
                 itemBuilder: (context,index){
                 return Padding(
                   padding: const EdgeInsets.all(10.0),
                   child: Container(
                     height: 140,
                     child:  Row(
                       children: [
                         Container(
                           width: 140 ,
                           child: Image.network('${controller.cartProductModel[index].image}',
                             fit: BoxFit.fill,
                           ),
                         ),
                         Flexible(
                           child: Padding(
                             padding: EdgeInsets.only(left: 30.0,),
                             child: Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 Row(
                                   children: [
                                     Text('${controller.cartProductModel[index].name}',
                                       style: TextStyle(fontSize: 20,),
                                     ),
                                     Spacer(),
                                     GestureDetector(
                                         child: Icon(Icons.delete,color: Colors.red,),
                                       onTap: (){
                                           controller.deleteCartProduct(index);
                                       },
                                     ),
                                   ],
                                 ),
                                 SizedBox(height: 20.0,),
                                 Text('quantity :',
                                   style: TextStyle(color: Colors.grey,),
                                 ),
                                 SizedBox(height: 10,),
                                 Row(
                                   mainAxisAlignment: MainAxisAlignment.center,
                                   children:  [
                                     GestureDetector(
                                         child: Icon(Icons.add,color: Color(0xff0CC095),),
                                       onTap: (){
                                            controller.increaseQuantity(index);
                                       },
                                     ),
                                     SizedBox(width: 10.0,),
                                     Text('${controller.cartProductModel[index].quantity.toString()}',
                                       style: TextStyle(
                                         fontSize: 20,
                                         color: Color(0xff0CC095),
                                       ),
                                     ),
                                     SizedBox(width: 10.0,),
                                     Padding(
                                       padding: EdgeInsets.only(bottom: 20),
                                       child: GestureDetector(
                                           child: Icon(Icons.minimize,color: Color(0xff0CC095),),
                                         onTap: (){
                                             controller.decreaseQuantity(index);
                                         },
                                       ),
                                     ),
                                     Spacer(),
                                     Text('${controller.cartProductModel[index].price}\$',
                                       style: TextStyle(color: Colors.black,
                                         fontWeight: FontWeight.bold,

                                       ),
                                     ),

                                   ],
                                 ),
                               ],
                             ),
                           ),
                         ),
                       ],

                     ),
                   ),
                 );
               },itemCount: controller.cartProductModel.length,
                 separatorBuilder:(BuildContext context,int index){
                   return Column(
                     children: [
                       Padding(
                         padding:  EdgeInsets.all(10.0),
                         child: Container(
                           height: 1.0,
                           color: Colors.grey.shade300,
                         ),
                       ),

                     ],
                   );

                 },
               ),
             ),
           ),

             Padding(
               padding:  EdgeInsets.only(top: 15,),
               child: Row(
                 children: [
                   Padding(
                       padding: const EdgeInsets.all(15.0),
                       child: Container(
                         width: 200.0,
                         decoration: BoxDecoration(color: Color(0xff0CC095),
                           borderRadius: BorderRadius.circular(10.0)
                         )
                         ,
                         child: MaterialButton(
                           onPressed: (){},
                           height: 40.0,
                           child: Text("Check Out",style: TextStyle(color: Colors.white),)
                           ,),
                       ),
                     ),
                   SizedBox(width: 30.0,),
                   Column(
                     children: [
                       Text("TOTAL",style: TextStyle(fontSize: 15,color: Colors.grey),),
                       SizedBox(height: 5.0,),
                       Text('${controller.totalPrice}\$',style: TextStyle(color: Color(0xff0CC095), fontSize: 18,),),
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
}
