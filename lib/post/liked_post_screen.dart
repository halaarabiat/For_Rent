import 'package:carousel_slider/carousel_slider.dart';
import 'package:ionicons/ionicons.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:rent/config/current_session.dart';
import 'package:rent/models/post_model.dart';
import 'package:rent/post/details/fav_post_details.dart';
import 'package:rent/post/details/post_details_screen.dart';

class LikedPostsScreen extends StatefulWidget {
  final List<PostFormModel> models;

  const LikedPostsScreen({Key? key, required this.models})
      : super(key: key);

  @override
  State<LikedPostsScreen> createState() => _LikedPostsScreenState();
}

class _LikedPostsScreenState extends State<LikedPostsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff79698e),
        title: const Text('Favorite Posts'),
      ),
      body: ListView.builder(
        itemCount: widget.models.length,
        itemBuilder: (context, index) {
          final post = widget.models[index];

          return InkWell(
            onTap: ()
            {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PostDetails(models: widget.models[index]),
                ),
              );
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
                                  MediaQuery.of(context).size.height * 0.305,
                              enlargeCenterPage: true,
                              enableInfiniteScroll: false,
                              viewportFraction: 1.00,
                              autoPlay: true,
                              autoPlayInterval: const Duration(seconds: 4),
                              autoPlayAnimationDuration:
                                  const Duration(milliseconds: 800),
                              autoPlayCurve: Curves.fastOutSlowIn,
                            ),
                            items: post.images!.map((image) {
                              return Image.network(image);
                            }).toList(),
                          ),
                        ),
                        Positioned(
                          top: 10,
                          right: 10,
                          child: Transform.scale(
                            scale: 2.0,
                            child: IconButton(
                              onPressed: () {
                                setState(() {
                                  widget.models[index].isFav = false;
                                  CurrentSession()
                                      .updateFavPosts(widget.models[index]);
                                  widget.models
                                      .remove(widget.models[index]);
                                });
                              },
                              icon: Icon(
                                post.isFav
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color:
                                    post.isFav ? const Color(0xff79698e) : null,
                              ),
                            ),
                          ),
                        ),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                      post.propertyType ?? '',
                                      style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.event_seat_outlined,
                                      size: 30,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      post.furnishingStatus ?? '',
                                      style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                  ],
                                ),
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
                                      post.rooms.toString() ?? '',
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.location_on_outlined,
                                      size: 40,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      post.neighborhood ?? '',
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.attach_money,
                                      size: 40,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      post.price.toString() ?? '',
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(width: 5),
                                  ],
                                ),
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
        },
      ),
    );
  }

  // void selectPost(PostFormModel post) {
  //   // Navigate to a new screen to display the selected post
  //   Navigator.push(
  //     context as BuildContext,
  //     MaterialPageRoute(
  //       builder: (context) => PostDetailsUser(model: post),
  //     ),
  //   );
  // }
}
