import 'package:flutter/material.dart';
import 'package:regexpattern/regexpattern.dart';

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
                          "assets/logo.jpg",
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
                            Navigator.of(context)
                                .pushNamed('/ForgetPassScreen');
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
                        onPressed: () {
                          _key.currentState!.validate();
                          print(_UserNameController.text);
                          print(_PasswordController.text);
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xff79698e),
                          // Background color
                          onPrimary: Colors.white,
                          // Text Color (Foreground color)
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32.0)),
                          minimumSize: Size(300, 40),
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
                            onPressed: () async {
                              String result = await Navigator.of(context)
                                  .pushNamed('/SignInScreen') as String;
                              setState(() {
                                _UserNameController.text = result;
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
  }
}
