import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rent/config/current_session.dart';
import 'package:rent/welcome_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  XFile? image;

  final ImagePicker imagePicker = ImagePicker();

  getImageFromGallery() async {
    image = await imagePicker.pickImage(source: ImageSource.gallery);
    //upload storage
    // get photo link ()
    // FirebaseAuth.instance.currentUser.photoURL =
    //     'https://firebasestorage.googleapis.com/v0/b/rent-4.appspot.com/o/profilepic.jpg?alt=media&token=940aefba-fd08-4e7c-a430-e396f20faf8c';
    setState(() {
      image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Color(0xff79698e),
            ),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: CircleAvatar(
                    backgroundImage:
                        image == null ? null : FileImage(File(image!.path)),
                    // child:image==null? Icon(Icons.add_photo_alternate_outlined,
                    // color: Colors.grey,
                    // size: MediaQuery.of(context).size.width*0.10,):null,
                    backgroundColor: Colors.white70,
                    radius: 50.0,
                  ),
                ),
                Positioned(
                    bottom: 5,
                    left: 55,
                    child: IconButton(
                      onPressed: () {
                        getImageFromGallery();
                      },
                      icon: Icon(
                        Icons.add_a_photo_outlined,
                        color: Colors.white,
                      ),
                    )),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    CurrentSession().user?.fullname ?? 'User',
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight + Alignment(0, .3),
                  child: Text(
                    CurrentSession().user?.username ?? 'Username',
                    style: TextStyle(
                      color: Colors.white70,
                    ),
                  ),
                ),
              ],
            ),
          ),

          ListTile(
            leading: Icon(
              Icons.favorite,
              color: Color(0xff79698e),
            ),
            title: Text('Favorite'),
            onTap: () => null,
          ),
          //Divider(),

          ListTile(
            leading: Icon(
              Icons.wysiwyg,
              color: Color(0xff79698e),
            ),
            title: Text('Post'),
            onTap: () => {},
          ),

          Divider(),

          ListTile(
            leading: Icon(
              Icons.warning_amber,
            ),
            title: Text('About app'),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: TextButton(
              onPressed: () {
                CurrentSession().user = null;
                FirebaseAuth.instance.signOut();
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const BottomSheetApp()),
                  (route) => false,
                );
              },
              child: Text(
                "Log Out",
                style: TextStyle(color: Color(0xff79698e)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
// void PickImage(){
// var image= ImagePicker().pickImage(source:ImageSource.gallery);
//
// setState((){
//   _image =image;
// });
// }
