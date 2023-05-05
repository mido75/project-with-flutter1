import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/core/viewModel/profile_image_upload_view_model.dart';
import 'package:untitled/models/setting_model.dart';
import 'package:untitled/shared/styles/color.dart';
/*
class EditProfileScreen extends StatelessWidget {

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SelectImageViewModel>(
      init: SelectImageViewModel(),
      builder: (controller) => Form(
        key: _formKey,
        child: Scaffold(
          appBar: AppBar(
              title: Text('Edit Profile'),
              backgroundColor: defualtColor,
              actions: [
                _isLoading
                    ? CircularProgressIndicator()
                    : TextButton(
                    child: Text(
                      'update',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () async {
                      if (_formKey.currentState!
                          .validate()) {
                        setState(() {
                          _isLoading = true;
                        });
                        try {
                          await controller.uploadImageToFirebase();
                          Get.find<ProfileViewModel>().picUrl = controller.picUrl;
                        } catch (e) {
                          Get.find<ProfileViewModel>().picUrl = Get.find<ProfileViewModel>().currentUser!.pic;
                        }
                        _formKey.currentState!.save();
                        await Get.find<ProfileViewModel>().updateCurrentUser();
                        setState(() {
                          _isLoading = false;
                        });
                      }
                    },
                ),
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
                                      image: NetworkImage(
                                          'https://png.pngtree.com/thumb_back/fh260/background/20200630/pngtree-neon-double-color-futuristic-frame-colorful-background-image_340466.jpg'),
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
                                foregroundImage: controller.imageFile != null ? FileImage(controller.imageFile!) : null,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                Get.dialog(
                                  AlertDialog(
                                    title:  Container(
                                      child: Text(
                                        'Choose option',
                                        style: TextStyle(fontSize: 20,color: defualtColor,),
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
                                              await controller.cameraImage();
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
                                          onTap: () async {
                                            try {
                                              await controller.galleryImage();
                                              Get.back();
                                            } catch (error) {
                                              Get.back();
                                            }
                                          },
                                          title:Container(
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
                                onPressed: () {},
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
                                onPressed: () {},
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
                        borderSide: BorderSide(color: defualtColor, width: 2.0),
                      ),
                      labelText: 'Name',
                      //hintText: Get.find<SettingModel>().currentUser!.name,
                      prefixIcon: Icon(
                        Icons.account_circle_outlined,
                      ),
                    ),
                    validator : (value) {
                      if (value!.isEmpty || value.length < 4)
                        return 'Please enter valid name.';
                    },
                    //initialValue: Get.find<SettingModel>().currentUser!.name,
                    onSaved: (value) {
                      Get.find<SettingModel>().name = value;
                    },
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: defualtColor, width: 2.0),
                      ),
                      //hintText: Get.find<SettingModel>().currentUser!.email,
                      labelText: 'Email',
                      // hintText: hintText,
                      prefixIcon: Icon(
                        Icons.email,
                      ),
                    ),
                   // initialValue: Get.find<SettingModel>().currentUser!.email,
                    validator: (value) {
                      if (value!.isEmpty)
                        return 'Please enter valid email address.';
                    },
                    onSaved: (value) {
                      Get.find<SettingModel>().email =
                          value;
                    },
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
                        borderSide: BorderSide(color: defualtColor, width: 2.0),
                      ),
                      labelText: 'Phone',
                      // hintText: hintText,
                      prefixIcon: Icon(
                        Icons.call,
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty ||
                          value.length < 6)
                        return 'Please enter valid password with at least 6 characters.';
                    },
                    onSaved: (value) {
                      Get.find<SettingModel>()
                          .password = value;
                    },
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

 */

class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SelectImageViewModel>(
      init: SelectImageViewModel(),
      builder: (controller) => Form(
        key: _formKey,
        child: Scaffold(
          appBar: AppBar(
              title: Text('Edit Profile'),
              backgroundColor: defualtColor,
              actions: [
                _isLoading
                    ? CircularProgressIndicator()
                    : TextButton(
                        child: Text(
                          'update',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            setState(() {
                              _isLoading = true;
                            });
                            try {
                              await controller.uploadImageToFirebase();
                              Get.find<SettingModel>().picUrl = controller.picUrl;
                            } catch (e) {
                              print(e.toString());
                              Get.find<SettingModel>().picUrl = Get.find<SettingModel>().currentUser!.pic;
                            }
                            try{
                              await controller.uploadCoverImageToFirebase();
                              Get.find<SettingModel>().coverUrl = controller.coverUrl;
                            }catch(e){
                              print(e.toString());
                              Get.find<SettingModel>().coverUrl = Get.find<SettingModel>().currentUser!.cover;
                            }
                            _formKey.currentState!.save();
                            await Get.find<SettingModel>().updateCurrentUser();
                            setState(() {
                              _isLoading = false;
                            });
                          }
                        },
                      ),
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
                                  decoration: controller.imageCoverFile != null ?  BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0),
                                    ),
                                    image: DecorationImage(
                                      image: FileImage(controller.imageCoverFile!),
                                      fit: BoxFit.cover,
                                    ),
                                  ) :  BoxDecoration(
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
                                                  await controller.cameraCoverImage();
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
                                              onTap: () async {
                                                try {
                                                  await controller.galleryCoverImage();
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
                        Stack(
                          alignment: AlignmentDirectional.bottomEnd,
                          children: [
                            CircleAvatar(
                              radius: 63.0,
                              backgroundColor:
                                  Theme.of(context).scaffoldBackgroundColor,
                              child: CircleAvatar(
                                radius: 60.0,
                                backgroundImage: NetworkImage(
                                    'https://t4.ftcdn.net/jpg/02/14/74/61/240_F_214746128_31JkeaP6rU0NzzzdFC4khGkmqc8noe6h.jpg'),
                                foregroundImage: controller.imageFile != null
                                    ? FileImage(controller.imageFile!)
                                    : null,
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
                                              await controller.cameraImage();
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
                                          onTap: () async {
                                            try {
                                              await controller.galleryImage();
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

                                onPressed: () async{
                                  setState(() {
                                    _isLoading = true;
                                  });
                                  try {
                                    await controller.uploadImageToFirebase();
                                    Get.find<SettingModel>().picUrl =
                                        controller.picUrl;
                                  } catch (e) {
                                    Get.find<SettingModel>().picUrl =
                                        Get.find<SettingModel>().currentUser!.pic;
                                  }
                                  await Get.find<SettingModel>().updateCurrentUser();
                                  setState(() {
                                    _isLoading = false;
                                  });
                                },


                              //  onPressed: (){},
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
                                onPressed: () async{
                                  setState(() {
                                    _isLoading = true;
                                  });
                                  try {
                                    await controller.uploadCoverImageToFirebase();
                                    Get.find<SettingModel>().coverUrl =
                                        controller.coverUrl;
                                  } catch (e) {
                                    Get.find<SettingModel>().coverUrl =
                                        Get.find<SettingModel>().currentUser!.cover;
                                  }
                                  await Get.find<SettingModel>().updateCurrentUser();
                                  setState(() {
                                    _isLoading = false;
                                  });
                                },
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
                        borderSide: BorderSide(color: defualtColor, width: 2.0),
                      ),
                      labelText: 'Name',
                      hintText: Get.find<SettingModel>().currentUser!.name,
                      prefixIcon: Icon(
                        Icons.account_circle_outlined,
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty || value.length < 4)
                        return 'Please enter valid name.';
                    },
                    //initialValue: Get.find<SettingModel>().currentUser!.name,
                    onSaved: (value) {
                      Get.find<SettingModel>().name = value;
                    },
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: defualtColor, width: 2.0),
                      ),
                      hintText: Get.find<SettingModel>().currentUser!.email,
                      labelText: 'Email',
                      // hintText: hintText,
                      prefixIcon: Icon(
                        Icons.email,
                      ),
                    ),
                    // initialValue: Get.find<SettingModel>().currentUser!.email,
                    validator: (value) {
                      if (value!.isEmpty)
                        return 'Please enter valid email address.';
                    },
                    onSaved: (value) {
                      Get.find<SettingModel>().email = value;
                    },
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
                        borderSide: BorderSide(color: defualtColor, width: 2.0),
                      ),
                      labelText: 'Phone',
                      // hintText: hintText,
                      prefixIcon: Icon(
                        Icons.call,
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty || value.length < 13)
                        return 'Please enter valid password with at least 12 characters.';
                    },
                    onSaved: (value) {
                      Get.find<SettingModel>().phone = value;
                    },
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
