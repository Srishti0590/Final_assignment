import 'dart:async';

import 'package:car_rental/screens/Saved.dart';
import 'package:car_rental/screens/addproduct.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:car_rental/screens/PofileDashboard.dart';
import 'package:car_rental/screens/dashboard.dart';
import 'package:all_sensors2/all_sensors2.dart';

class NavigationDrawerScreen extends StatefulWidget {
  const NavigationDrawerScreen({ Key? key }) : super(key: key);

  @override
  State<NavigationDrawerScreen> createState() => _NavigationDrawerScreenState();
}

class _NavigationDrawerScreenState extends State<NavigationDrawerScreen> {
    double _proximityValue = 0;
      final List<StreamSubscription<dynamic>> _streamSubscription =
      <StreamSubscription<dynamic>>[];

  @override
  void initState() {
    _streamSubscription.add(
      proximityEvents!.listen(
        (ProximityEvent event) => {
          setState(() {
            _proximityValue = event.proximity;
          })
        },
      ),
    );

    super.initState();
  }


int _selectedIndex=0;

List<Widget>lstWidget=[
  const Dashboard(),
  const AddVehicle(),
  const ViewAll(),
  const ProfileScreen()
] ;
  
  @override
  Widget build(BuildContext context) {

       debugPrint(_proximityValue.toString());
    if (_proximityValue <= 4.0 && _proximityValue != 0.0) {
      setState(() {
        if (_selectedIndex < 3) {
          _selectedIndex++;
        } else {
          _selectedIndex = 0;
        }
      });
 
    }
    return Scaffold(
      body:  Center(
        child: lstWidget[_selectedIndex],
      ),
      bottomNavigationBar: SizedBox(
        height: 96,
        child: FancyBottomNavigation(
          tabs: [
           TabData(
              iconData: Icons.explore,
              title:'Explore', 
              ),
              TabData(
              iconData: Icons.add_circle,
              title:'Add', 
              ),
            TabData(
              iconData: Icons.view_list,
              title:'View All', 
              ),
            TabData(
              iconData: Icons.verified_user,
              title:'Profile', 
              ),
          ],
          
          // backgroundColor: const Color.fromARGB(255, 14, 14, 14),
          // currentIndex: _selectedIndex,
          // unselectedItemColor: const Color.fromARGB(255, 207, 52, 52),
          // selectedItemColor: const Color.fromARGB(255, 15, 11, 11),
          // elevation: 10,
          // onTap: (index){
          //   setState((){
          //     _selectedIndex= index;

          //   });
          // },
           onTabChangedListener: (int position) { 
            setState(() {
          _selectedIndex = position;
          });

           },
            // barBackgroundColor: const Color.fromARGB(255, 241, 50, 98),
            //activeIconColor: const Color.fromARGB(255, 89, 141, 238),
        ),
      ),   
    );
    
  }
}