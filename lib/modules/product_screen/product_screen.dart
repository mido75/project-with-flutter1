import 'package:flutter/material.dart';
import 'package:untitled/shared/styles/color.dart';

import '../../models/product_model.dart';

class ProductScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Text('Product detalies'),

        ),
      ),
      // body: Container(
      //   child: Column(
      //     children: [
      //       Container(
      //         width: MediaQuery.of(context).size.width,
      //         height: 270,
      //         child: Image.network(
      //           model.image,
      //           fit: BoxFit.fill,
      //         ),
      //       ),
      //       SizedBox(
      //         height: 15,
      //       ),
      //       Expanded(
      //         child: SingleChildScrollView(
      //           child: Container(
      //             padding: EdgeInsets.all(18),
      //             child: Column(
      //               children: [
      //                 Text(model.name,
      //                   style: TextStyle(fontSize: 26,
      //                   ),
      //                 ),
      //                 SizedBox(
      //                   height: 15,
      //                 ),
      //                 Row(
      //                   mainAxisAlignment: MainAxisAlignment.spaceAround,
      //                   children: [
      //                     Container(
      //                       padding: EdgeInsets.all(16),
      //                       width: MediaQuery.of(context).size.width * .4,
      //                       decoration: BoxDecoration(
      //                           borderRadius: BorderRadius.circular(20),
      //                           border: Border.all(
      //                             color: Colors.grey,
      //                           )),
      //                       child: Row(
      //                         mainAxisAlignment: MainAxisAlignment.spaceAround,
      //                         children: [
      //                           Text('Size',
      //                           ),
      //                           Text(model.sized,
      //                           ),
      //                         ],
      //                       ),
      //                     ),
      //                     Container(
      //                       padding: EdgeInsets.all(16),
      //                       width: MediaQuery.of(context).size.width * .44,
      //                       decoration: BoxDecoration(
      //                           borderRadius: BorderRadius.circular(20),
      //                           border: Border.all(
      //                             color: Colors.grey,
      //                           )),
      //                       child: Row(
      //                         mainAxisAlignment: MainAxisAlignment.spaceAround,
      //                         children: [
      //                           Text('Color',
      //                           ),
      //                           Container(
      //                             width: 30,
      //                             height: 20,
      //                             padding: EdgeInsets.all(12),
      //                             decoration: BoxDecoration(
      //                               border: Border.all(color: Colors.grey),
      //                               borderRadius: BorderRadius.circular(20),
      //                               color: model.color,
      //                             ),
      //                           )
      //                         ],
      //                       ),
      //                     ),
      //                   ],
      //                 ),
      //                 SizedBox(
      //                   height: 15,
      //                 ),
      //                 Text('Details',
      //                  style: TextStyle( fontSize: 18,),
      //                 ),
      //                 SizedBox(
      //                   height: 20,
      //                 ),
      //                 Text(model.description,
      //                  style: TextStyle( fontSize: 18,
      //                    height: 2.5,),
      //                 )
      //               ],
      //             ),
      //           ),
      //         ),
      //       ),
      //       Padding(
      //         padding: const EdgeInsets.all(30),
      //         child: Row(
      //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //           children: [
      //             Column(
      //               children: [
      //                 Text("PRICE ",
      //                   style: TextStyle(fontSize: 22,
      //                     color: Colors.grey,),
      //                 ),
      //                 Text(' \$' + model.price,
      //                   style: TextStyle(color: defualtColor,
      //                       fontSize: 18,),
      //                 )
      //               ],
      //             ),
      //             Container(
      //               padding: EdgeInsets.all(20),
      //               width: 180,
      //               height: 100,
      //               child:MaterialButton(
      //                 onPressed: () {},
      //                 child: Text('Add'),
      //               ),
      //             ),
      //           ],
      //         ),
      //       )
      //     ],
      //   ),
      // ),
      // );
      //})
    );
  }

}