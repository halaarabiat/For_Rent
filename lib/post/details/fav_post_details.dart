import 'package:flutter/material.dart';
import 'package:rent/home_screen.dart';
import 'package:ionicons/ionicons.dart';
import 'package:rent/models/post_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import '../../config/current_session.dart';

class PostDetails extends StatefulWidget {
  final PostFormModel models;

  const PostDetails({Key? key, required this.models}) : super(key: key);

  @override
  State<PostDetails> createState() => _PostDetailsState();
}

class _PostDetailsState extends State<PostDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff79698e),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()));
            },
            icon: const Icon(
              Ionicons.close_circle_outline,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  height: MediaQuery.of(context).size.height * 0.305,
                  enlargeCenterPage: true,
                  enableInfiniteScroll: false,
                  viewportFraction: 0.70,
                ),
                items: widget.models.images!.map((image) {
                  return Image.network(image);
                }).toList(),
              ),

              const SizedBox(
                height: 14,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Shimmer(
                    color: Color(0xff79698e),
                    duration: Duration(seconds: 3),
                    interval: Duration(seconds: 5),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 7,
                      margin: const EdgeInsets.all(10),
                      child: SizedBox(
                        height: 50,
                        width: 150,
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: Row(
                            children: [
                              const Icon(
                                Icons.home_outlined,
                                size: 35,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                widget.models.propertyType ?? '',
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Shimmer(
                    color: Color(0xff79698e),
                    duration: Duration(seconds: 3),
                    interval: Duration(seconds: 5),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 7,
                      margin: const EdgeInsets.all(10),
                      child: SizedBox(
                        height: 50,
                        width: 150,
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: Row(
                            children: [
                              const Icon(
                                Icons.event_seat_outlined,
                                size: 30,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                widget.models.furnishingStatus ?? '',
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              // SizedBox(height:5 ,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Shimmer(
                    color: Color(0xff79698e),
                    duration: Duration(seconds: 3),
                    interval: Duration(seconds: 5),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 7,
                      margin: const EdgeInsets.all(10),
                      child: SizedBox(
                        height: 100,
                        width: 100,
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.space_bar_outlined,
                                size: 40,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                widget.models.flat.toString() ?? '',
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Text(
                                ' m²',
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Shimmer(
                    color: Color(0xff79698e),
                    duration: Duration(seconds: 3),
                    interval: Duration(seconds: 5),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 7,
                      margin: const EdgeInsets.all(10),
                      child: SizedBox(
                        height: 100,
                        width: 100,
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Ionicons.bed_outline,
                                size: 40,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                widget.models.rooms.toString() ?? '',
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              // SizedBox(height: 5 ,),
                              const Text("Room"),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Shimmer(
                    color: Color(0xff79698e),
                    duration: Duration(seconds: 3),
                    interval: Duration(seconds: 5),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 7,
                      margin: const EdgeInsets.all(10),
                      child: SizedBox(
                        height: 100,
                        width: 100,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.bathtub,
                              size: 40,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              widget.models.bathrooms.toString() ?? '',
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Text("bathroom"),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text("parking",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w700)),
                      Shimmer(
                        color: Color(0xff79698e),
                        duration: Duration(seconds: 3),
                        interval: Duration(seconds: 5),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          elevation: 7,
                          margin: const EdgeInsets.all(10),
                          child: SizedBox(
                            height: 70,
                            width: 55,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.local_parking_outlined,
                                  size: 30,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                widget.models.parking
                                    ? const Icon(
                                        Icons.check,
                                        color: Colors.green,
                                      )
                                    : const Icon(
                                        Icons.close,
                                        color: Colors.red,
                                      ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text("Garden",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w700)),
                      Shimmer(
                        color: Color(0xff79698e),
                        duration: Duration(seconds: 3),
                        interval: Duration(seconds: 5),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          elevation: 7,
                          margin: const EdgeInsets.all(10),
                          child: SizedBox(
                            height: 70,
                            width: 55,
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.5,
                              child: Column(
                                // mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.park_outlined,
                                    size: 30,
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  widget.models.garden
                                      ? const Icon(
                                          Icons.check,
                                          color: Colors.green,
                                        )
                                      : const Icon(
                                          Icons.close,
                                          color: Colors.red,
                                        ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text("Balcony",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w700)),
                      Shimmer(
                        color: Color(0xff79698e),
                        duration: Duration(seconds: 3),
                        interval: Duration(seconds: 5),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          elevation: 7,
                          margin: const EdgeInsets.all(10),
                          child: SizedBox(
                            height: 70,
                            width: 55,
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.5,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.balcony_outlined,
                                    size: 30,
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  widget.models.balcony
                                      ? const Icon(
                                          Icons.check,
                                          color: Colors.green,
                                        )
                                      : const Icon(
                                          Icons.close,
                                          color: Colors.red,
                                        ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text("Elevator",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w700)),
                      Shimmer(
                        color: Color(0xff79698e),
                        duration: Duration(seconds: 3),
                        interval: Duration(seconds: 5),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          elevation: 7,
                          margin: const EdgeInsets.all(10),
                          child: SizedBox(
                            height: 70,
                            width: 55,
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.5,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.elevator_outlined,
                                    size: 30,
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  widget.models.elevator
                                      ? const Icon(
                                          Icons.check,
                                          color: Colors.green,
                                        )
                                      : const Icon(
                                          Icons.close,
                                          color: Colors.red,
                                        ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text("Facilities",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w700)),
                      Shimmer(
                        color: Color(0xff79698e),
                        duration: Duration(seconds: 3),
                        interval: Duration(seconds: 5),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          elevation: 7,
                          margin: const EdgeInsets.all(10),
                          child: SizedBox(
                            height: 70,
                            width: 55,
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.5,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.wheelchair_pickup_outlined,
                                    size: 30,
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  widget.models.facilities
                                      ? const Icon(
                                          Icons.check,
                                          color: Colors.green,
                                        )
                                      : const Icon(
                                          Icons.close,
                                          color: Colors.red,
                                        ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),

              Shimmer(
                color: Color(0xff79698e),
                duration: Duration(seconds: 3),
                interval: Duration(seconds: 5),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: 7,
                  margin: const EdgeInsets.all(10),
                  child: SizedBox(
                    height: 70,
                    width: double.infinity,
                    child: Row(
                      children: [
                        const Icon(
                          Icons.location_on_outlined,
                          size: 40,
                        ),
                        Text(
                          widget.models.neighborhood ?? '',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          widget.models.governorate ?? '',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          widget.models.country ?? '',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(
                height: 10,
              ),
              Shimmer(
                color: Color(0xff79698e),
                duration: Duration(seconds: 3),
                interval: Duration(seconds: 5),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: 7,
                  margin: const EdgeInsets.all(10),
                  child: SizedBox(
                    height: 70,
                    width: double.infinity,
                    child: Row(
                      children: [
                        const Icon(
                          Icons.attach_money_outlined,
                          size: 40,
                        ),
                        Text(widget.models.price.toString() ?? '',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ))
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(
                height: 10,
              ),
              Shimmer(
                color: Color(0xff79698e),
                duration: Duration(seconds: 3),
                interval: Duration(seconds: 5),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: 7,
                  margin: const EdgeInsets.all(10),
                  child: SizedBox(
                    height: 70,
                    width: double.infinity,
                    child: Row(
                      children: [
                        const Icon(
                          Icons.phone_outlined,
                          size: 40,
                        ),
                        Text(widget.models.phoneNumber ?? '',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ))
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Description',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Shimmer(
                color: Color(0xff79698e),
                duration: Duration(seconds: 3),
                interval: Duration(seconds: 5),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: 7,
                  margin: const EdgeInsets.all(10),
                  child: SizedBox(
                    height: 200,
                    width: double.infinity,
                    child: Text(widget.models.description ?? '',
                        maxLines: 6,
                        style: const TextStyle(
                          fontSize: 20,
                          overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
