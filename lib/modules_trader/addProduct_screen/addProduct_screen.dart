import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:untitled/shared/styles/color.dart';

class addProductScreen extends StatelessWidget {
  var prodectcontroller = TextEditingController();
  var descriptioncontroller = TextEditingController();
  var moneycontroller = TextEditingController();
  var categorycontroller = TextEditingController();
  var _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*
      appBar: AppBar(
        backgroundColor: defualtColor,
        leading: BackButton(),
        title: Text('Add Your Product'),
      ),

       */
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
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
                          decoration: BoxDecoration(
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
                                            onTap: () {
                                              /*
                                              async {
                                              try {
                                                await controller.cameraCoverImage();
                                                Get.back();
                                              } catch (error) {
                                                Get.back();
                                              }
                                            }
                                               */
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
                                            onTap: () {
                                              /*
                                              async {
                                              try {
                                                await controller.galleryCoverImage();
                                                Get.back();
                                              } catch (error) {
                                                Get.back();
                                              }
                                            }
                                               */
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
                  onSaved: (value) {},
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
                  onSaved: (value) {},
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
                  onSaved: (value) {},
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
                  onSaved: (value) {},
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
                      onPressed: () {},
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
