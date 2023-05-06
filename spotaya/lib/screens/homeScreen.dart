// ignore: file_names
// ignore_for_file: unused_import, prefer_const_constructors, use_key_in_widget_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:spotaya/originalpoint.dart';
import 'package:spotaya/widgets/auth_form.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> itemsList = [
    'Cairo ,Obour city',
    'Cairo, Naser city ',
    'Cairo, Shrouk ',
    'Cairo, Fifth statment '
  ];
  String? selectedItem = 'Cairo ,Obour city';

  var locationMessage = "";

  void getCurrentLocation() async {
    var position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    var lastPosition = await Geolocator.getLastKnownPosition();
    print(lastPosition);
    setState(() {
      locationMessage = "$position.altitude , $position.longitude";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome to spotaya'),
      ),
      backgroundColor: Color.fromARGB(255, 40, 39, 39),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 80),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Welcome to Spotaya \n   Choose location',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.5,
                  ),
                ),
                SizedBox(
                  height: 60,
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(style: BorderStyle.solid, width: 0.80),
                    ),
                    child: Center(
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: selectedItem,
                          items: itemsList
                              .map((item) => DropdownMenuItem(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ))
                              .toList(),
                          onChanged: (item) {
                            setState(() => selectedItem = item);
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                OriginalButton(
                  text: 'Next',
                  onPressed: () => Navigator.of(context).pushNamed('Menu'),
                  textColor: Colors.white,
                  bgColor: Color.fromARGB(255, 40, 39, 39),
                ),
              ]),
        ),
      ),
    );
  }
}
