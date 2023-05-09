// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotaya/Plan/data/models/places_filters.dart';
import 'package:spotaya/Plan/presentation/bloc/plan_bloc.dart';
import 'package:spotaya/Plan/presentation/screens/plan_scressn.dart';
import 'package:spotaya/screens/plans.dart';
import 'package:spotaya/screens/Profile.dart';

import '../Plan/presentation/widget/type_card_widget.dart';
import '../originalpoint.dart';

class Menu extends StatefulWidget {
  const Menu({
    Key? key,
    this.city,
    this.longitude,
    this.latitude,
    this.startTime,
    this.endTime,
  }) : super(key: key);
  final String? city;
  final String? longitude;
  final String? latitude;
  final String? startTime;
  final String? endTime;

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      switch (_selectedIndex) {
        case 0:
          Navigator.of(context).push(MaterialPageRoute(builder: (_) => Menu()));
          break;
        case 1:
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => Plans()));
          break;
        case 2:
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => Profile()));
          break;
      }
    });
  }

  /// Check Variable
  bool foodCheck = false;
  bool cafeCheck = false;
  bool entertainmentCheck = false;
  bool shoppingCheck = false;
  bool sportsCheck = false;
  bool fitnessCheck = false;
  List<String> types = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu'),
      ),
      backgroundColor: Color.fromARGB(255, 40, 39, 39),
      body: SafeArea(
        child: ListView(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: Wrap(
                  spacing: 20.0,
                  runSpacing: 20.0,
                  children: [
                    CustomCardWidget(
                      isChecked: foodCheck,
                      onPressed: () {
                        setState(() {
                          foodCheck = !foodCheck;
                          types.add('meal_takeaway');
                        });
                      },
                      title: 'Food',
                    ),
                    CustomCardWidget(
                      isChecked: cafeCheck,
                      onPressed: () {
                        setState(() {
                          cafeCheck = !cafeCheck;
                          types.add('cafe');
                        });
                      },
                      title: 'Cafe',
                    ),
                    CustomCardWidget(
                      isChecked: entertainmentCheck,
                      onPressed: () {
                        setState(() {
                          entertainmentCheck = !entertainmentCheck;
                          types.add('movie_theater');
                          types.add('park');
                        });
                      },
                      title: 'Entertainment',
                    ),
                    CustomCardWidget(
                      isChecked: shoppingCheck,
                      onPressed: () {
                        setState(() {
                          shoppingCheck = !shoppingCheck;
                          types.add('shopping_mall');
                          types.add('shoe_store');
                        });
                      },
                      title: 'Shopping',
                    ),
                    CustomCardWidget(
                      isChecked: sportsCheck,
                      onPressed: () {
                        setState(() {
                          sportsCheck = !sportsCheck;
                          types.add('stadium');
                        });
                      },
                      title: 'Spots',
                    ),
                    CustomCardWidget(
                      isChecked: fitnessCheck,
                      onPressed: () {
                        setState(() {
                          fitnessCheck = !fitnessCheck;
                          types.add('gym');
                        });
                      },
                      title: 'Fitness',
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: OriginalButton(
                text: 'Generate Plan',
                onPressed: () {
                  String mergedString = types.join('|');
                  PlacesFilters placesFilter = PlacesFilters(
                    lat: widget.latitude!,
                    log: widget.longitude!,
                    fromTime: widget.startTime!,
                    toTime: widget.endTime!,
                    types: mergedString,
                  );
                  BlocProvider.of<PlanBloc>(context).add(
                    GetPlanEvent(filters: placesFilter),
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return PlanScreen();
                      },
                    ),
                  );
                },
                textColor: Colors.white,
                bgColor: Colors.black87,
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        selectedItemColor: Color.fromARGB(255, 0, 0, 0),
        unselectedItemColor: Color.fromARGB(255, 0, 0, 0),
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'Menu',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Plans',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'profile',
          ),
        ],
      ),
    );
  }
}
