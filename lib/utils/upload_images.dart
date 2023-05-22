import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
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


// Future<String> uploadImage2(XFile xFile)
// async{
//   String fileName=path.basename(xFile.path);
//   Reference ref=FirebaseStorage.instance.ref().child("profileImage/$fileName");
//   UploadTask task=ref.putFile(xFile as File);
//   TaskSnapshot snapshot = await task.whenComplete(() => null);
//   String url = await snapshot.ref.getDownloadURL();
//   return url;
// }