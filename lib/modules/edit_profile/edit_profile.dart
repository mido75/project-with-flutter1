import 'package:flutter/material.dart';
import 'package:untitled/shared/styles/color.dart';

class EditProfileScreen extends StatelessWidget {
  var nameController = TextEditingController();
  var bioController = TextEditingController();
  var phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Edit Profile'),
          backgroundColor: defualtColor,
          actions: [
        TextButton(child: Text('update',
        style: TextStyle(
          color: Colors.white,
        ),), onPressed: () {}),
        SizedBox(
          width: 15.0,
        ),
      ]),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                height: 190.0,
                child: Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: [
                    Align(
                      child: Stack(
                          alignment: AlignmentDirectional.topEnd,
                          children: [
                            Container(
                              height: 140.0,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                                image: DecorationImage(
                                  image: NetworkImage('https://png.pngtree.com/thumb_back/fh260/background/20200630/pngtree-neon-double-color-futuristic-frame-colorful-background-image_340466.jpg'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
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
                    Stack(
                      alignment: AlignmentDirectional.bottomEnd,
                      children: [
                        CircleAvatar(
                          radius: 63.0,
                          backgroundColor:
                              Theme.of(context).scaffoldBackgroundColor,
                          child: CircleAvatar(
                            radius: 60.0,
                            backgroundImage: NetworkImage('https://t4.ftcdn.net/jpg/02/14/74/61/240_F_214746128_31JkeaP6rU0NzzzdFC4khGkmqc8noe6h.jpg'),
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: CircleAvatar(
                            backgroundColor: defualtColor,
                            radius: 20.0,
                            child: Icon(
                              color: Colors.white,
                              Icons.camera,
                              size: 16.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                children: [
                  Expanded(

                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: defualtColor,
                            borderRadius: BorderRadius.circular(
                              10.0,
                            ),
                          ),
                          child: MaterialButton(
                            onPressed: (){},
                            height: 40.0,
                            child: Text(
                              'upload profile',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: defualtColor,
                            borderRadius: BorderRadius.circular(
                              10.0,
                            ),
                          ),
                          child: MaterialButton(
                            onPressed: (){},
                            height: 40.0,
                            child: Text(
                              'upload cover',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                controller: nameController,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: defualtColor,width: 2.0),
                  ),
                  labelText: 'Name',
                  // hintText: hintText,
                  prefixIcon: Icon(
                    Icons.account_circle_outlined,
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextFormField(
                controller: phoneController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: defualtColor,width: 2.0),
                  ),
                  labelText: 'Phone',
                  // hintText: hintText,
                  prefixIcon: Icon(
                    Icons.call,

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
