import 'package:flutter/material.dart';
import 'package:rent/home_screen.dart';
// import 'package:rent/models/post_model.dart';

class PostItem extends StatefulWidget {
  // final PostFormModel model;
  const PostItem({Key? key}) : super(key: key);


  // const PostItem({Key? key, required this.model}) : super(key: key);

  @override
  _PostItemState createState() => _PostItemState();
}

class _PostItemState extends State<PostItem> {
  // bool _isFavorite = false;

  void selectPost() {}

  // void _toggleFavorite() {
  //   setState(() {
  //     _isFavorite = !_isFavorite;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff79698e),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            );
          },
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Spacer(),
            Image.asset(
              'assets/logo.png',
              height: 0.07,
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 1,
            itemBuilder: (context, _) {
              return InkWell(
                onTap: selectPost,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: 7,
                  margin: const EdgeInsets.all(10),
                  child: SizedBox(
                    height: 380,
                    width: double.infinity,
                    child: Column(
                      children: [
                        // first row
                        Stack(
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15),
                              ),
                              child: Container(

                                height: 250,
                                width: double.infinity,
                                color: Colors.grey,
                              ),
                            ),
                            // Positioned(
                            //   top: 10,
                            //   right: 10,
                            //   child: Transform.scale(
                            //     scale: 2.0,
                            //     child: IconButton(
                            //       onPressed: _toggleFavorite,
                            //       icon: Icon(
                            //         _isFavorite
                            //             ? Icons.favorite
                            //             : Icons.favorite_border,
                            //         color: _isFavorite
                            //             ? const Color(0xff79698e)
                            //             : null,
                            //       ),
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),

                        // second row
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.home_outlined,
                                          size: 40,
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        // Text(
                                        //   widget.model.propertyType ?? '',
                                        //   style: const TextStyle(
                                        //     fontSize: 20,
                                        //     fontWeight: FontWeight.bold,
                                        //   ),
                                        // ),
                                      ],
                                    ),
                                    Row(children:  [
                                      const Icon(
                                        Icons.event_seat_outlined,
                                        size: 40,
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      // Text(
                                      //   widget.model.furnishingStatus ?? '',
                                      //   style: const TextStyle(
                                      //     fontSize: 20,
                                      //     fontWeight: FontWeight.bold,
                                      //   ),
                                      // ),

                                      const SizedBox(width: 10),
                                    ]),
                                    Row(
                                      children:  [
                                        // Text(
                                        //   widget.model.rooms.toString() ?? '' ,
                                        //   style: const TextStyle(
                                        //     fontSize: 20,
                                        //     fontWeight: FontWeight.bold,
                                        //   ),
                                        // ),
                                      ],
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(children:  [
                                      const Icon(
                                        Icons.location_on_outlined,
                                        size: 40,
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      // Text(
                                      //   widget.model.neighborhood ?? '' ,
                                      //   style: const TextStyle(
                                      //     fontSize: 20,
                                      //     fontWeight: FontWeight.bold,
                                      //   ),
                                      // ),
                                    ]),
                                    Row(children:  [
                                      const Icon(
                                        Icons.attach_money,
                                        size: 40,
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      // Text(
                                      //   widget.model.price ?? '',
                                      //   style: const TextStyle(
                                      //     fontSize: 20,
                                      //     fontWeight: FontWeight.bold,
                                      //   ),
                                      // ),
                                      const SizedBox(width: 5),
                                    ]),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
