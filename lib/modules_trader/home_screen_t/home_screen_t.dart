import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/core/viewModel/home_view_model.dart';
import 'package:untitled/models/setting_model.dart';
import 'package:untitled/shared/styles/color.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import '../../models/chart_model.dart';
import '../../modules/notifications_screen/notificationList.dart';

class HomeScreen_T extends StatelessWidget {
  final List<BarChartModel> data = [
    BarChartModel(
      week: 'week1',
      financial: 10,
      color: charts.ColorUtil.fromDartColor(defualtColor),
    ),
    BarChartModel(
      week: 'week2',
      financial: 20,
      color: charts.ColorUtil.fromDartColor(defualtColor),
    ),
    BarChartModel(
      week: 'week3',
      financial: 60,
      color: charts.ColorUtil.fromDartColor(defualtColor),
    ),
    BarChartModel(
      week: 'week4',
      financial: 40,
      color: charts.ColorUtil.fromDartColor(defualtColor),
    ),
    BarChartModel(
      week: 'week5',
      financial: 30,
      color: charts.ColorUtil.fromDartColor(defualtColor),
    ),
    BarChartModel(
      week: 'week6',
      financial: 60,
      color: charts.ColorUtil.fromDartColor(defualtColor),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    List<charts.Series<BarChartModel, String>> series = [
      charts.Series(
        id: "financial",
        data: data,
        domainFn: (BarChartModel series, _) => series.week,
        measureFn: (BarChartModel series, _) => series.financial,
        colorFn: (BarChartModel series, _) => series.color,
      ),
    ];
    return GetBuilder<SettingModel>(
      init: SettingModel(),
      builder: (controller) => controller.loading == true
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white10,
                elevation: 0.0,
                leading: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              "imagies/269969424_655870578924985_1432197706298581466_nn.png"),
                          fit: BoxFit.fill),
                    ),
                  ),
                ),
                actions: [
                  IconButton(
                      onPressed: () {
                        Get.to(NotificationList());
                      },
                      icon: Icon(
                        Icons.notifications,
                        color: defualtColor,
                      )),
                ],
              ),
              body: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Text(
                        'Welcome ${controller.currentUser!.name}',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Container(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('Earnings',
                                        style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white,
                                        )),
                                    Text(
                                      '30.28',
                                      style: TextStyle(
                                        fontSize: 40.0,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        ImageIcon(
                                          AssetImage(
                                              "imagies/exchange-rate.png"),
                                          size: 20.0,
                                          color: Colors.white,
                                        ),
                                        Text('+0.21%',
                                            style: TextStyle(
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.white,
                                            )),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: defualtColor),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  border: Border.all(color: defualtColor)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text('Total gross',
                                        style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.w700,
                                          color: defualtColor,
                                        )),
                                    const Text(
                                      '50.21',
                                      style: TextStyle(
                                        fontSize: 40.0,
                                        fontWeight: FontWeight.w700,
                                        color: defualtColor,
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        ImageIcon(
                                          AssetImage(
                                              "imagies/exchange-rate.png"),
                                          size: 20.0,
                                          color: defualtColor,
                                        ),
                                        Text('+0.21%',
                                            style: TextStyle(
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.w700,
                                              color: defualtColor,
                                            )),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      color: Color(0xFFDFEEF4),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'March stats',
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'Orders placed between 1st Feb - 31st Feb',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16.0,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 30,
                                          width: 120,
                                          child: Center(
                                            child: Text(
                                              'This month',
                                              style: TextStyle(
                                                fontSize: 17.0,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              color: defualtColor),
                                        ),
                                        SizedBox(
                                          width: 20.0,
                                        ),
                                        Container(
                                          height: 30,
                                          width: 120,
                                          child: Center(
                                            child: Text(
                                              'Last month',
                                              style: TextStyle(
                                                fontSize: 17.0,
                                                color: defualtColor,
                                              ),
                                            ),
                                          ),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              border: Border.all(
                                                  color: defualtColor)),
                                        ),
                                        SizedBox(
                                          width: 20.0,
                                        ),
                                        Container(
                                          height: 30,
                                          width: 120,
                                          child: Center(
                                            child: Text(
                                              'This 3 months',
                                              style: TextStyle(
                                                fontSize: 17.0,
                                                color: defualtColor,
                                              ),
                                            ),
                                          ),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              border: Border.all(
                                                  color: defualtColor)),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              color: Colors.white,
                              child: IntrinsicHeight(
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Placed',
                                                  style: TextStyle(
                                                    fontSize: 17.0,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 10.0,
                                                ),
                                                Row(
                                                  children: [
                                                    Icon(
                                                      Icons.list_alt,
                                                      color: defualtColor,
                                                    ),
                                                    // ImageIcon(
                                                    //   AssetImage("assets/order.png"),
                                                    //   size: 10.0,
                                                    //   color: Colors.cyanAccent,
                                                    // ),
                                                    SizedBox(
                                                      width: 15.0,
                                                    ),
                                                    Text(
                                                      '0',
                                                      style: TextStyle(
                                                        fontSize: 17.0,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          Divider(
                                            color: BColor,
                                            thickness: 3,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Deliveries in Progress',
                                                  style: TextStyle(
                                                    fontSize: 17.0,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 10.0,
                                                ),
                                                Row(
                                                  children: [
                                                    ImageIcon(
                                                      AssetImage(
                                                          "imagies/delivery-status.png"),
                                                      size: 20.0,
                                                      color: defualtColor,
                                                    ),
                                                    SizedBox(
                                                      width: 15.0,
                                                    ),
                                                    Text(
                                                      '0',
                                                      style: TextStyle(
                                                        fontSize: 17.0,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          Divider(
                                            color: BColor,
                                            thickness: 3,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Order Delivered',
                                                  style: TextStyle(
                                                    fontSize: 17.0,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 10.0,
                                                ),
                                                Row(
                                                  children: [
                                                    ImageIcon(
                                                      AssetImage(
                                                          "imagies/order-delivery.png"),
                                                      size: 17.0,
                                                      color: defualtColor,
                                                    ),
                                                    SizedBox(
                                                      width: 15.0,
                                                    ),
                                                    Text(
                                                      '0',
                                                      style: TextStyle(
                                                        fontSize: 17.0,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    // SizedBox(width: 40.0,),
                                    VerticalDivider(
                                      color: BColor,
                                      thickness: 3,
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Confirmed',
                                                  style: TextStyle(
                                                    fontSize: 17.0,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 10.0,
                                                ),
                                                Row(
                                                  children: [
                                                    Icon(
                                                      Icons.shopping_bag,
                                                      color: defualtColor,
                                                    ),
                                                    // ImageIcon(
                                                    //   AssetImage("assets/ConfirmBag.png"),
                                                    //   size: 10.0,
                                                    //   color: Colors.cyanAccent,
                                                    // ),
                                                    SizedBox(
                                                      width: 15.0,
                                                    ),
                                                    Text(
                                                      '0',
                                                      style: TextStyle(
                                                        fontSize: 17.0,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          Divider(
                                            color: BColor,
                                            thickness: 3,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Suspended',
                                                  style: TextStyle(
                                                    fontSize: 17.0,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 10.0,
                                                ),
                                                Row(
                                                  children: [
                                                    Icon(
                                                      Icons.shopping_bag,
                                                      color: Colors.red,
                                                    ),
                                                    // ImageIcon(
                                                    //   AssetImage("imagies/ConfirmBag.png"),
                                                    //   size: 20.0,
                                                    //   color: Colors.red,
                                                    // ),
                                                    SizedBox(
                                                      width: 15.0,
                                                    ),
                                                    Text(
                                                      '0',
                                                      style: TextStyle(
                                                        fontSize: 17.0,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          Divider(
                                            color: BColor,
                                            thickness: 3,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Deliveries with Refunds',
                                                  style: TextStyle(
                                                    fontSize: 17.0,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 10.0,
                                                ),
                                                Row(
                                                  children: [
                                                    ImageIcon(
                                                      AssetImage(
                                                          "imagies/refund.png"),
                                                      size: 17.0,
                                                      color: defualtColor,
                                                    ),
                                                    SizedBox(
                                                      width: 15.0,
                                                    ),
                                                    Text(
                                                      '0',
                                                      style: TextStyle(
                                                        fontSize: 17.0,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
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
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 250,
                        child: charts.BarChart(
                          series,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
