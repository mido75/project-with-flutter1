import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:untitled/core/viewModel/profile_image_upload_view_model.dart';
import 'package:untitled/core_trader/service/store.dart';
import 'package:untitled/models/product_model.dart';
import 'package:untitled/models/setting_model.dart';
import 'package:untitled/modules_trader/manager_products/manager_products.dart';
import 'package:untitled/modules_trader/my_products_screen/my_products_screen.dart';
import 'package:untitled/shared/styles/color.dart';

class addProductScreen extends StatefulWidget {
  @override
  _addProductScreenState createState() => _addProductScreenState();
}

class _addProductScreenState extends State<addProductScreen> {
  var prodectcontroller = TextEditingController();
  var descriptioncontroller = TextEditingController();
  var moneycontroller = TextEditingController();
  var categorycontroller = TextEditingController();
  var _formKey = GlobalKey<FormState>();
  final _store = Store();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SelectImageViewModel>(
      init: SelectImageViewModel(),
      builder:(controller) => Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          leading: Padding(
            padding:  EdgeInsets.only(top: 20),
            child: IconButton(onPressed: (){
              Get.back();
            },icon: Icon(Icons.arrow_back_ios,color: Colors.black,),),
          ),
          title: Padding(
            padding:  EdgeInsets.only(left: 20,top: 20),
            child: Text('Add Your Product',style: TextStyle(color: Colors.black),),
          ),
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  /*
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
                              'Add Your Product',
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

                   */
                  Column(
                    children:
                    [
                      SizedBox(
                        height: 23,
                      ),
                      Align(
                        child: Stack(
                            alignment: AlignmentDirectional.topEnd,
                            children:
                            [
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
                                height: 140.0,
                                width: double.infinity,
                                decoration: controller.imageProductFile != null
                                    ? BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                  image: DecorationImage(
                                    image: FileImage(controller.imageProductFile!),
                                    fit: BoxFit.cover,
                                  ),
                                )
                                    : BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                  image: DecorationImage(
                                    image: AssetImage('imagies/undraw_Image_upload_re_w7pm.png'),
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
                                            fontSize: 20,
                                            color: defualtColor,
                                          ),
                                        ),
                                      ),
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Divider(
                                            height: 1,
                                          ),
                                          ListTile(
                                            onTap: () async {
                                              try {
                                                await controller.cameraImageProduct();
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
                                            height: 1,
                                          ),
                                          ListTile(
                                            onTap: () async{
                                              try {
                                                await controller.galleryImageProduct();
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
                                  radius: 20.0,
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
                        height: 13,
                      ),
                      TextFormField(
                        controller: prodectcontroller,
                        keyboardType: TextInputType.text,
                        onSaved: (value) {
                          prodectcontroller.text=value!;
                        },
                        validator: (value) {
                          if (value == null) {
                            print("ERROR");
                          }
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: defualtColor, width: 2.0),
                          ),
                          labelText: 'Prodect Title',
                          //  labelStyle: TextStyle(color: Color(0xff0CC095)),
                          prefixIcon: Icon(
                            Icons.edit,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: descriptioncontroller,
                        keyboardType: TextInputType.text,
                        onSaved: (value) {
                          descriptioncontroller.text=value!;
                        },
                        validator: (value) {
                          if (value == null) {
                            print("ERROR");
                          }
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: defualtColor, width: 2.0),
                          ),
                          labelText: 'Description',
                          //  labelStyle: TextStyle(color: Color(0xff0CC095)),
                          prefixIcon: Icon(
                            Icons.description,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: categorycontroller,
                        keyboardType: TextInputType.text,
                        onSaved: (value) {
                          categorycontroller.text=value!;
                        },
                        validator: (value) {
                          if (value == null) {
                            print("ERROR");
                          }
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: defualtColor, width: 2.0),
                          ),
                          labelText: 'category',
                          //  labelStyle: TextStyle(color: Color(0xff0CC095)),
                          prefixIcon: Icon(
                            Icons.category,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: moneycontroller,
                        keyboardType: TextInputType.number,
                        onSaved: (value) {
                          moneycontroller.text=value!;
                        },
                        validator: (value) {
                          if (value == null) {
                            print("ERROR");
                          }
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: defualtColor, width: 2.0),
                          ),
                          labelText: '0.0',
                          //  labelStyle: TextStyle(color: Color(0xff0CC095)),
                          prefixIcon: Icon(
                            Icons.monetization_on_outlined,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Color(0xff0CC095),
                            borderRadius: BorderRadius.circular(
                              10.0,
                            ),
                          ),
                          child: MaterialButton(
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                setState(() {
                                  _isLoading = true;
                                });
                                try {
                                  await controller.uploadImageProductToFirebase();
                                } catch (e) {
                                  print(e.toString());
                                }
                                _store.addProduct(ProductModel(
                                  name: prodectcontroller.text,
                                  description: descriptioncontroller.text,
                                  price: moneycontroller.text,
                                  category: categorycontroller.text,
                                  image: controller.productUrl,
                                ));
                                _formKey.currentState!.save();
                                setState(() {
                                  _isLoading = false;
                                });
                              }
                              Get.to(ManageProducts());
                            },
                            height: 40.0,
                            child: Text(
                              'SAVE',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/*
File? postImage;
var picker =ImagePicker();

Future<void> getPostImage() async
{
  final pickerFile = await picker.pickImage(source: ImageSource.gallery,);
  if(pickerFile != null)
  {
    postImage = File(pickerFile.path);
  }
  else {
    print('no post selected .');
  }
}

 */


