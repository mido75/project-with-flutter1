
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;


class SelectImageViewModel extends GetxController {
  File? imageFile;
  String? picUrl;

  File? imageCoverFile;
  String? coverUrl;

  File? imageProductFile;
  String? productUrl;

  cameraImage() async {

    final _pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
      maxHeight: 400,
      maxWidth: 400,
    );
    imageFile = File(_pickedFile!.path);
    update();
  }

  galleryImage() async {
    final _pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxHeight: 400,
      maxWidth: 400,
    );
    imageFile = File(_pickedFile!.path);
    update();
  }

  uploadImageToFirebase() async {
    String _fileName = basename(imageFile!.path);
    Reference _firebaseStorageRef = FirebaseStorage.instance.ref().child(
        'profilePics/$_fileName');
    UploadTask _uploadTask = _firebaseStorageRef.putFile(imageFile!);
    picUrl = await (await _uploadTask).ref.getDownloadURL();
    print(picUrl.toString());
  }

  cameraCoverImage() async {

    final _pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
      maxHeight: 400,
      maxWidth: 400,
    );
    imageCoverFile = File(_pickedFile!.path);
    update();
  }

  galleryCoverImage() async {
    final _pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxHeight: 400,
      maxWidth: 400,
    );
    imageCoverFile = File(_pickedFile!.path);
    update();
  }

  uploadCoverImageToFirebase() async {
    String _fileName = basename(imageCoverFile!.path);
    Reference _firebaseStorageRef = FirebaseStorage.instance.ref().child(
        'coverPics/$_fileName');
    UploadTask _uploadTask = _firebaseStorageRef.putFile(imageCoverFile!);
    coverUrl = await (await _uploadTask).ref.getDownloadURL();
    print(coverUrl.toString());
  }



  cameraImageProduct() async {

    final _pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
      maxHeight: 400,
      maxWidth: 400,
    );
    imageProductFile = File(_pickedFile!.path);
    update();
  }

  galleryImageProduct() async {
    final _pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxHeight: 400,
      maxWidth: 400,
    );
    imageProductFile = File(_pickedFile!.path);
    update();
  }

  uploadImageProductToFirebase() async {
    String _fileName = basename(imageProductFile!.path);
    Reference _firebaseStorageRef = FirebaseStorage.instance.ref().child(
        'productPics/$_fileName');
    UploadTask _uploadTask = _firebaseStorageRef.putFile(imageProductFile!);
    productUrl = await (await _uploadTask).ref.getDownloadURL();
    print(productUrl.toString());
  }

}
