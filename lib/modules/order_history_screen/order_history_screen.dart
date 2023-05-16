import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:untitled/core/viewModel/checkout_view_model.dart';

class OrderHistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckOutViewModel>(
      init: Get.find<CheckOutViewModel>(),
      builder: (controller) => Scaffold(
        body: Column(
          children: [
            Container(
              height: 130.h,
              child: Padding(
                padding: EdgeInsets.only(bottom: 24, left: 16, right: 16).r,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    IconButton(
                      padding: EdgeInsets.zero,
                      constraints: BoxConstraints(),
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.black,
                      ),
                    ),
                    Container(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        'Order History',
                        style: TextStyle(
                          fontSize: 20.sp,
                        ),
                      ),
                    ),
                    Container(
                      width: 24.w,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6).w,
                    child: Card(
                      child: Padding(
                        padding: EdgeInsets.all(16).w,
                        child: Container(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    child: Text(
                                      '${controller.checkouts[index].date}',
                                      style: TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      'Pending',
                                      style: TextStyle(
                                        color: Colors.red.shade300,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Divider(
                                thickness: 1,
                                color: Colors.grey.shade200,
                              ),
                              Container(
                                child: Text(
                                  '${controller.checkouts[index].street1}',
                                ),
                              ),
                              Container(
                                child: Text(
                                  '${controller.checkouts[index].street2}',
                                ),
                              ),
                              Container(
                                child: Text(
                                  '${controller.checkouts[index].city}',
                                ),
                              ),
                              Container(
                                child: Text(
                                  '${controller.checkouts[index].country}',
                                ),
                              ),
                              Container(
                                child: Text(
                                  '+${controller.checkouts[index].phone}',
                                ),
                              ),
                              Divider(
                                thickness: 1,
                                color: Colors.grey.shade200,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    child: Text(
                                      'Total Billed',
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      '\$${controller.checkouts[index].totalPrice}',
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => Divider(
                  thickness: 1,
                  color: Colors.grey.shade200,
                ),
                itemCount: controller.checkouts.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/*
GetBuilder<CheckoutViewModel>(
              init: Get.find<CheckoutViewModel>(),
              builder: (controller) =>
 */
