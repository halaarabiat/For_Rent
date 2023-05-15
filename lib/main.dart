import 'dart:async';
import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'package:rent/post/post_screen.dart';
import 'package:rent/register/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp( options: DefaultFirebaseOptions.currentPlatform,);

  runApp(const MyApp());}



class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OKToast(
      child: const MaterialApp(

        home:MyHomePage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  SplashScreenState createState() => SplashScreenState();
}
class SplashScreenState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 4),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) => const BottomSheetApp()
            )
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return FittedBox(
        child:  Image.asset("assets/splash_screen.jpg",)
        , fit: BoxFit.fill );

  }
}

