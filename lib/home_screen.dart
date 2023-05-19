import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'NavBar.dart';
import 'post/form_post_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  final _key = GlobalKey<FormState>();
  late String _selectedOption;

  List <String> cities=[
    'Amman',
    'Al-balqa',
    'Zarqa',
    'Madaba',
    'Ma\'an',
    'Aqaba',
    'Al-Karak',
    'at-Tafila',
    'Jerash',
    'Irbid',
    'Ajloun',
    'al-mafraq'];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xff79698e),

            title: Row(
               mainAxisAlignment: MainAxisAlignment.center,
                children: [
            Container(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              'assets/logo.png',
              height:MediaQuery.of(context).size.height*0.07,

              //alignment: Alignment.center,
            ),
          ),
            ],
            ),
             actions: [
            //   Image.asset("assets/test.png")


               IconButton(onPressed: (){
                 Navigator.push(
                     context,
                     MaterialPageRoute(
                         builder: (context) => const FormPostScreen()));
               }, icon: const Icon(Icons.add,
               color: Colors.black,),
               tooltip: 'Add New Post',)
             ],

           ),

          drawer: const NavBar(),


      body: Form(
        key: _key,
        child: Center(
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  "assets/home_screen_image.png",
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.3,
                left: MediaQuery.of(context).size.width * 0.10,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.11,
                  width: MediaQuery.of(context).size.width * 0.8,
                  color: Colors.grey.withOpacity(0.7),
                  padding: const EdgeInsets.all(16.0),
                  child: Autocomplete(optionsBuilder: (TextEditingValue textEditingValue) {
                    if (textEditingValue.text == '') {
                      return const Iterable<String>.empty();
                    }else{
                      List<String> matches = <String>[];
                      matches.addAll(cities);

                      matches.retainWhere((s){
                        return s.toLowerCase().contains(textEditingValue.text.toLowerCase());
                      });
                      return matches;
                    }
                  },
                    onSelected: (String value) {
                      setState(() {
                        _selectedOption = value;
                      });
                    },
                    fieldViewBuilder: (BuildContext context, TextEditingController textEditingController, FocusNode focusNode, VoidCallback onFieldSubmitted) {
                      _searchController.value = textEditingController.value;
                      return TextFormField(
                        controller: textEditingController,
                        focusNode: focusNode,
                        onChanged: (String value) {
                          onFieldSubmitted();
                        },
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xff79698e),
                                  width: 3,
                                ),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xff79698e),
                                  width: 3,
                                ),
                              ),
                              enabled: true,
                              fillColor: Colors.white70,
                              filled: true,
                              hintText: "search by city ",
                              contentPadding: const EdgeInsets.all(5.0),
                              hintStyle: const TextStyle(fontSize: 15),
                              suffixIcon: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.search,
                                  color: Color(0xff79698e),
                                ),
                              ),
                            ),
                          );
                    },
    optionsViewBuilder: (BuildContext context, AutocompleteOnSelected<String> onSelected, Iterable<String> options) {
                    return Align(
                        alignment: Alignment.topLeft,
                        child: Material(
                        elevation: 2.0,
                        child: Container(
                        width: double.infinity,
                        color: Colors.white,
                        child: ListView(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        children: options.map((String option) {
                      return ListTile(
                        title: Text(option),
                        onTap: () {
                          onSelected(option);
                        },
                      );
                    }).toList(),
      ))));
    },
                  ),
                  // child: TextFormField(
                  //   decoration: InputDecoration(
                  //     border: const OutlineInputBorder(
                  //       borderSide: BorderSide(
                  //         color: Color(0xff79698e),
                  //         width: 3,
                  //       ),
                  //     ),
                  //     focusedBorder: const OutlineInputBorder(
                  //       borderSide: BorderSide(
                  //         color: Color(0xff79698e),
                  //         width: 3,
                  //       ),
                  //     ),
                  //     enabled: true,
                  //     fillColor: Colors.white70,
                  //     filled: true,
                  //     hintText: "search by city or neighborhood",
                  //     contentPadding: const EdgeInsets.all(5.0),
                  //     hintStyle: const TextStyle(fontSize: 15),
                  //     suffixIcon: IconButton(
                  //       onPressed: () {},
                  //       icon: const Icon(
                  //         Icons.search,
                  //         color: Color(0xff79698e),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.15,
                right: MediaQuery.of(context).size.width * 0.17,
                child: Container(
                  height: 98,
                  width: 250,
                  color: Colors.grey.withOpacity(0.7),
                  child: Column(
                    children: const [
                      SizedBox(height: 10),
                      Text(
                        "Find your perfect home!",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Houses, Apartments, and Student Studios that fit your lifestyle.",
                        style: TextStyle(fontSize: 15),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      ),
        );

  }
}
