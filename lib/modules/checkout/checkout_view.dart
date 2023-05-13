import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/models/checkout_model.dart';
import 'package:untitled/modules/checkout/add_address_widget.dart';
import 'package:untitled/modules/checkout/summary_widget.dart';
import 'package:untitled/shared/components/custom_text.dart';
import '../../core/viewModel/checkout_view_model.dart';
import '../../shared/constants/constants.dart';
import 'delevery_time_widget.dart';
import '../../shared/styles/color.dart';

class CheckOutView extends StatelessWidget {
  final _processes = ['Delivery', 'Address', 'Summery'];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckOutViewModel>(
      init: Get.put(CheckOutViewModel()),
      builder: (controller) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          automaticallyImplyLeading: false,
          title: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Center(
                child: Text(
              'Check Out',
              style: TextStyle(
                fontSize: 30,
                color: defualtColor,
              ),
            )),
          ),
        ),
        body: Column(
          children: [
            // Expanded(
            //   child: StatusChange.tileBuilder(
            //     theme: StatusChangeThemeData(
            //       direction: Axis.horizontal,
            //       connectorTheme:
            //        ConnectorThemeData(space: 1.0, thickness: 1.0),
            //     ),
            //     builder: StatusChangeTileBuilder.connected(
            //       itemWidth: (_) =>
            //       MediaQuery.of(context).size.width / _processes.length,
            //       contentWidgetBuilder: (context, index) {
            //         return Padding(
            //           padding: const EdgeInsets.all(15.0),
            //           child: Text(
            //             _processes[index],
            //             style: const TextStyle(
            //               color: Colors.black, // change color with dynamic color --> can find it with example section
            //             ),
            //           ),
            //         );
            //       },
            //       nameWidgetBuilder: (context, index) {
            //         return Padding(
            //           padding: const EdgeInsets.all(0.0),
            //           // child: Text(_content[index],
            //           //   style: TextStyle(
            //           //     fontWeight: FontWeight.bold,
            //           //     color: controller.getColor(index),
            //           //   ),
            //           // ),
            //         );
            //       },
            //       indicatorWidgetBuilder: (_, index) {
            //         if (index <= controller.index) {
            //           return DotIndicator(
            //             size: 35.0,
            //             border: Border.all(color: Colors.teal, width: 1),
            //             child: Padding(
            //               padding: EdgeInsets.all(6.0),
            //               child: Container(
            //                 decoration:  BoxDecoration(
            //                   shape: BoxShape.circle,
            //                   color: defualtColor,
            //                 ),
            //               ),
            //             ),
            //           );
            //         } else {
            //           return  OutlinedDotIndicator(
            //             size: 30,
            //             borderWidth: 1.0,
            //             color: defualtColor,
            //           );
            //         }
            //       },
            //       lineWidgetBuilder: (index) {
            //         if (index > 0) {
            //           if (index == controller.index) {
            //             final prevColor = controller.getColor(index - 1);
            //             return DecoratedLineConnector(
            //               decoration: BoxDecoration(
            //                 gradient: LinearGradient(
            //                   colors: [
            //                     prevColor,
            //                     controller.getColor(index + 1)
            //                   ],
            //                 ),
            //               ),
            //             );
            //           } else {
            //             return SolidLineConnector(
            //               color: controller.getColor(index),
            //             );
            //           }
            //         } else {
            //           return null;
            //         }
            //       },
            //       itemCount: _processes.length,
            //     ),
            //   ),
            // ),
            controller.pages == Pages.deliveryTime
                ? DeliveryTime()
                : controller.pages == Pages.addAddress
                    ? AddAddress()
                    : CheckOutSummary(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: controller.index == 0
                      ? Container()
                      : Align(
                          alignment: Alignment.bottomLeft,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            width: 150,
                            height: 80,
                            padding: EdgeInsets.all(15.0),
                            child: MaterialButton(
                              onPressed: () {
                                controller.channgeIndex(controller.index - 1);
                              },
                              child: Text(
                                'BACK',
                                style: TextStyle(
                                  //fontWeight: FontWeight.bold,
                                  color: defualtColor,
                                ),
                              ),
                              color: Colors.white,
                            ),
                          ),
                        ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      width: 150,
                      height: 80,
                      padding: EdgeInsets.all(15.0),
                      child: MaterialButton(
                        onPressed: () async {
                          controller.channgeIndex(controller.index + 1);
                          if(controller.index == 2){
                            print('dddddddddddddddddddddddd');
                            if (controller.formState.currentState!.validate()) {
                              controller.formState.currentState!.save();
                              await controller.addCheckoutToFireStore();
                              Get.dialog(
                                AlertDialog(
                                  content: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(
                                          Icons.check_circle_outline_outlined,
                                          color: defualtColor,
                                          size: 200,
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          child: Text('Order Submitted',
                                            style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color: defualtColor),),
                                        ),
                                        SizedBox(
                                          height: 40,
                                        ),
                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: defualtColor,
                                            elevation: 0,
                                            padding: EdgeInsets.symmetric(vertical: 16),
                                          ),
                                          onPressed: (){
                                            Get.back();
                                            },
                                          child: CustomText(
                                            text: 'done',
                                            fontSize: 14,
                                            color: Colors.white,
                                            alignment: Alignment.center, maxLine: 1,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                barrierDismissible: false,
                              );
                            }
                          }

                        },
                        child: Text(
                          'NEXT',
                          style: TextStyle(
                            //fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        color: defualtColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        // floatingActionButton: FloatingActionButton(
        //   child:  Icon(Icons.skip_next,),
        //   onPressed: (){
        //     },
        //   backgroundColor: defualtColor,
        // ),
      ),
    );
  }
}
