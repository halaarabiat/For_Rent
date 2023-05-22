import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:path/path.dart' as path;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rent/config/current_session.dart';
import 'package:rent/liked_post_screen.dart';
import 'package:rent/register/welcome_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rent/utils/upload_images.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  XFile? image;
  final ImagePicker imagePicker = ImagePicker();
  String imgUrl = '';
  User? user = FirebaseAuth.instance.currentUser;

  Future<void> getImageFromGallery() async {
    final pickedImage =
        await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        image = pickedImage;
      });

      final file = File(pickedImage.path);
      final fileName = path.basename(file.path);

      try {
        if (user != null) {
          final storageRef =
              FirebaseStorage.instance.ref().child('profile_images/$fileName');
          final uploadTask = storageRef.putFile(file);

          await uploadTask;

          final imageUrl = await storageRef.getDownloadURL();

          await user!.updatePhotoURL(imageUrl);
          imgUrl = imageUrl;
          setState(() {});
        }
      } catch (e) {
        print('Error uploading image to Firebase: $e');
      }
    }
  }

  @override
  void initState() {
    if (user != null) {
      imgUrl = user?.photoURL ?? '';
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Color(0xff79698e),
            ),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: imgUrl.isNotEmpty? CircleAvatar(
                    backgroundImage: NetworkImage(imgUrl),
                    backgroundColor: Colors.white70,
                    radius: 50.0,
                  ): CircleAvatar(
                    backgroundColor: Colors.white70,
                    radius: 50.0,
                  ),//todo
                ),
                Positioned(
                    bottom: 5,
                    left: 55,
                    child: IconButton(
                      onPressed: () {
                        getImageFromGallery();
                      },
                      icon: const Icon(
                        Icons.add_a_photo_outlined,
                        color: Colors.white,
                      ),
                    )),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    CurrentSession().user?.fullname ?? 'User',
                    style: const TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                ),
                SizedBox(height: 5,),
                Align(
                  alignment: Alignment.centerRight + const Alignment(0, .4),
                  child: Text(
                    CurrentSession().user?.username ?? 'Username',
                    style: const TextStyle(
                      color: Colors.white70,
                    ),
                  ),
                ),
              ],
            ),
          ),

          ListTile(
            leading: const Icon(
              Icons.favorite,
              color: Color(0xff79698e),
            ),
            title: const Text('Favorite'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LikedPostsScreen(likedPosts: [],)),
              );
            },
          ),
          //Divider(),

          ListTile(
            leading: const Icon(
              Icons.wysiwyg,
              color: Color(0xff79698e),
            ),
            title: const Text('Post'),
            onTap: () => {},
          ),

          const Divider(),

          const ListTile(
            leading: Icon(
              Icons.warning_amber,
            ),
            title: Text('About app'),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: TextButton(
              onPressed: () {
                showDialog(context: context,
                    builder: (BuildContext context) {
                  return AlertDialog(
                    title: Row(
                      children: [
                        Padding(
                            padding:
                            const EdgeInsets.only(right: 6.0),
                          child: Icon(Icons.logout),
                        ),
                        Padding(padding: EdgeInsets.only(right: 8.0),
                        child: Text("Log Out"),)

                      ],
                    ),
                    content: Text("Do you wanna log out?"),
                    actions: [
                      TextButton(
                        onPressed: (){
                          Navigator.of(context).pop();
                        },
                        child: Text("Cancle",
                      style: TextStyle(color: Color(0xff79698e)),),

                      ),
                      TextButton(
                        onPressed: (){
                          CurrentSession().user = null;
                          FirebaseAuth.instance.signOut();
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const BottomSheetApp()),
                            (route) => false,
                          );
                        }, child: Text("Ok",
                        style: TextStyle(color: Color(0xff79698e)),),

                      ),
                    ],
                  );
                    });
                // CurrentSession().user = null;
                // FirebaseAuth.instance.signOut();
                // Navigator.pushAndRemoveUntil(
                //   context,
                //   MaterialPageRoute(
                //       builder: (context) => const BottomSheetApp()),
                //   (route) => false,
                // );
              },
              child: const Text(
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
