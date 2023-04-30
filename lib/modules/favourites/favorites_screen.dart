import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:untitled/core/viewModel/fav_view_model.dart';
import 'package:untitled/shared/styles/color.dart';

class FavoriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<FavViewModel>(
      init: FavViewModel(),
      builder: (controller) => controller.favProductModel.length == 0
          ? Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset('imagies/undraw_wishlist_re_m7tv.svg',width: 150,height: 150,),
            SizedBox(height: 20,),
            Text(
              'Wishlist Empty',
              style: TextStyle(fontSize: 32,),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      )
          :Scaffold(
        appBar: AppBar(
          backgroundColor: defualtColor,
          automaticallyImplyLeading: false,
          title: Center(
              child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Text('My Wishlist'),
          )),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.separated(
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) => Container(
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
                              '${controller.favProductModel[index].image}'),
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
                          '${controller.favProductModel[index].name}',
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
                          '${controller.favProductModel[index].description}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            height: 1.1,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              '${controller.favProductModel[index].price}\$',
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
                              onPressed: () {
                                controller.deleteFavProduct(index);
                              },
                              icon: Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                            ),
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
            separatorBuilder: (context, index) => Container(
              width: double.infinity,
              height: 1.0,
              color: Colors.grey[300],
            ),
            itemCount: controller.favProductModel.length,
          ),
        ),
      ),
    );
  }
}
