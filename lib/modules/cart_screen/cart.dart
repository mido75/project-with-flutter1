import 'dart:core';

import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
List<String> names = <String>[
  "Name",
  "Name",
  "Name",
  "Name",
  "Name",
  ];
List<String> string = <String>[
  "Quantity : ",
  "Quantity : ",
  "Quantity : ",
  "Quantity : ",
  "Quantity : ",

];
List<String> images = <String>[
  'imagies/Ellipse5.png',
  'imagies/Ellipse5.png',
  'imagies/Ellipse5.png',
  'imagies/Ellipse5.png',
  'imagies/Ellipse5.png',
];
List<int> prices =<int> [
  100,200,300,400,500
];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Column(
       children: [
         Padding(
           padding: const EdgeInsets.only(top: 30,),
           child: Text("My Shopping Cart", style: TextStyle(fontSize: 25,fontWeight: FontWeight.w600, color: Color(0xff0CC095),),),
         ),
       Expanded(
         child: Container(
           child: ListView.separated(itemBuilder: (context,index){
             return Container(
               height: 140,
               child:  Row(
                 children: [
                   Container(
                     width: 140 ,
                     child: Image.asset(images[index],
                       fit: BoxFit.fill,
                     ),
                   ),
                   Padding(
                     padding: EdgeInsets.only(left: 30.0,),
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Row(
                           children: [
                             Text(names[index],
                               style: TextStyle(fontSize: 20,),
                             ),
                             SizedBox(width: 100.0,),
                             Icon(Icons.delete,color: Colors.red,)
                           ],
                         ),
                         SizedBox(height: 20.0,),

                         Text(string[index],
                           style: TextStyle(color: Colors.grey,),
                         ),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children:  [
                             Icon(Icons.add,color: Color(0xff0CC095),),
                             SizedBox(width: 10.0,),
                             Text('1',
                               style: TextStyle(
                                 fontSize: 20,
                                 color: Color(0xff0CC095),
                               ),
                             ),
                             SizedBox(width: 10.0,),
                             Padding(
                               padding: EdgeInsets.only(bottom: 20),
                               child: Icon(Icons.minimize,color: Color(0xff0CC095),),
                             ),
                             SizedBox(width: 60.0,),
                             Text('\$ ${prices[index].toString()}',
                               style: TextStyle(color: Colors.black,
                                 fontWeight: FontWeight.bold,

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
           },itemCount: names.length,
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
           padding:  EdgeInsets.only(top: 30,),
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
                   child: MaterialButton(onPressed: (){},
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
                   Text('\$ 2000',style: TextStyle(color: Color(0xff0CC095), fontSize: 18,),)
                 ],
               ),
             ],
           ),
         ),

    ],
     ),
    );
  }
}
