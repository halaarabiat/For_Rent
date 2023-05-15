import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as path;


Future<String> uploadImage(File file)
async{
  String fileName=path.basename(file.path);
  Reference ref=FirebaseStorage.instance.ref().child("images/$fileName");
  UploadTask task=ref.putFile(file);
  TaskSnapshot snapshot = await task.whenComplete(() => null);
  String url = await snapshot.ref.getDownloadURL();
  return url;
}