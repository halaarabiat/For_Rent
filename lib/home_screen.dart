import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'NavBar.dart';
import 'post_screen.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff79698e),

          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  'assets/logo.png',
                  height:MediaQuery.of(context).size.height*0.07,

                  //alignment: Alignment.center,
                ),
              ),
            ],
          ),
          actions: [
            //   Image.asset("assets/test.png")


            IconButton(onPressed: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PostScreen()));
            }, icon: const Icon(Icons.add,
              color: Colors.black,),
              tooltip: 'Add New Post',)
          ],
          // leading:
          // IconButton(onPressed: (){}, icon: Icon(Icons.add,
          //     color: Colors.black,
          // )),



          //   bottom: PreferredSize(
          //     child: Container(
          //       height: 1.0,
          //       color: Colors.grey[300],
          //     ),
          //     preferredSize: Size.fromHeight(1.0),
          //   ),
          //
        ),

        drawer: const NavBar(),


        body: Form(
          key: _key,
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Image.asset("assets/home_screen_image.png",
                  fit: BoxFit.cover,),
              ),

              Positioned(
                top:100,
                right:80 ,
                child: Container(
                  height: 98,
                  width: 250,
                  color  : Colors.grey.withOpacity(0.7),
                  child: Column(
                    children: const [
                      SizedBox(height: 10,),
                      Text("Find your perfect home !",
                        style: TextStyle(fontSize:18,
                            fontWeight: FontWeight.bold),),

                      SizedBox(height: 10,),

                      Text("Houses , Apartment and Student Studio that fit your life style.",
                        style: TextStyle(fontSize: 15),
                        textAlign: TextAlign.center,),
                    ],
                  ),
                ),
              ),


              Positioned(
                top: MediaQuery.of(context).size.height*0.3,
                left: MediaQuery.of(context).size.width*0.10,
                child: Container(
                  height: MediaQuery.of(context).size.height*0.11,
                  width: MediaQuery.of(context).size.width*0.8,
                  color: Colors.grey.withOpacity(0.7),

                  padding: const EdgeInsets.all(16.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                        border: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xff79698e),width: 3,
                          ),),
                        focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xff79698e),width: 3,
                            )
                        ),
                        enabled: true,
                        fillColor: Colors.white70,
                        filled: true,
                        hintText: "search by city or neighborhood",
                        contentPadding: const EdgeInsets.all(5.0),
                        hintStyle: const TextStyle(fontSize: 15,),

                        suffixIcon: IconButton(
                          onPressed: (){},
                          icon: const Icon(Icons.search,
                            color: Color(0xff79698e),),
                        )
                    ),
                  ),
                ),
              ),


              // Positioned(
              //     child: Container(
              //       alignment: Alignment.topRight,
              //       child: Image.asset("assets/test.png",
              //       width: MediaQuery.of(context).size.width*0.15,
              //       height: MediaQuery.of(context).size.height*0.15,),
              //     ))

            ],
          ),
        ),
      ),
    );

  }
}
