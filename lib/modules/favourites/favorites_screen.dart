import 'package:flutter/material.dart';
import 'package:untitled/shared/styles/color.dart';

class FavoriteScreen extends StatelessWidget {
  List<String> names = <String>[
    "Name",
    "Name",
    "Name",
  ];
  List<String> images = <String>[
    'imagies/Ellipse5.png',
    'imagies/Ellipse5.png',
    'imagies/Ellipse5.png',
  ];
  List<int> prices =<int> [
    100,200,300,
  ];

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       backgroundColor: defualtColor,
       automaticallyImplyLeading: false,
       title: Center(child: Padding(
         padding: const EdgeInsets.all(30.0),
         child: Text('My Wishlist'),
       )),
     ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.separated(
          physics: BouncingScrollPhysics(),
          itemBuilder: (context,index) => Container(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Stack(
                    alignment: AlignmentDirectional.bottomStart,
                    children: [
                      Image(
                        image: NetworkImage(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTzOfFKNzax_0PAMgamVmcWDF6_yTCprO46QA&usqp=CAU'),
                        width: double.infinity,
                        height: 150.0,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 5.0,
                    left: 5.0,
                    right: 5.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '{controller.productModel![index].name}',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          height: 1.1,
                        ),
                      ),
                      SizedBox(
                        height: 1.0,
                      ),
                      Text(
                        '{controller.productModel![index].description}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          height: 1.1,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            '{controller.productModel![index].price}',
                            style: TextStyle(
                              fontSize: 12.0,
                              color: defualtColor,
                            ),
                          ),
                          SizedBox(
                            width: 0.5,
                          ),
                          Spacer(),
                          IconButton(
                            onPressed: () {},
                            icon: CircleAvatar(
                              radius: 15.0,
                              backgroundColor: defualtColor,
                              child: Icon(
                                Icons.favorite_border,
                                size: 20.0,
                                color: Colors.white,
                              ),
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
          separatorBuilder: (context,index) => Container(
            width: double.infinity,
            height: 1.0,
            color: Colors.grey[300],
          ),
          itemCount: 12,
        ),
      ) ,
    );
  }
}
