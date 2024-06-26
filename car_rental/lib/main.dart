// ignore_for_file: use_key_in_widget_constructors
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:car_rental/screens/NavigatorDrawerScreen.dart';
import 'package:car_rental/screens/NotificationScreen.dart';
import 'package:car_rental/screens/RegisterPage.dart';
import 'package:car_rental/screens/bookings.dart';
import 'package:car_rental/screens/googlemaps.dart';
import 'package:car_rental/screens/loginPage.dart';
import 'package:car_rental/screens/wearos_screens/wearos_dashboard.dart';
import 'package:car_rental/screens/wearos_screens/wearos_login.dart';
import 'package:flutter/material.dart';

void main() {
    AwesomeNotifications().initialize('resource://drawable/launcher', [
      NotificationChannel(
        channelKey: "basic_channel",
        channelName: "Basic Notifications",
        channelDescription: "Notification Channel for sth",
        channelGroupKey: "basic_channel_group",
        defaultColor: const Color(0xFF00FF00),
        importance: NotificationImportance.Default,
        ledColor: Colors.white,
        channelShowBadge: true,
      )
    ]);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
  //     AwesomeNotifications().initialize(
  //   'resource://drawable/launcher', 
  //   [
  //     NotificationChannel(
  //       channelGroupKey: 'basic_channel_group',
  //       channelKey: 'basic_channel',
  //       channelName: 'Basic notifications',
  //       channelDescription: 'Notification channel for basic tests',
  //       defaultColor: const Color(0xFF9D50DD),
  //       importance: NotificationImportance.Max,
  //       ledColor: Colors.white,
  //       channelShowBadge: true
  //     ),
  //   ],
  // );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        '/wear':(context) => const LoginWearOS(),
        '/weardashboard':(context) => const DashboardWearOS(),
        '/':(context) =>const LoginPage(),
        '/register':(context) => const RegistrationPage(),
        '/dashboard':((context) => const NavigationDrawerScreen()),
        '/notifications':((context)=> const NotificationScreen()),
        '/googlemaps':((context)=> const googleMapScreen()),
        '/wearoslogin':((context)=> const LoginWearOS()),
        '/wearosdashboard':((context)=> const DashboardWearOS()),
        '/bookings':((context) => const bookings())



        

        
      },
    );
  }
}
