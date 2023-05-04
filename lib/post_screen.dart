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

  FocusNode _flatFocuse =FocusNode();
  FocusNode _numberOfRoomFocuse = FocusNode();
  FocusNode _numberOfBathroomFocuse = FocusNode();
  FocusNode _descriptionFocuse = FocusNode();
  FocusNode _phoneNumberFocuse = FocusNode();
  FocusNode _priceFocuse = FocusNode();

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
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.07,
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
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Property type:',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),

                        // autovalidateMode: AutovalidateMode.always,
                        Column(
                          children: <Widget>[

                            FormBuilderRadioGroup(
                              autovalidateMode: AutovalidateMode
                                  .onUserInteraction,
                              onChanged: (value) {
                                setState(() {
                                  _radiovalue = value; // تحديث القيمة المحددة
                                });
                              },
                              validator: (value) {
                                if (value == null) {
                                  return 'pleas fill the required value';
                                }
                                else {
                                  return null;
                                }
                              },
                              orientation: OptionsOrientation.vertical,
                              activeColor: const Color(0xff79698e),
                              name: "Radio Button ",
                              options: [
                                'Home',
                                'Apartment',
                                'student Studio'
                              ].map((lang) =>
                                  FormBuilderFieldOption(value: lang))
                                  .toList(growable: false),

                            ),

                            const Padding(
                              padding: EdgeInsets.all(8.0),

                            ),
                          ],
                        ),

                        Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Floorplans:',
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
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
                                            labelStyle: TextStyle(fontSize: 10,
                                                color: Colors.black38),
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
                                                  color: Color(0xff79698e)),
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
                                            textInputAction: TextInputAction.next,
                                            focusNode: _flatFocuse,
                                            onFieldSubmitted:(String value){
                                              FocusScope.of(context).requestFocus(_numberOfRoomFocuse);
                                              _numberOfRoomFocuse.requestFocus();}

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
                                      child: Text("No. of rooms: ",
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
                                                color: Color(0xff79698e)),
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
                                          textInputAction: TextInputAction.next,
                                          focusNode: _numberOfRoomFocuse,
                                          onFieldSubmitted:(String value){
                                            FocusScope.of(context).requestFocus(_numberOfBathroomFocuse);
                                            _numberOfBathroomFocuse.requestFocus();}

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
                                                color: Color(0xff79698e)),
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
                                        textInputAction: TextInputAction.done,
                                        focusNode: _numberOfBathroomFocuse,

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


                              Column(
                                children: <Widget>[
                                  const Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Furnishing Status:',
                                      style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                  FormBuilderRadioGroup(
                                    autovalidateMode: AutovalidateMode
                                        .onUserInteraction,
                                    onChanged: (value) {
                                      setState(() {
                                        _radioValue2 =
                                            value; // تحديث القيمة المحددة
                                      });
                                    },
                                    validator: (value) {
                                      if (value == null) {
                                        return 'pleas fill the required value';
                                      }
                                      else {
                                        return null;
                                      }
                                    },
                                    orientation: OptionsOrientation.vertical,
                                    activeColor: const Color(0xff79698e),
                                    name: "Radio Button2 ",
                                    options: [
                                      'Fully Furnished',
                                      'Unfurnished',
                                      'Partially Furnished',
                                    ].map((lang) =>
                                        FormBuilderFieldOption(value: lang))
                                        .toList(growable: false),

                                  ),


                                ],
                              ),

                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                // child: Divider(
                                //   color: Color(0xff79698e),
                                //   thickness: 1,
                                // ),
                              ),
                              const Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Additional Options:',
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
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

                                ],
                              ),
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Divider(
                                  color: Color(0xff79698e),
                                  thickness: 1,
                                ),
                              ),
                              const Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Location:',
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w700,
                                  ),
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
                                        crossAxisAlignment: CrossAxisAlignment
                                            .start,
                                        children: [
                                          const Text(
                                            'Neighborhood',
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          TextFormField(
                                            decoration: const InputDecoration(
                                              hintText: "Neighborhood",
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
                                                    color: Color(0xff79698e)),
                                              ),
                                              focusColor: Color(0xff79698e),
                                            ),

                                            validator: (value) {
                                              if (value == null || value
                                                  .trim()
                                                  .isEmpty) {
                                                return 'Please enter a neighborhood';
                                              }
                                              return null;
                                            },
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
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment
                                                  .start,
                                              children: [
                                                const Text(
                                                  'Description',
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                Card(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius
                                                        .circular(8.0),
                                                    side: const BorderSide(
                                                      color: Color(0xff79698e),
                                                      width: 1.5,
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                        .all(8.0),
                                                    child: TextFormField(
                                                      decoration: const InputDecoration(
                                                        hintText: "EX:3 bedroom, 1 master, 3 bathroom, with parking for two cars, 2 balcony or garden, first floor, with view...",
                                                      ),
                                                      maxLines: null,
                                                      validator: (value) {
                                                        if (value == null ||
                                                            value.isEmpty) {
                                                          return 'This field is required.';
                                                        }

                                                        final RegExp regex = RegExp(
                                                            r'^(?=.*\d).{80,}$');
                                                        if (!regex.hasMatch(
                                                            value)) {
                                                          return 'Please enter full Description ';
                                                        }

                                                        return null;
                                                      },
                                                        textInputAction: TextInputAction.next,

                                                        focusNode: _descriptionFocuse,
                                                        onFieldSubmitted:(String value){
                                                          FocusScope.of(context).requestFocus(_phoneNumberFocuse);
                                                          _phoneNumberFocuse.requestFocus();}

                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment
                                                  .start,
                                              children: [
                                                const Text(
                                                  'Phone Number',
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                TextFormField(
                                                  decoration: const InputDecoration(
                                                    hintText: "please enter your valid phone number",
                                                    border: OutlineInputBorder(
                                                      borderRadius: BorderRadius
                                                          .all(
                                                          Radius.circular(
                                                              12.0)),
                                                      borderSide: BorderSide(
                                                          width: 2,
                                                          color: Color(
                                                              0xff79698e)),
                                                    ),
                                                    focusedBorder: OutlineInputBorder(
                                                      borderRadius: BorderRadius
                                                          .all(
                                                          Radius.circular(
                                                              12.0)),
                                                      borderSide: BorderSide(
                                                          width: 3,
                                                          color: Color(
                                                              0xff79698e)),
                                                    ),
                                                    focusColor: Color(
                                                        0xff79698e),

                                                  ),
                                                  keyboardType: TextInputType
                                                      .phone,
                                                  validator: (value) {
                                                    if (value == null ||
                                                        value.isEmpty) {
                                                      return 'This field is required.';
                                                    }
                                                    final RegExp regex = RegExp(
                                                        r'^07\d{8}$');
                                                    if (!regex.hasMatch(
                                                        value)) {
                                                      return 'Please enter a valid phone number';
                                                    }
                                                    return null;
                                                  },
                                                    textInputAction: TextInputAction.next,
                                                    focusNode: _phoneNumberFocuse,
                                                    onFieldSubmitted:(String value){
                                                      FocusScope.of(context).requestFocus(_priceFocuse);
                                                      _priceFocuse.requestFocus();}

                                                ),
                                              ],
                                            ),
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
                                                      width: 350,
                                                      height: 50,
                                                      child: TextFormField(
                                                          decoration:
                                                          const InputDecoration(
                                                            hintText:
                                                            "Monthly rental price ",
                                                            border: OutlineInputBorder(
                                                              borderRadius: BorderRadius
                                                                  .all(
                                                                  Radius
                                                                      .circular(
                                                                      12.0)),
                                                              borderSide: BorderSide(
                                                                  width: 2,
                                                                  color: Color(
                                                                      0xff79698e)),
                                                            ),
                                                            focusedBorder: OutlineInputBorder(
                                                              borderRadius: BorderRadius
                                                                  .all(
                                                                  Radius
                                                                      .circular(
                                                                      12.0)),
                                                              borderSide: BorderSide(
                                                                  width: 3,
                                                                  color: Color(
                                                                      0xff79698e)),
                                                            ),
                                                            focusColor: Color(
                                                                0xff79698e),

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
                                                                .hasMatch(
                                                                value)) {
                                                              return 'Please enter a valid price';
                                                            }
                                                            return null;
                                                          },
                                                        textInputAction: TextInputAction.done,
                                                        focusNode: _priceFocuse,
                                                      ))
                                                ]),
                                          )
                                        ])
                                  ])
                              )
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

                              else {}


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
