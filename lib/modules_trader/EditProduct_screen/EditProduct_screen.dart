import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:untitled/core/viewModel/profile_image_upload_view_model.dart';
import 'package:untitled/core_trader/service/store.dart';
import 'package:untitled/models/product_model.dart';
import 'package:untitled/shared/components/components.dart';
import 'package:untitled/shared/styles/color.dart';

class EditProductScreen extends StatelessWidget {
  String? _name, _price, _description, _category, _imageLocation;
  ProductModel model;
  EditProductScreen({required this.model});

  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  final _store = Store();
  @override
  Widget build(BuildContext context) {
    //ProductModel product = ModalRoute.of(context)!.settings.arguments;
    return GetBuilder<SelectImageViewModel>(
      init: SelectImageViewModel(),
      builder: (controller) => Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          leading: Padding(
            padding:  EdgeInsets.only(top: 20).r,
            child: IconButton(onPressed: (){
              Get.back();
            },icon: Icon(Icons.arrow_back_ios,color: Colors.black,),),
          ),
          title: Padding(
            padding:  EdgeInsets.only(left: 20,top: 20).r,
            child: Text('Edit Product',style: TextStyle(color: Colors.black),),
          ),
        ),
        body: Form(
          key: _globalKey,
          child: ListView(
            children: <Widget>[
              SizedBox(
                height: 30.h,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 13.h,
                  ),
                  Align(
                    child: Stack(
                        alignment: AlignmentDirectional.topEnd,
                        children: [
                          /*
                          Container(
                            height: 140.0,
                            width: double.infinity,
                            decoration: controller.imageCoverFile != null
                                ? BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                          image: DecorationImage(
                                            image: FileImage(controller.imageCoverFile!),
                                            fit: BoxFit.cover,
                                          ),
                                        )
                                : BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                          image: DecorationImage(
                                            image: NetworkImage(
                                                'https://png.pngtree.com/thumb_back/fh260/background/20200630/pngtree-neon-double-color-futuristic-frame-colorful-background-image_340466.jpg'),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                          ),

                           */
                          Container(
                            height: 140.0.h,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(4.0).w,
                                      topRight: Radius.circular(4.0).w,
                                    ),
                                    image: DecorationImage(
                                      image: AssetImage(
                                          'imagies/undraw_Image_upload_re_w7pm.png'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                          ),
                          IconButton(
                            onPressed: () {
                              Get.dialog(
                                AlertDialog(
                                  title: Container(
                                    child: Text(
                                      'Choose option',
                                      style: TextStyle(
                                        fontSize: 20.sp,
                                        color: defualtColor,
                                      ),
                                    ),
                                  ),
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Divider(
                                        height: 1.h,
                                      ),
                                      ListTile(
                                        onTap: () async {
                                          try {
                                            //  await controller.cameraImageProduct();
                                            Get.back();
                                          } catch (error) {
                                            Get.back();
                                          }
                                        },
                                        title: Container(
                                          child: Text(
                                            'Camera',
                                          ),
                                        ),
                                        leading: Icon(
                                          Icons.camera,
                                          color: defualtColor,
                                        ),
                                      ),
                                      Divider(
                                        height: 1.h,
                                      ),
                                      ListTile(
                                        onTap: () async {
                                          try {
                                            //  await controller.galleryImageProduct();
                                            Get.back();
                                          } catch (error) {
                                            Get.back();
                                          }
                                        },
                                        title: Container(
                                          child: Text(
                                            'Gallery',
                                          ),
                                        ),
                                        leading: Icon(
                                          Icons.account_box,
                                          color: defualtColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                            icon: CircleAvatar(
                              backgroundColor: defualtColor,
                              radius: 20.0.r,
                              child: Icon(
                                Icons.camera,
                                color: Colors.white,
                                size: 16.0,
                              ),
                            ),
                          ),
                        ]),
                    alignment: AlignmentDirectional.topCenter,
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    onSaved: (value) {
                      _name = value!;
                    },
                    validator: (value) {
                      if (value == null) {
                        print("ERROR");
                      }
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: defualtColor, width: 2.0.w),
                      ),
                      labelText: 'Product Name',
                      //  labelStyle: TextStyle(color: Color(0xff0CC095)),
                      prefixIcon: Icon(
                        Icons.edit,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    onSaved: (value) {
                      _description = value!;
                    },
                    validator: (value) {
                      if (value == null) {
                        print("ERROR");
                      }
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: defualtColor, width: 2.0.w),
                      ),
                      labelText: 'Description',
                      //  labelStyle: TextStyle(color: Color(0xff0CC095)),
                      prefixIcon: Icon(
                        Icons.description,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    onSaved: (value) {
                      _category = value!;
                    },
                    validator: (value) {
                      if (value == null) {
                        print("ERROR");
                      }
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: defualtColor, width: 2.0.w),
                      ),
                      labelText: 'category',
                      //  labelStyle: TextStyle(color: Color(0xff0CC095)),
                      prefixIcon: Icon(
                        Icons.category,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    onSaved: (value) {
                      _price = value!;
                    },
                    validator: (value) {
                      if (value == null) {
                        print("ERROR");
                      }
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: defualtColor, width: 2.0.w),
                      ),
                      labelText: '0.0',
                      //  labelStyle: TextStyle(color: Color(0xff0CC095)),
                      prefixIcon: Icon(
                        Icons.monetization_on_outlined,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0).w,
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0xff0CC095),
                        borderRadius: BorderRadius.circular(
                          10.0,
                        ),
                      ),
                      child: MaterialButton(
                      onPressed: () {
                        if (_globalKey.currentState!.validate()) {
                          _globalKey.currentState!.save();

                          _store.editProduct({
                            'name': _name,
                            'image': _imageLocation,
                            'category': _category,
                            'description': _description,
                            'price': _price
                          }, model.id);
                        }
                      },
                      child: Text('Edit Product',style: TextStyle(color: Colors.white),),
                    ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
