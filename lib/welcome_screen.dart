import 'package:flutter/material.dart';
import 'dart:async';

class BottomSheetApp extends StatelessWidget {
  const BottomSheetApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorSchemeSeed: const Color(0xff79698e),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const Scaffold(
        // appBar: AppBar(title:  const Text('4Rent'), actions: [Image.asset(('assets/logo.png'),height:100 ,width:50  )],),
        body: BottomSheetExample(),
      ),
    );
  }
}

class BottomSheetExample extends StatefulWidget {
  const BottomSheetExample({Key? key}) : super(key: key);

  @override
  _BottomSheetExampleState createState() => _BottomSheetExampleState();
}

class _BottomSheetExampleState extends State<BottomSheetExample> {
  bool _showBottomSheet = false;

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      setState(() {
        _showBottomSheet = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/welcome.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          AnimatedPositioned(
            duration: const Duration(seconds: 3),
            curve: Curves.easeIn,
            bottom: _showBottomSheet ? 0 : -400,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 400,
              decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.rectangle,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(35),
                  ),
                  border:
                      Border.all(width: 2.0, color: const Color(0xff79698e))),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/logo.png',
                        height: 100 * 2,
                        width: 50 * 2,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        '4Rent',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 35),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'find your perfect home !',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 20),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Houses , Apartment and Student Studio',
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 15),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'that fit your life style.',
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 15),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 200.0,
                        child: TextButton(
                            child: const Text('Sing Up',
                                style: TextStyle(color: Color(0xffffffff))),
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              backgroundColor: const Color(0xff79698e),

                              // side: const BorderSide(
                              //     width: 2.0, color: Color(0xff79698e))
                            )),
                      )
                    ],
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    const Text('Already have an account?'),
                    TextButton(
                      child: const Text('Log in',
                          style: TextStyle(color: Color(0xff79698e))),
                      onPressed: () {
                        //Navigator.pushReplacement(
                        //                               context,
                        //                               MaterialPageRoute(builder: (context) => const LoginScreen()));
                      },
                    )
                  ])
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
