import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderHistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 130,
            child: Padding(
              padding: EdgeInsets.only(bottom: 24, left: 16, right: 16),
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
                        style: TextStyle(fontSize: 20,),
                      ),
                  ),
                  Container(
                    width: 24,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return Padding(
                    padding:
                    EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                    child: Card(
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: Container(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    child: Text(
                                      'sep 22, 2023 2:36 AM',
                                      style: TextStyle(color: Colors.grey,),
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      'Pending',
                                      style: TextStyle(color: Colors.red.shade300,),
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
                                  '19, street',
                                ),
                              ),
                              Container(
                                child: Text(
                                  'new sohag',
                                ),
                              ),
                              Container(
                                child: Text(
                                  'sohag',
                                ),
                              ),
                              Container(
                                child: Text(
                                  'egypt',
                                ),
                              ),
                              Container(
                                child: Text(
                                  '+20101429325',
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
                                      '\$250.3',
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
                itemCount: 12,
              ),
            ),

        ],
      ),
    );
  }
}

/*
GetBuilder<CheckoutViewModel>(
              init: Get.find<CheckoutViewModel>(),
              builder: (controller) =>
 */