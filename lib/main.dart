import 'package:flutter/material.dart';
import 'package:todo/routes/home.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context)=> Home(),
  },
));
