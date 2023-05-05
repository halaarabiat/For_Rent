import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:regexpattern/regexpattern.dart';
import 'package:rent/forget_pass_screen.dart';
import 'package:rent/models.dart';
import 'package:rent/post_screen.dart';
import 'package:rent/signin_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:rent/home_screen.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final _key = GlobalKey<FormState>();
  bool _isObscureText = false;
  final TextEditingController _UserNameController = TextEditingController();
  final TextEditingController _PasswordController = TextEditingController();
  final _auth = FirebaseAuth.instance;
  late SharedPreferences sharedPreferences;

  late String _errorMessage;
  final FocusNode _UserNameFocuse = FocusNode();
  final FocusNode _PasswordFocuse = FocusNode();

  String? get result => null;

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
                          "Welcome",
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
                        } else if (value.isUsername()) {
                          return ("This is not a valid username");
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
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
                          color:Color(0xff79698e),
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
                          return ("This is an easy password");
                        } else {
                          return null;
                        }
                      },
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                      TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const ForgetPassScreen()));

                          },
                          child: const Text(
                            "Forget your password ? ",
                            style: TextStyle(
                              color: Color(0xff79698e),
                              fontSize: 12,
                            ),
                          )),
                    ]),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                        onPressed: () async {
                          if( _key.currentState!.validate()){
                            print(_UserNameController.text);
                            print(_PasswordController.text);


                            if(_UserNameController.text.isEmpty){
                              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content:
                              Text("user is still empty "),
                              ));
                            }else if (_PasswordController.text.isEmpty){
                              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content:
                              Text("password is still empty "),
                              ));
                            } else{
                              QuerySnapshot snap =await FirebaseFirestore .instance.collection("users").
                              where("username",isEqualTo:_UserNameController.text.trim() ).get();

                              try {
                                if(_PasswordController.text == snap.docs[0]['password']){
                                  sharedPreferences =await SharedPreferences.getInstance();
                                  sharedPreferences.setString('username', _UserNameController.text).
                                  then((_) => {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => const  HomeScreen()))
                                  });

                                }
                                else{
                                  ScaffoldMessenger.of(context).showSnackBar( SnackBar(content:
                                  Text("password is not correct "),
                                  ));
                                }
                              }
                              catch(e){

                                String error="";
                                print(e.toString());
                                if(e.toString() =="RangeError (index): Invalid value: Valid value range is empty: 0"){
                                  setState(() {
                                    error = "user name does not exists";
                                  });

                                }else {

                                  setState(() {
                                    error = "error occured";
                                  });
                                }
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content:
                                    Text(error),
                                    ));

                              }

                            }

                          }

                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white, backgroundColor: const Color(0xff79698e),
                          // Text Color (Foreground color)
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32.0)),
                          minimumSize: const Size(300, 40),
                        ),
                        child: const Text(
                          'Log In ',
                          style: TextStyle(fontSize: 30),
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    const Divider(
                      thickness: 1,
                      color: Color(0xff79698e),
                      endIndent: 10,
                      indent: 10,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("You don't have account ?"),
                        TextButton(
                            onPressed: () async {Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SignInScreen()));
                            setState(() {
                              _UserNameController.text = result!;
                            });
                            },
                            child: const Text(
                              "Sign Up ",
                              style: TextStyle(
                                color: Color(0xff79698e),
                              ),
                            )),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }}
