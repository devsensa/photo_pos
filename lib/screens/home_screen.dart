import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'package:photo_pos/services/services.dart';

class HomeScreen extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //navigatorKey: GetIt.I<NavigationService>().navigatorKey,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Container(),
//      initialRoute: "/home",
//      routes: <String, WidgetBuilder>{
//        "/": (context) => WelcomePage(),
//        "/home": (context) => HomePage(),
//        "/points-of-sale": (context) => PointsOfSalePage(),
//        "/pos": (context) => PosPage(),
//        "/settings": (context) => SettingsPage(),
//        "/deals": (context) => DealPage(),
//        "/staff": (context) => StaffPage(),
//        "/staff/employee": (context) => EmployeePage(),
//      },
    );
  }
}
