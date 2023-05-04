import 'package:flutter/material.dart';
import 'package:untitled/shared/constants/constants.dart';

import '../../shared/styles/color.dart';

class DeliveryTime extends StatefulWidget {
  @override
  State<DeliveryTime> createState() => _DeliveryTimeState();
}

class _DeliveryTimeState extends State<DeliveryTime> {
  Delivery delivery = Delivery.StandardDerlivery;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              SizedBox(
              height:50,
            ),
              RadioListTile<Delivery>(value:Delivery.StandardDerlivery,
                groupValue: delivery,
                onChanged: (value){
                setState(() {
                  delivery = value! ;
                });
                },
                title: Text("Standard Delivery",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ) ,
                subtitle: Text('Order Will Be Deliverd Between 3-5 Business Days',
                  style: TextStyle(fontSize: 14,)
                ),
                activeColor: defualtColor,
              ),
              SizedBox(
                height: 20,
              ),
              RadioListTile<Delivery>(value:Delivery.NextDayDelivery,
                groupValue: delivery,
                onChanged: (value){
                setState(() {
                  delivery=value!;
                });

                },
                title: Text("Next Day Delivery",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ) ,
                subtitle: Text('Place Your Order Before 6pm and Your Order Will Be Deliverd Next Day',
                    style: TextStyle(fontSize: 14,)
                ),
                activeColor: defualtColor,
              ),
              SizedBox(
                height: 20,
              ),
              RadioListTile<Delivery>(value:Delivery.NominatedDelivery,
                groupValue: delivery,
                onChanged: (value){
                  setState(() {
                    delivery=value!;
                  });

                },
                title: Text("Nomiated Delivery",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ) ,
                subtitle: Text('Place Your Order on particular Date and Your Order Will Be Deliverd on the Selected Day',
                    style: TextStyle(fontSize: 14,)
                ),
                activeColor: defualtColor,
              ),




            ],
          ),
        ),
      ),
    );
  }
}
