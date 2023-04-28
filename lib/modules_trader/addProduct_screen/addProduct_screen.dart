import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:untitled/shared/styles/color.dart';

class addProductScreen extends StatelessWidget {

  var prodectcontroller = TextEditingController();
  var descriptioncontroller = TextEditingController();
  var moneycontroller=TextEditingController();
  var categorycontroller = TextEditingController();
  var _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: defualtColor,
        leading: BackButton(),
        title: Text('Add Your Product'),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children:
              [
                TextFormField(
                  controller: prodectcontroller,
                  keyboardType: TextInputType.text,
                  onSaved: (value){

                  },
                  validator: (value){
                    if (value == null) {
                      print("ERROR");
                    }
                  },
                  decoration: InputDecoration(
                    border:OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: defualtColor,width: 2.0),
                    ),
                    labelText: 'Prodect Title',
                    //  labelStyle: TextStyle(color: Color(0xff0CC095)),
                    prefixIcon: Icon(
                      Icons.edit,
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                TextFormField(
                  controller: descriptioncontroller,
                  keyboardType: TextInputType.text,
                  onSaved: (value){

                  },
                  validator: (value){
                    if (value == null) {
                      print("ERROR");
                    }
                  },
                  decoration: InputDecoration(
                    border:OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: defualtColor,width: 2.0),
                    ),
                    labelText: 'Description',
                    //  labelStyle: TextStyle(color: Color(0xff0CC095)),
                    prefixIcon: Icon(
                      Icons.description,
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                TextFormField(
                  controller: categorycontroller,
                  keyboardType: TextInputType.text,
                  onSaved: (value){
                  },
                  validator: (value){
                    if (value == null) {
                      print("ERROR");
                    }
                  },
                  decoration: InputDecoration(
                    border:OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: defualtColor,width: 2.0),
                    ),
                    labelText: 'category',
                    //  labelStyle: TextStyle(color: Color(0xff0CC095)),
                    prefixIcon: Icon(
                      Icons.category,
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                TextFormField(
                  controller: moneycontroller,
                  keyboardType: TextInputType.number,
                  onSaved: (value){

                  },
                  validator: (value){
                    if (value == null) {
                      print("ERROR");
                    }
                  },
                  decoration: InputDecoration(
                    border:OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: defualtColor,width: 2.0),
                    ),
                    labelText: '0.0',
                    //  labelStyle: TextStyle(color: Color(0xff0CC095)),
                    prefixIcon: Icon(
                      Icons.monetization_on_outlined,
                    ),
                  ),
                ),
                SizedBox(height: 30,),
                Row(
                  children:
                  [
                    Expanded(
                      child: GestureDetector(
                        onTap: (){

                        },
                        child: Container(
                          width: 100,
                          height: 100,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(
                                image: NetworkImage('https://img.icons8.com/?size=512&id=11741&format=png'),
                                height: 50.0,
                                width: 50.0,
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              Text(
                                'Camera',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          decoration: BoxDecoration(
                            color: defualtColor,
                            borderRadius: BorderRadius.circular(
                              10.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: (){
                        },
                        child: Container(
                          width: 100,
                          height: 100,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(
                                image: NetworkImage('https://img.icons8.com/?size=512&id=PJzFkPxCi934&format=png'),
                                height: 50.0,
                                width: 50.0,
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              Text(
                                'Upload Media',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          decoration: BoxDecoration(
                            color: defualtColor,
                            borderRadius: BorderRadius.circular(
                              10.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 200,),
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
                      onPressed: (){

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