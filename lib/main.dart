import 'package:flutter/material.dart';

import 'screens/login_page.dart';
import 'screens/welcome.dart';
import 'screens/auth.dart';
import 'screens/home_page.dart';
import 'root_page.dart';


void main() => runApp(MaterialApp(
 // initialRoute: '/',
 // routes: {
  //  '/':(context) => Welcome(),
 //   '/home' : (context) => HomePage(),
    home : new RootPage(auth : new Auth())
 //   '/login' : (context) => LoginPage(),
 // },
));