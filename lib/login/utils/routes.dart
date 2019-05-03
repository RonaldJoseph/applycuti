import 'package:flutter/material.dart';
import 'package:flutter_app/login/screens/login_screen.dart';
import 'package:flutter_app/Main/tabs/home.dart';
import 'package:flutter_app/Main/main.dart';



final routes = {
  '/login':         (BuildContext context) => new LoginScreen(),
  '/main':         (BuildContext context) => new MyApp(),
  '/' :          (BuildContext context) => new LoginScreen(),
};