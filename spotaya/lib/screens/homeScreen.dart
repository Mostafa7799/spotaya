// ignore: file_names
// ignore_for_file: unused_import, prefer_const_constructors, use_key_in_widget_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:spotaya/Plan/data/models/zones_model.dart';
import 'package:spotaya/originalpoint.dart';
import 'package:spotaya/widgets/auth_form.dart';

import '../core/const/app_const.dart';
import '../widgets/custom_text_feild.dart';
import 'Menu.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();

  String selectedCity = 'Nasr City';
  String selectedLong = '31.3301076';
  String selectedLat = '30.0566104';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome to spotaya'),
      ),
      backgroundColor: Color.fromARGB(255, 40, 39, 39),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
          child: ListView(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Welcome to Spotaya \n   Choose location',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.5,
                ),
              ),
              Container(
                padding: EdgeInsets.all(8),
                margin: EdgeInsets.symmetric(horizontal: 8, vertical: 35),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0),
                  border: Border.all(style: BorderStyle.solid, width: 0.80),
                ),
                child: Center(
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<Map<String, dynamic>>(
                      value: zones
                          .firstWhere((zone) => zone['city'] == selectedCity),
                      items: zones.map((zone) {
                        return DropdownMenuItem<Map<String, dynamic>>(
                          value: zone,
                          child: Text(
                            zone['city'],
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (zone) {
                        setState(() {
                          selectedCity = zone!['city'];
                          selectedLong = zone['long'];
                          selectedLat = zone['lat'];
                        });
                      },
                    ),
                  ),
                ),
              ),
              CustomTextFormField(
                controller: startDateController,
                onTap: () async {
                  TimeOfDay? selectedTime = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );
                  setState(() {
                    startDateController.text =
                        '${selectedTime!.hour}:${selectedTime.minute}:00';
                  });
                },
                hintText: 'Select Start Date',
                textInputType: TextInputType.text,
                prefixIcon: Icons.access_time_outlined,
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextFormField(
                controller: endDateController,
                onTap: () async {
                  TimeOfDay? selectedTime = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );
                  setState(() {
                    endDateController.text =
                        '${selectedTime!.hour}:${selectedTime.minute}:00';
                  });
                },
                hintText: 'Select End Date',
                textInputType: TextInputType.text,
                prefixIcon: Icons.access_time_outlined,
              ),
              SizedBox(
                height: 30,
              ),
              OriginalButton(
                text: 'Next',
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return Menu(
                      city: selectedCity,
                      longitude: selectedLong,
                      latitude: selectedLat,
                      startTime: startDateController.text,
                      endTime: endDateController.text,
                    );
                  },
                )),
                textColor: Colors.white,
                bgColor: Color.fromARGB(255, 40, 39, 39),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
