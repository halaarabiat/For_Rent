import 'package:flutter/material.dart';
import 'package:rent/home_screen.dart';
import 'package:ionicons/ionicons.dart';
// import 'package:rent/models/post_model.dart';
import '../../config/current_session.dart';

class FavPostDetails extends StatefulWidget {
  // final PostFormModel model;
  const FavPostDetails({Key? key}) : super(key: key);
  // const PostDetails({Key? key, required this.model}) : super(key: key);

  @override
  State<FavPostDetails> createState() => _FavPostDetailsState();
}

class _FavPostDetailsState extends State<FavPostDetails> {
  bool _isFavorite = false;
  void _toggleFavorite() {
    setState(() {
      _isFavorite = !_isFavorite;
    });
  }

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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      CurrentSession().user?.fullname ?? 'User',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  IconButton(
                    onPressed: _toggleFavorite,
                    icon: Icon(
                      _isFavorite
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: _isFavorite
                          ? const Color(0xff79698e)
                          : null,
                    ),
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.arrow_circle_left_outlined,
                        size: 30,
                      )),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.305,
                    width: MediaQuery.of(context).size.width * 0.70,
                    color: Colors.grey,
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.arrow_circle_right_outlined,
                        size: 30,
                      ))
                ],
              ),
              const SizedBox(
                height: 14,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Card(
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
                          children: const [
                            Icon(
                              Icons.home_outlined,
                              size: 40,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            // Text(  widget.model.propertyType ?? '',
                            //   style: const TextStyle(
                            //     fontSize: 20,
                            //     fontWeight: FontWeight.bold,
                            //   ),),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Card(
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
                          children: const [
                            Icon(
                              Icons.event_seat_outlined,
                              size: 40,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            // Text( widget.model.furnishingStatus ?? '',
                            //   style: const TextStyle(
                            //     fontSize: 20,
                            //     fontWeight: FontWeight.bold,
                            //   ),),
                          ],
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
                  Card(
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
                          children: const [
                            Icon(
                              Icons.space_bar_outlined,
                              size: 40,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            // SizedBox(height: 5 ,),
                            // Text( widget.model.flat.toString() ?? 'm²',
                            //   style: const TextStyle(
                            //     fontSize: 20,
                            //     fontWeight: FontWeight.bold,
                            //   ),),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Card(
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
                          children: const [
                            Icon(
                              Ionicons.bed_outline,
                              size: 40,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            // Text(  widget.model.rooms.toString() ??'',
                            //   style: const TextStyle(
                            //     fontSize: 20,
                            //     fontWeight: FontWeight.bold,
                            //   ),),
                            // SizedBox(height: 5 ,),
                            Text("Room"),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Card(
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
                        children: const [
                          Icon(
                            Icons.bathtub,
                            size: 40,
                          ),
                          // SizedBox(height: 5 ,),
                          //  Text(  widget.model.bathrooms.toString() ?? '',
                          //    style: const TextStyle(
                          //      fontSize: 20,
                          //      fontWeight: FontWeight.bold,
                          //    ),),
                          Text("bathroom"),
                        ],
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
                children: [
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 7,
                    margin: const EdgeInsets.all(10),
                    child: SizedBox(
                      height: 45,
                      width: 45,
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.local_parking_outlined,
                              size: 30,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            // Text( widget.model.parking.toString() ?? '',
                            //   style: const TextStyle(
                            //     fontSize: 20,
                            //     fontWeight: FontWeight.bold,
                            //   ),),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 7,
                    margin: const EdgeInsets.all(10),
                    child: SizedBox(
                      height: 45,
                      width: 45,
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:  const [
                            Icon(
                              Icons.park_outlined,
                              size: 30,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            // Text( widget.model.garden.toString() ?? '',
                            //   style: const TextStyle(
                            //     fontSize: 20,
                            //     fontWeight: FontWeight.bold,
                            //   ),),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 7,
                    margin: const EdgeInsets.all(10),
                    child: SizedBox(
                      height: 45,
                      width: 45,
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:  const [
                            Icon(
                              Icons.balcony_outlined,
                              size: 30,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            // Text( widget.model.balcony.toString() ?? '',
                            //   style: const TextStyle(
                            //     fontSize: 20,
                            //     fontWeight: FontWeight.bold,
                            //   ),),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 7,
                    margin: const EdgeInsets.all(10),
                    child: SizedBox(
                      height: 45,
                      width: 45,
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:  const [
                            Icon(
                              Icons.elevator_outlined,
                              size: 30,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            // Text( widget.model.elevator.toString() ?? '',
                            //   style: const TextStyle(
                            //     fontSize: 20,
                            //     fontWeight: FontWeight.bold,
                            //   ),),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 7,
                    margin: const EdgeInsets.all(10),
                    child: SizedBox(
                      height: 45,
                      width: 45,
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:  const [
                            Icon(
                              Icons.wheelchair_pickup_outlined,
                              size: 30,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            // Text( widget.model.facilities.toString() ?? '',
                            //   style: const TextStyle(
                            //     fontSize: 20,
                            //     fontWeight: FontWeight.bold,
                            //   ),),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),

              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 7,
                margin: const EdgeInsets.all(10),
                child: SizedBox(
                  height: 70,
                  width: double.infinity,
                  child: Row(
                    children: const [
                      Icon(
                        Icons.location_on_outlined,
                        size: 40,
                      ),
                      // Text(
                      //   widget.model.neighborhood ?? '',
                      //   style: const TextStyle(
                      //     fontSize: 20,
                      //     fontWeight: FontWeight.bold,
                      //   ),
                      // ),
                      // Text(
                      //   widget.model.governorate ?? '',
                      //   style: const TextStyle(
                      //     fontSize: 20,
                      //     fontWeight: FontWeight.bold,
                      //   ),
                      // ),
                      // Text(
                      //   widget.model.country ?? '',
                      //   style: const TextStyle(
                      //     fontSize: 20,
                      //     fontWeight: FontWeight.bold,
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),

              const SizedBox(
                height: 10,
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 7,
                margin: const EdgeInsets.all(10),
                child: SizedBox(
                  height: 70,
                  width: double.infinity,
                  child: Row(
                    children: const [
                      Icon(
                        Icons.attach_money_outlined,
                        size: 40,
                      ),
                      // Text(widget.model.price ?? '',
                      //   style: const TextStyle(
                      //     fontSize: 20,
                      //     fontWeight: FontWeight.bold,))
                    ],
                  ),
                ),
              ),

              const SizedBox(
                height: 10,
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 7,
                margin: const EdgeInsets.all(10),
                child: SizedBox(
                  height: 70,
                  width: double.infinity,
                  child: Row(
                    children: const [
                      Icon(
                        Icons.phone_outlined,
                        size: 40,
                      ),
                      // Text(widget.model.phoneNumber ?? '',
                      //     style: const TextStyle(
                      //       fontSize: 20,
                      //       fontWeight: FontWeight.bold,))
                    ],
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
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 7,
                margin: const EdgeInsets.all(10),
                child: SizedBox(
                  height: 200,
                  width: double.infinity,
                  child: Row(
                    children: const [
                      // Text(widget.model.description ?? '',
                      //     style: const TextStyle(
                      //       fontSize: 20,
                      //       fontWeight: FontWeight.bold,))
                    ],
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
