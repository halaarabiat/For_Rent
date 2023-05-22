import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:rent/config/current_session.dart';
import 'package:ionicons/ionicons.dart';
import 'package:rent/home_screen.dart';
import 'package:rent/models/post_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:rent/post/details/post_details_screen.dart';

import '../liked_post_screen.dart';
import '../details/fav_post_details.dart';

class UserPost extends StatefulWidget {
  final List<PostFormModel> models;

  UserPost({Key? key, required this.models}) : super(key: key);

  void selectPost(PostFormModel post) {
    // Navigate to a new screen to display the selected post
    Navigator.push(
      context as BuildContext,
      MaterialPageRoute(
        builder: (context) => PostDetailsUser(model: post),
      ),
    );
  }

  @override
  _UserPostState createState() => _UserPostState();
}

class _UserPostState extends State<UserPost> {
  bool isSwatch = false;

  void selectPost(PostFormModel post) {
    Navigator.push(
      context as BuildContext,
      MaterialPageRoute(
        builder: (context) => PostDetailsUser(model: post),
      ),
    );
  }

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
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: widget.models.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () => selectPost(widget.models[index]),
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
                                    child: CarouselSlider(
                                      options: CarouselOptions(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.305,
                                        enlargeCenterPage: true,
                                        enableInfiniteScroll: false,
                                        viewportFraction: 1.00,
                                        autoPlay: true,
                                        autoPlayInterval:
                                            const Duration(seconds: 4),
                                        autoPlayAnimationDuration:
                                            const Duration(milliseconds: 800),
                                        autoPlayCurve: Curves.fastOutSlowIn,
                                      ),
                                      items: widget.models[index].images!
                                          .map((image) {
                                        return Image.network(image);
                                      }).toList(),
                                    ),
                                  ),
                                  // Positioned(
                                  //   top: 10,
                                  //   right: 10,
                                  //   child: Transform.scale(
                                  //     scale: 2.0,
                                  //     child: IconButton(
                                  //       onPressed: () {
                                  //         setState(() {
                                  //           widget.models[index].isFav =
                                  //           !widget.models[index].isFav;
                                  //           CurrentSession()
                                  //               .updateFavPosts(widget.models[index]);
                                  //         });
                                  //       },
                                  //       icon: Icon(
                                  //         widget.models[index].isFav
                                  //             ? Icons.favorite
                                  //             : Icons.favorite_border,
                                  //         color: widget.models[index].isFav
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
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              const Icon(
                                                Icons.home_outlined,
                                                size: 30,
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                widget.models[index]
                                                        .propertyType ??
                                                    '',
                                                style: const TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(children: [
                                            const Icon(
                                              Icons.event_seat_outlined,
                                              size: 30,
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              widget.models[index]
                                                      .furnishingStatus ??
                                                  '',
                                              style: const TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            const SizedBox(width: 10),
                                          ]),
                                          Row(
                                            children: [
                                              const Icon(
                                                Ionicons.bed_outline,
                                                size: 30,
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                widget.models[index].rooms
                                                        .toString() ??
                                                    '',
                                                style: const TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(children: [
                                            const Icon(
                                              Icons.location_on_outlined,
                                              size: 40,
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              widget.models[index]
                                                      .neighborhood ??
                                                  '',
                                              style: const TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ]),
                                          Row(children: [
                                            const Icon(
                                              Icons.attach_money,
                                              size: 40,
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              widget.models[index].price
                                                      .toString() ??
                                                  '',
                                              style: const TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
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
          ),
        ],
      ),
    );
  }
}
