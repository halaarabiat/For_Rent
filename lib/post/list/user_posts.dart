import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:ionicons/ionicons.dart';
import 'package:rent/config/current_session.dart';
import 'package:rent/home_screen.dart';
import 'package:rent/models/post_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:rent/register/login_screen.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

import '../details/post_details_screen.dart';

class UserPost extends StatefulWidget {

  List<PostFormModel> models;

  UserPost({Key? key, required this.models}) : super(key: key);

  @override
  _UserPostState createState() => _UserPostState();
}

class _UserPostState extends State<UserPost> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff79698e),
    title: const Text('Your Posts'),
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
                    return Shimmer(
                      color: Color(0xff79698e),
                      duration: Duration(seconds: 3),
                      interval: Duration(seconds: 8),
                      child: InkWell(
                        onTap: () async {
                          var navResult = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  PostDetailsUser(models: widget.models[index]),
                            ),
                          );
                          if (navResult != null && navResult == true) {
                            CollectionReference postRef =
                                FirebaseFirestore.instance.collection("post");
                            var result = await postRef
                                .where("userId",
                                    isEqualTo: CurrentSession().user!.userid)
                                .get();
                            List<PostFormModel> models = [];
                            for (var item in result.docs) {
                              var model = PostFormModel.fromMap(
                                  item.data() as Map<String, dynamic>);
                              model.documentId = item.reference.id;
                              models.add(model);
                            }
                            setState(() {
                              widget.models = models;
                            });
                          }
                        },
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
