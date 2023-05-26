import 'package:flutter/material.dart';

class AboutApp extends StatefulWidget {
  const AboutApp({Key? key}) : super(key: key);

  @override
  _AboutAppState createState() => _AboutAppState();
}

class _AboutAppState extends State<AboutApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff79698e),
        title: const Text('About App'),
      ),
      body: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 15,
        margin: const EdgeInsets.all(15),
        child: Container(
            width: double.infinity,
            height: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Image.asset(
                    "assets/logo.png",
                    width: 100,
                    height: 100,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Expanded(
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "4Rent is an innovative application that aims to assist you in finding the perfect home. Whether you are searching for a place to rent or looking to advertise your own property, our platform offers a comprehensive solution.",
                          ),
                          SizedBox(height: 14),
                          Text(
                            "With 4Rent, you can easily browse through a wide range of available properties, filter search results based on your preferences, and connect with property owners or potential tenants. Our goal is to streamline the process of finding or advertising a rental property, making it convenient and efficient for all parties involved.",
                            // style: TextStyle(fontSize: 15),
                          ),
                          SizedBox(height: 14),
                          Text(
                            "Experience the convenience and reliability of 4Rent as we continue to improve and expand our services, ensuring a seamless housing solution for our valued users.",
                            // style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(
                            height: 14,
                          ),
                          Text(
                              "4Rent is proudly built by  Jordanian girls, dedicated to providing an exceptional housing solution for our users."
                              ,style:const TextStyle( fontWeight: FontWeight.bold,) ,
                          ),
                          SizedBox(
                            height: 14,
                          ),
                          Text(
                            "for any Question call us:"
                            ,style:const TextStyle( fontWeight: FontWeight.bold,
                          fontSize: 18) ,
                          ),
                          Text(
                            "Hala Arabiat: +962777174495"
                            ,style:const TextStyle( fontWeight: FontWeight.w500,
                              fontSize: 16) ,
                          ),
                          Text(
                            "Tala Arabiat: +962798124493"
                            ,style:const TextStyle( fontWeight: FontWeight.w500,
                              fontSize: 16) ,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
