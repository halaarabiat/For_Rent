import 'dart:io';
import 'package:flutter/services.dart';
 import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rent/welcome_screen.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
   XFile? image;

   final ImagePicker imagePicker =ImagePicker();

   getImageFromGallery() async {
     image= await imagePicker.pickImage(source: ImageSource.gallery);

     setState(() {
       image;
     });
   }




  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children :<Widget> [
          DrawerHeader(
            decoration: const BoxDecoration(
                color: Color(0xff79698e),
            ),


            child:Stack(
              children: [
                Align(alignment: Alignment.centerLeft,
                child: CircleAvatar(
                  backgroundImage: image==null
                      ?null
                      :FileImage(
                      File(image!.path)
                       ),
                   // child:image==null? Icon(Icons.add_photo_alternate_outlined,
                   // color: Colors.grey,
                   // size: MediaQuery.of(context).size.width*0.10,):null,
                    backgroundColor: Colors.white70,
                  radius: 50.0,
                ),),


                   Positioned(
                      bottom: 5,
                      left: 55,
                      child: IconButton(onPressed: () {
                         getImageFromGallery();
                      },


                  icon: const Icon(Icons.add_a_photo_outlined,
                  color: Colors.grey,),)),


                const Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Tala Arabiat',
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                ),

                Align(
                  alignment: Alignment.centerRight + const Alignment(0, .3),
                  child: const Text(
                    '@tala_arabiat',
                    style: TextStyle(
                      color: Colors.white70,
                    ),
                  ),
                ),
                     // Align(
                     // alignment: Alignment.centerRight + Alignment(0, .9),
                     //   child: Container(
                     //    decoration: BoxDecoration(
                     //    border: Border.all(color: Colors.white),
                     //     borderRadius: BorderRadius.circular(15.0),
                     //
                     //      ),
                     //     child: Padding(
                     //       padding: const EdgeInsets.all(5.0),
                     //       child: Text('Edit'),),
                     //     ),
                     //
                     //
                     //
                     //
                     //   ),

              ],
            ),
          ),

          ListTile(
            leading: const Icon(Icons.favorite,
            color: Color(0xff79698e),),
            title: const Text('Favorite'),
            onTap: () => null,
          ),
          //Divider(),

          ListTile(
            leading: const Icon(Icons.wysiwyg,
            color: Color(0xff79698e),),
            title: const Text('Post'),
            onTap: ()=>null,
          ),

          const Divider(),

          const ListTile(
            leading: Icon(Icons.warning_amber,),
            title: Text('About app'),
          ),

          Align(alignment:Alignment.bottomCenter ,
          child: TextButton(onPressed: (){

            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const BottomSheetApp()),
                  (route) => false,
            );

          },
          child: const Text("Log Out",
          style: TextStyle(color: Color(0xff79698e)),),),)
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