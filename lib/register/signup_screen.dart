// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:regexpattern/regexpattern.dart';
import 'package:rent/home_screen.dart';
import 'package:rent/register/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rent/models/user_model.dart';
import 'package:rent/utils/common_views.dart';

import '../utils/progress_hud.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _key = GlobalKey<FormState>();
  bool _isObscureText = false;
  final TextEditingController _FullNameController = TextEditingController();
  final TextEditingController _EmailController = TextEditingController();
  final TextEditingController _UserNameController = TextEditingController();
  final TextEditingController _PasswordController = TextEditingController();

// final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FocusNode _FullNameFocuse = FocusNode();
  final FocusNode _EmailFocuse = FocusNode();
  final FocusNode _UserNameFocuse = FocusNode();
  final FocusNode _PasswordFocuse = FocusNode();

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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Text(
                          "Hello there,",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(
                      height: 10,
                    ),

                    //text field for full name
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
                          Icons.verified_user_outlined,
                          color: Color(0xff79698e),
                        ),
                        labelText: "Full Name",
                        labelStyle: const TextStyle(color: Colors.black38),
                      ),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.name,
                      //controller for receive data
                      controller: _FullNameController,

                      //focus node
                      focusNode: _FullNameFocuse,
                      onFieldSubmitted: (String value) {
                        FocusScope.of(context).requestFocus(_EmailFocuse);
                        _EmailFocuse.requestFocus();
                      },

                      validator: (value) {
                        if (value!.isEmpty) {
                          return ("This Field is required");
                        } else {
                          return null;
                        }
                      },
                    ),

                    const SizedBox(
                      height: 10,
                    ),

                    //text field for email
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
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                      //controller for receive data
                      controller: _EmailController,
                      //focuse node
                      focusNode: _EmailFocuse,
                      onFieldSubmitted: (String value) {
                        FocusScope.of(context).requestFocus(_UserNameFocuse);
                        _UserNameFocuse.requestFocus();
                      },

                      //validate input
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return ("This field is required");
                        }
                        if (!value.trim().isEmail()) {
                          return ("This is not a valid email");
                        } else {
                          return null;
                        }
                      },
                    ),

                    const SizedBox(
                      height: 10,
                    ),

                    //text field for user name
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
                          Icons.account_circle_outlined,
                          color: Color(0xff79698e),
                        ),
                        labelText: "Username",
                        labelStyle: const TextStyle(color: Colors.black38),
                      ),
                      textInputAction: TextInputAction.next,

                      //controller for receive data
                      controller: _UserNameController,

                      //focus node
                      focusNode: _UserNameFocuse,
                      onFieldSubmitted: (String value) {
                        FocusScope.of(context).requestFocus(_PasswordFocuse);
                        _PasswordFocuse.requestFocus();
                      },

                      validator: (value) {
                        if (value!.isEmpty) {
                          return ("This Field is required");
                        } else if (!value.isUsername()) {
                          return ("This is not a valid username");
                        } else {
                          return null;
                        }
                      },
                    ),

                    const SizedBox(
                      height: 10,
                    ),

                    //text field for password
                    TextFormField(
                      obscureText: !_isObscureText,
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
                        suffixIcon: IconButton(
                            icon: Icon(_isObscureText
                                ? Icons.remove_red_eye
                                : Icons.visibility_off),
                            onPressed: () {
                              setState(() {
                                _isObscureText = !_isObscureText;
                              });
                            }),
                        prefixIcon: const Icon(
                          Icons.lock_outline,
                          color: Color(0xff79698e),
                        ),
                        labelText: "Password",
                        labelStyle: const TextStyle(color: Colors.black38),
                      ),
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.visiblePassword,
                      //controller for receive data
                      controller: _PasswordController,

                      //focus node
                      focusNode: _PasswordFocuse,

                      validator: (value) {
                        if (value!.isEmpty) {
                          return ("This Field is required");
                        } else if (!value.isPasswordHard()) {
                          return "This is an easy password Must contains at least:  "
                              "\n 1 uppercase letter, 1 lowecase letter, 1 number, "
                              "\n & 1 special character";
                          //        textAlign: TextAlign.center,
                          //    ),);
                        } else {
                          return null;
                        }
                      },
                    ),

                    const SizedBox(
                      height: 20,
                    ),

                    ElevatedButton(
                      onPressed: () async {
                        if (_key.currentState!.validate()) {
                          try {
                            ProgressHud.shared.startLoading(context);

                            final userCredential = await FirebaseAuth.instance
                                .createUserWithEmailAndPassword(
                                    email: _EmailController.text.trim(),
                                    password: _PasswordController.text);
                            CollectionReference usersRef =
                                FirebaseFirestore.instance.collection("users");
                            String userId = userCredential.user!.uid;
                            UserModel model = UserModel(
                                password: _PasswordController.text,
                                email: _EmailController.text,
                                fullname: _FullNameController.text,
                                userid: userId,
                                username: _UserNameController.text);
                            await usersRef.add(model.toMap());
                            ProgressHud.shared.stopLoading();
                            CommonViews()
                                .showToast(context, "تم تسجيل الحساب بنجاح");
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LogInScreen()));
                          } catch (e) {
                            ProgressHud.shared.stopLoading();
                            if (e is FirebaseAuthException) {
                              String msg = _getAuthErrorMessage(e.code);
                              CommonViews().showToast(context, msg,
                                  type: TBAlertType.error);
                            } else if (e is FirebaseException) {
                              CommonViews().showToast(context, e.message ?? '',
                                  type: TBAlertType.error);
                            } else {
                              CommonViews().showToast(context,
                                  "Something went wrong please try again later",
                                  type: TBAlertType.error);
                            }
                          }
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        primary: const Color(0xff79698e),
                        // Background color
                        onPrimary: Colors.white,
                        // Text Color (Foreground color)

                        foregroundColor: Colors.white70,
                        // Text Color (Foreground color)
                        backgroundColor: Color(0xff79698e),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32.0)),
                        minimumSize: const Size(300, 40),
                      ),
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(fontSize: 30),
                      ),
                    ),

                    const SizedBox(
                      height: 10,
                    ),

                    const Divider(
                      thickness: 1,
                      color: Color(0xff79698e),
                      endIndent: 10,
                      indent: 10,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("You already have an account ?"),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const LogInScreen()));
                            },
                            child: const Text(
                              "Log In ",
                              style: TextStyle(
                                color: Color(0xff79698e),
                              ),
                            )),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  String _getAuthErrorMessage(String code) {
    switch (code) {
      case "email-already-in-use":
        return "This Email is Already exist";
      case "invalid-email":
        return "Invalid Email";
      case "operation-not-allowed":
        return "Please call us on 079511111";
      default:
        return "Something Went Wrong, please try again later";
    }
  }
}
