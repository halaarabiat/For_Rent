import 'package:flutter/material.dart';
import 'package:rent/photos_upload.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';


//void main() => runApp(const PostScreen());

class PostScreen extends StatefulWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  String? _radiovalue;
  String? _radioValue2;
  final _formKey1 = GlobalKey<FormState>();
  final _formKey = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();

  bool _checkboxValue1 = false;
  bool _checkboxValue2 = false;
  bool _checkboxValue3 = false;
  bool _checkboxValue4 = false;
  bool _checkboxValue5 = false;
  String dropdownValue = 'Jordan';
  String dropdownValue1 = 'Amman';

  @override
  void initState() {
    super.initState();
     _radiovalue = null;
     _radioValue2 = null;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              backgroundColor: const Color(0xff79698e),
              title: Center(
                child: Image.asset(
                  'assets/logo.png',
                  height:MediaQuery.of(context).size.height*0.07,
                  // width: 30,
                ),
              ),
            ),
            body:
            SafeArea(
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        const SizedBox(
                          child: Text(
                            'Please fill all required data',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w800),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Form(
                          key: _formKey1,
                          // autovalidateMode: AutovalidateMode.always,
                          child: Column(
                            children: <Widget>[
                              FormBuilderRadioGroup(
                                onChanged: (value) {
                                  setState(() {
                                    _radiovalue = value; // تحديث القيمة المحددة
                                  });
                                },
                                validator: (value){
                                  if(value==null){
                                    return'pleas fill the required value';
                                  }
                                  else{
                                    return null;
                                  }
                                },
                                orientation: OptionsOrientation.vertical,
                                  activeColor: Color(0xff79698e),
                                  name: "Radio Button ",
                                  options: [
                                    'Home',
                                    'Apartment',
                                    'student Studio'
                                  ].map((lang) => FormBuilderFieldOption(value: lang))
                                      .toList(growable: false),

                              ),

                              const Padding(
                                padding: EdgeInsets.all(8.0),

                              ),
                            ],
                          ),
                        ),
                        Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 8.0, bottom: 8.0),
                                child: Row(
                                  children: [
                                    const Text("Flat: ",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700)),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 112.0),
                                      child: SizedBox(
                                        width: 140,
                                        child: TextFormField(
                                          decoration: const InputDecoration(
                                            labelText: "Enter Value",
                                            labelStyle: TextStyle(fontSize: 10,color: Colors.black38),
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(12.0)),
                                              borderSide: BorderSide(
                                                  width: 2,
                                                  color: Color(0xff79698e)),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(12.0)),
                                              borderSide: BorderSide(width: 3,
                                                  color:Color(0xff79698e) ),
                                            ),
                                            focusColor: Color(0xff79698e),
                                          ),
                                          keyboardType: TextInputType.number,
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'This field is required.';
                                            }
                                            final RegExp regex =
                                                RegExp(r'\d+(\.\d+)?');
                                            if (!regex.hasMatch(value)) {
                                              return 'Please enter a valid number';
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        'm²',
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.black),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 8.0, bottom: 8.0),
                                child: Row(
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(right: 26.0),
                                      child: Text("Number of rooms: ",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,)),
                                    ),
                                    SizedBox(
                                      width: 140,
                                      child: TextFormField(
                                        decoration: const InputDecoration(
                                          labelText: "Number of rooms",
                                          labelStyle: TextStyle(fontSize: 10,
                                          color: Colors.black38),
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(12.0)),
                                            borderSide: BorderSide(
                                                width: 3.0,
                                                color: Color(0xff79698e)),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(12.0)),
                                            borderSide: BorderSide(width: 3,
                                            color:Color(0xff79698e) ),
                                          ),
                                          enabled: true,
                                          //focusColor: Color(0xff79698e),
                                        ),
                                        keyboardType: TextInputType.number,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'This field is required.';
                                          }
                                          final RegExp regex =
                                              RegExp(r'\d+(\.\d+)?');
                                          if (!regex.hasMatch(value)) {
                                            return 'Please enter a valid number';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 8.0, bottom: 8.0),
                                child: Row(
                                  children: [
                                    const Text("Number of Bathrooms:",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700)),
                                    SizedBox(
                                      width: 140,
                                      child: TextFormField(
                                        decoration: const InputDecoration(
                                          labelText: "Number of Bathrooms",
                                          labelStyle: TextStyle(fontSize: 10,
                                          color: Colors.black38),
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(12.0)),
                                            borderSide: BorderSide(
                                                width: 3.0,
                                                color: Color(0xff79698e)),
                                          ),
                                          focusColor: Color(0xff79698e),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(12.0)),
                                            borderSide: BorderSide(width: 3,
                                                color:Color(0xff79698e) ),
                                          ),
                                        ),
                                        keyboardType: TextInputType.number,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'This field is required.';
                                          }
                                          final RegExp regex =
                                              RegExp(r'\d+(\.\d+)?');
                                          if (!regex.hasMatch(value)) {
                                            return 'Please enter a valid number';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Divider(
                                  color: Color(0xff79698e),
                                  thickness: 1,
                                ),
                              ),

                              Form(
                                child: Column(
                                  key: _formKey2,
                                  // autovalidateMode: AutovalidateMode.always,
                                  children: <Widget>[
                                    FormBuilderRadioGroup(
                                      onChanged: (value) {
                                        setState(() {
                                          _radioValue2 = value; // تحديث القيمة المحددة
                                        });
                                      },
                                      validator: (value){
                                        if(value==null){
                                          return'pleas fill the required value';
                                        }
                                        else{
                                          return null;
                                        }
                                      },
                                      orientation: OptionsOrientation.vertical,
                                      activeColor: Color(0xff79698e),
                                      name: "Radio Button2 ",
                                      options: [
                                        'Home',
                                        'Apartment',
                                      ].map((lang) => FormBuilderFieldOption(value: lang))
                                          .toList(growable: false),

                                    ),


                                    // ListTile(
                                    //   title: const Text('Furnished'),
                                    //   leading: Radio<int>(
                                    //     value: 0,
                                    //     groupValue: _radioValue2,
                                    //     onChanged: (int? value) {
                                    //       setState(() {
                                    //         _radioValue2 = value;
                                    //       });
                                    //     },
                                    //   ),
                                    // ),
                                    // ListTile(
                                    //   title: const Text('UnFurnished'),
                                    //   leading: Radio<int>(
                                    //     value: 1,
                                    //     groupValue: _radioValue2,
                                    //     onChanged: (int? value) {
                                    //       setState(() {
                                    //         _radioValue2 = value;
                                    //       });
                                    //     },
                                    //   ),
                                    // ),
                                  ],
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                // child: Divider(
                                //   color: Color(0xff79698e),
                                //   thickness: 1,
                                // ),
                              ),
                              Column(
                                children: [
                                  CheckboxListTile(
                                      title: const Text('Garden'),
                                      value: _checkboxValue1,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          _checkboxValue1 = value!;
                                        });
                                      }),
                                  CheckboxListTile(
                                      title: const Text('Parking'),
                                      value: _checkboxValue2,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          _checkboxValue2 = value!;
                                        });
                                      }),
                                  CheckboxListTile(
                                      title: const Text('Balcony'),
                                      value: _checkboxValue3,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          _checkboxValue3 = value!;
                                        });
                                      }),
                                  CheckboxListTile(
                                      title: const Text('Elevator'),
                                      value: _checkboxValue4,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          _checkboxValue4 = value!;
                                        });
                                      }),
                                  CheckboxListTile(
                                      title: const Text(
                                          'Facilities for people with special needed'),
                                      value: _checkboxValue5,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          _checkboxValue5 = value!;
                                        });
                                      }),
                                  //                         ListTile(
                                  //                           title: const Text('Garden'),leading: CheckboxListTile(value: _checkboxValue1, onChanged: (bool? value) {
                                  //                           setState(() {
                                  //                             _checkboxValue1 = value!;
                                  //                           });
                                  //
                                  //                         })
                                  //
                                  // )
                                ],
                              ),
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Divider(
                                  color: Color(0xff79698e),
                                  thickness: 1,
                                ),
                              ),
                              Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Country',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        SizedBox(
                                          width: 300,
                                          height: 50,
                                          child: Container(
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: const Color(0xff79698e),
                                                width: 1.5,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: DropdownButton<String>(
                                                value: dropdownValue,
                                                onChanged: (String? newValue) {
                                                  setState(() {
                                                    dropdownValue = newValue!;
                                                  });
                                                },
                                                items: <String>[
                                                  'Jordan'
                                                ].map<DropdownMenuItem<String>>(
                                                    (String value) {
                                                  return DropdownMenuItem<
                                                      String>(
                                                    value: value,
                                                    child: Text(value),
                                                  );
                                                }).toList(),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text('Governorate',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w500)),
                                          SizedBox(
                                            width: 300,
                                            height: 50,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color:
                                                      const Color(0xff79698e),
                                                  width: 1.5,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: DropdownButton<String>(
                                                  value: dropdownValue1,
                                                  onChanged:
                                                      (String? newValue) {
                                                    setState(() {
                                                      dropdownValue1 =
                                                          newValue!;
                                                    });
                                                  },
                                                  items: <String>[
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
                                                    'al-mafraq'
                                                  ].map<
                                                          DropdownMenuItem<
                                                              String>>(
                                                      (String value) {
                                                    return DropdownMenuItem<
                                                        String>(
                                                      value: value,
                                                      child: Text(value),
                                                    );
                                                  }).toList(),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text('Neighborhood',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w500)),
                                          SizedBox(
                                              width: 300,
                                              height: 50,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color:
                                                        const Color(0xff79698e),
                                                    width: 1.5,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                child: const TextField(
                                                    decoration: InputDecoration(
                                                  hintText: "Neighborhood",
                                                )),
                                              ))
                                        ]),
                                    const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Divider(
                                        color: Color(0xff79698e),
                                        thickness: 1,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text('Description',
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                            Card(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                // Customize the border radius as needed
                                                side: const BorderSide(
                                                  color: Color(0xff79698e),
                                                  // Specify the border color
                                                  width:
                                                      1.5, // Specify the border width
                                                ),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: TextFormField(
                                                  decoration:
                                                      const InputDecoration(
                                                    hintText:
                                                        "EX:3 bedroom, 1 master, 3 bathroom, with parking for two cars, 2 balcony or garden, first floor, with view...",
                                                  ),
                                                  maxLines: null,
                                                  // Allow the TextFormField to expand vertically
                                                  validator: (value) {
                                                    if (value == null ||
                                                        value.isEmpty) {
                                                      return 'This field is required.';
                                                    }

                                                    final RegExp regex = RegExp(
                                                        r'^(?=.*\d).{80,}$');
                                                    if (!regex
                                                        .hasMatch(value)) {
                                                      return 'Please enter full Description ';
                                                    }

                                                    return null;
                                                  },
                                                ),
                                              ),
                                            )
                                          ]),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text('Phone Number',
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                            SizedBox(
                                                width: 300,
                                                height: 50,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                      color: const Color(
                                                          0xff79698e),
                                                      width: 1.5,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  child: TextFormField(
                                                      decoration:
                                                          const InputDecoration(
                                                        hintText:
                                                            "please enter your valid phone number",
                                                      ),
                                                      keyboardType:
                                                          TextInputType.phone,
                                                      validator: (value) {
                                                        if (value == null ||
                                                            value.isEmpty) {
                                                          return 'This field is required.';
                                                        }
                                                        final RegExp regex =
                                                            RegExp(
                                                                r'^07\d{8}$');
                                                        if (!regex
                                                            .hasMatch(value)) {
                                                          return 'Please enter a valid phone number';
                                                        }

                                                        return null;
                                                      }),
                                                ))
                                          ]),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text('Price',
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                            SizedBox(
                                                width: 300,
                                                height: 50,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                      color: const Color(
                                                          0xff79698e),
                                                      width: 1.5,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  child: TextFormField(
                                                      decoration:
                                                          const InputDecoration(
                                                        hintText:
                                                            "Monthly rental price ",
                                                      ),
                                                      keyboardType:
                                                          TextInputType.number,
                                                      validator: (value) {
                                                        if (value == null ||
                                                            value.isEmpty) {
                                                          return 'This field is required.';
                                                        }
                                                        final RegExp regex =
                                                            RegExp(
                                                                r'\d+(\.\d+)?');
                                                        if (!regex
                                                            .hasMatch(value)) {
                                                          return 'Please enter a valid price';
                                                        }
                                                        return null;
                                                      }),
                                                ))
                                          ]),
                                    )
                                  ]))
                            ]),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const ImageUploadForm()));
                              }
                              if (_formKey1.currentState!.validate()) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const ImageUploadForm()));
                              }

                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => const PhotoUpload()));
                            },
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: const Color(0xff79698e),
                              // Text Color (Foreground color)
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32.0)),
                              minimumSize: const Size(150, 40),
                            ),
                            child: const Text('Next'),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )));
  }
}
