import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as path;
import 'package:rent/models/post_model.dart';
import 'package:rent/utils/upload_images.dart';



class ImageUploadForm extends StatefulWidget {
  final PostFormModel model;
  const ImageUploadForm({Key? key, required this.model}) : super(key: key);

  @override
  _ImageUploadFormState createState() => _ImageUploadFormState();
}

class _ImageUploadFormState extends State<ImageUploadForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  List<XFile> _selectedImages = [];

  void _pickImages() async {
    List<XFile>? images = await ImagePicker().pickMultiImage();
    if (_selectedImages.length + images.length <= 10) {
      setState(() {
        _selectedImages.addAll(images as Iterable<XFile>);
      });
    } else {
      int remainingCount = 10 - _selectedImages.length;
      images = images.sublist(0, remainingCount);
      setState(() {
        _selectedImages.addAll(images as Iterable<XFile>);
      });
      // Display a message indicating that the maximum limit has been reached
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('You can select up to 10 images. please delete additional images w'),
        ),
      );
    }
  }
  // upload image method
  // Future<String> uploadImage(File file)
  // async{
  //   String fileName=path.basename(file.path);
  //   Reference ref=FirebaseStorage.instance.ref().child("images/$fileName");
  //   UploadTask task=ref.putFile(file);
  //   TaskSnapshot snapshot = await task.whenComplete(() => null);
  //   String url = await snapshot.ref.getDownloadURL();
  //   return url;
  // }



  void _takePhoto() async {
    XFile? image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image != null) {
      setState(() {
        _selectedImages.add(image); // Append the captured image to the list
      });
    }
  }


  String? _validateImages(List<XFile> images) {
    if (images.length < 5) {
      return 'Please select at least 5 images.';
    }
    return null;
  }

  void _submitForm() async {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      String? validationResult = _validateImages(_selectedImages);
      List<String> imageUrl=[];
      if (validationResult == null) {
        for(var value in _selectedImages){
        imageUrl.add(await uploadImage(File(value.path)));}

          widget.model.images=imageUrl;
        CollectionReference postRef =
        FirebaseFirestore.instance.collection("post");
         await postRef.add(widget.model.toMap());

      } else {
        // Display validation error message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(validationResult)),
        );
      }
    }
  }
  void _deleteImage(int index) {
    setState(() {
      _selectedImages.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff79698e),
        title: Center(
          child: Image.asset(
            'assets/logo.png',
            height:MediaQuery.of(context).size.height*0.07,
          ),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton.icon(
                    onPressed: _pickImages,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff79698e),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32.0),
                      ),
                      minimumSize: const Size(100, 40),
                      foregroundColor: Colors.white, // Set the font color to white
                    ),
                    icon: const Icon(Icons.photo_library_outlined),
                    label: const Text('Select Images'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton.icon(
                    onPressed: _takePhoto,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff79698e),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32.0),
                      ),
                      minimumSize: const Size(100, 40),
                      foregroundColor: Colors.white, // Set the font color to white
                    ),
                    icon: const Icon(Icons.camera_alt_outlined),
                    label: const Text('Take Photo'),
                  ),
                ),

              ],
            ),

            const SizedBox(height: 10),
            Text(
              _selectedImages.length.toString() + ' images selected',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: GridView.builder(
                itemCount: _selectedImages.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 4,
                  mainAxisSpacing: 4,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return Stack(
                    children: [
                      Image.file(
                        File(_selectedImages[index].path),
                        fit: BoxFit.cover,
                      ),
                      Positioned(
                        top: 4,
                        right: 4,
                        child: GestureDetector(
                          onTap: () => _deleteImage(index),
                          child: Container(
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xff79698e),
                            ),
                            child: const Icon(
                              Icons.close_rounded,
                              size: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),

            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _submitForm,
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white70,// primary: const Color(0xff79698e),
                // Text Color (Foreground color)
                backgroundColor: const Color(0xff79698e),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32.0)),
                minimumSize: const Size(200, 40),
              ),
              child: const Text('Upload'),
            ),
          ],
        ),
      ),
    );
  }
}

