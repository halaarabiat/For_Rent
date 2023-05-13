import 'package:flutter/material.dart';
import 'package:rent/home_screen.dart';
import 'package:ionicons/ionicons.dart';

import 'config/current_session.dart';


class PostDetails extends StatefulWidget {
  const PostDetails({Key? key}) : super(key: key);

  @override
  State<PostDetails> createState() => _PostDetailsState();
}

class _PostDetailsState extends State<PostDetails> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: const Color(0xff79698e),

        // title: Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     Container(
        //       padding: const EdgeInsets.all(8.0),
        //       child: Image.asset(
        //         'assets/logo.png',
        //         height:MediaQuery.of(context).size.height*0.07,
        //
        //         //alignment: Alignment.center,
        //       ),
        //     ),
        //   ],
        // ),
          actions: [
            IconButton(onPressed:  (){Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const HomeScreen() ));},
                icon: Icon(Ionicons.close_circle_outline,
                color: Colors.black,),)
          ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(CurrentSession().user?.fullname ?? 'User',
                    style: TextStyle(fontWeight: FontWeight.bold),),
                  ),
                  
                  IconButton(onPressed: (){
                    showModalBottomSheet(
                       isScrollControlled: true,
                        context: context,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(top: Radius.circular(20))
                        ),
                        builder: (context) {return Wrap(children:[
                           Column(
                            children: [
                              ListTile(
                                title: Text('Delete'),
                                leading: Icon(Icons.delete,
                                color: Color(0xff79698e),),
                                onTap: ()=>null,
                              ),
                            ],
                          ),

                            ],
                        );
                        } );
                  }, icon: Icon(Ionicons.ellipsis_horizontal_outline))
                ],
              ),


              Row(
                mainAxisAlignment:MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(onPressed:(){},
                      icon: Icon(Icons.arrow_circle_left_outlined,
                    size: 30,)),

                  Container(
                    height: MediaQuery.of(context).size.height*0.305,
                    width:  MediaQuery.of(context).size.width*0.70,
                    color: Colors.grey,

                  ),

                  IconButton(onPressed: (){},
                      icon: Icon(Icons.arrow_circle_right_outlined,
                      size: 30,))
                ],
              ),
              SizedBox(height: 14,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width*0.5,
                      decoration: BoxDecoration(
                        border:Border.all(
                          color: Colors.grey,
                          width: 1,
                        )
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.home_outlined,size: 40,),
                          SizedBox(width: 10,),
                          Text("Home"),
                        ],
                      ),
                    ),

                    Container(
                      width: MediaQuery.of(context).size.width*0.5,
                      decoration: BoxDecoration(
                          border:Border.all(
                            color: Colors.grey,
                            width: 1,
                          )
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.event_seat_outlined,size: 40,),
                          SizedBox(width: 10 ,),
                          Text('Furneshd'),
                        ],
                      ),
                    ),



                  ],
                ),
               // SizedBox(height:5 ,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width*0.3,
                    decoration: BoxDecoration(
                        border:Border.all(
                          color: Colors.grey,
                          width: 1,
                        )
                    ),
                    child: Column(
                      children: [
                        Icon(Icons.space_bar_outlined,size: 40,),
                        SizedBox(height: 5 ,),
                        Text("Flat"),
                        // SizedBox(height: 5 ,),
                        Text('160 m²'),

                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width*0.3,
                    decoration: BoxDecoration(
                      border:Border.all(
                        color: Colors.grey,
                        width: 1,
                      )
                    ),
                    child: Column(
                      children: [
                        Icon(Ionicons.bed_outline,size: 40,),
                        SizedBox(height: 5 ,),
                        Text("Number of room"),
                        // SizedBox(height: 5 ,),
                        Text('5'),

                      ],
                    ),
                  ),

                  Container(
                    width: MediaQuery.of(context).size.width*0.4,
                    decoration: BoxDecoration(
                      border:Border.all(
                        color: Colors.grey,
                        width: 1,
                      )
                    ),
                    child: Column(
                      children: [
                        Icon(Icons.space_bar_outlined,size: 40,),
                        SizedBox(height: 5 ,),
                        Text("Number of bathroom"),
                        // SizedBox(height: 5 ,),
                        Text('3'),

                      ],
                    ),
                  )

                ],
              ),
             SizedBox(height: 30,),
              // Container(
              //   decoration: BoxDecoration(
              //     border:Border.all(color: Colors.grey)
              //   ),
              //   height: MediaQuery.of(context).size.height*0.6,
              //   padding: EdgeInsets.all(10),
              //   margin: EdgeInsets.symmetric(horizontal: 15),
              //   child:
              //
              //
              // ),

             Container(
               width: MediaQuery.of(context).size.width*0.8,
               height:MediaQuery.of(context).size.height*0.1 ,
               decoration: BoxDecoration(
                   border:Border.all(
                     color: Colors.grey,
                     width: 1,
                   )
               ),
               child:Row(
                 children: [
                   Icon(Icons.location_on_outlined,size:40,),

                 ],
               ),
             ),

              SizedBox(height: 10,),
              Container(
                width: MediaQuery.of(context).size.width*0.8,
                height:MediaQuery.of(context).size.height*0.1 ,
                decoration: BoxDecoration(
                    border:Border.all(
                      color: Colors.grey,
                      width: 1,
                    )
                ),
                child:Row(
                  children: [
                    Icon(Icons.attach_money_outlined,size:40,),

                  ],
                ),
              ),



              SizedBox(height: 10,),
              Container(
                width: MediaQuery.of(context).size.width*0.8,
                height:MediaQuery.of(context).size.height*0.1 ,
                decoration: BoxDecoration(
                    border:Border.all(
                      color: Colors.grey,
                      width: 1,
                    )
                ),
                child:Row(
                  children: [
                    Icon(Icons.phone_outlined,size:40,),

                  ],
                ),
              ),




            ],
          ),
        ),
      ),
    );
  }
}
