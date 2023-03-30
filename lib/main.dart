import 'dart:async';
import 'package:flutter/material.dart';
import 'package:rent/welcome_screen.dart';
import 'package:rent/forget_pass_screen.dart';
import 'package:rent/signin_screen.dart';
import 'package:rent/login_screen.dart';


void main() { runApp(const MyApp());}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorSchemeSeed: const Color(0xff79698e),

        //primarySwatch: Colors.blue,
      ),
      routes:{
        "/SignInScreen":(context)=>const SignInScreen(),
        "/LogInScreen":(context)=>const LogInScreen(),
        "/ForgetPassScreen":(context)=>const ForgetPassScreen(),
        "/WelcomeScreen":(context)=>const BottomSheetApp(),
      },
      initialRoute: '/WelcomeScreen',
      //home: const ForgetPassScreen(),
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
    Timer(const Duration(seconds: 3),
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
