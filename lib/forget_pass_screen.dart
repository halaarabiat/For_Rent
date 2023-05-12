import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:regexpattern/regexpattern.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rent/login_screen.dart';

final _auth = FirebaseAuth.instance;

class ForgetPassScreen extends StatefulWidget {
  const ForgetPassScreen({Key? key}) : super(key: key);

  @override
  State<ForgetPassScreen> createState() => _ForgetPassScreenState();
}

class _ForgetPassScreenState extends State<ForgetPassScreen> {
  final _key = GlobalKey<FormState>();
  final TextEditingController _EmailController = TextEditingController();

  @override
  void dispose() {
    _EmailController.dispose();
    super.dispose();
  }

  Future<void> PasswordReset(BuildContext context) async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _EmailController.text.trim());
      showDialog(
          context: context,
          builder: (context) {
            return const AlertDialog(
              content: Text('Password reset link sent ! \n CHECK YOUR EMAIL'),
            );
          });
    } on FirebaseAuthException catch (e) {
      print(e);
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(e.message.toString()),
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Form(
                key: _key,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/logo.png",
                          width: 150,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Text(
                      "Enter Your Email and we will send you a password  reset link",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                              width: 3, color: Color(0xff79698e)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                              width: 3, color: Color(0xff79698e)),
                        ),
                        enabled: true,
                        fillColor: Colors.black12,
                        filled: true,
                        prefixIcon: const Icon(
                          Icons.mail_outline,
                          color: Color(0xff79698e),
                        ),
                        labelText: "E-mail",
                        labelStyle: const TextStyle(color: Colors.black38),
                      ),
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.emailAddress,

                      //controller for receive data
                      controller: _EmailController,

                      // validate input
                      validator: (value) {
                        if (value!.isEmpty) {
                          return ("This field is required");
                        }
                        if (!value.isEmail()) {
                          return ("This is not a valid email");
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          PasswordReset(context);
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32.0)),
                          minimumSize: const Size(250, 50),
                        ),
                        child: const Text(
                          "Reset Password",
                          style: TextStyle(fontSize: 20),
                        )),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
