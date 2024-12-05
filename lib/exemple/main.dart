// lib/main.dart

import 'package:flutter/material.dart';
import 'package:tp02/exemple/AddSingerScreen.dart';
import 'package:tp02/exemple/settings.dart';
import 'homeScreen.dart'; // Importer la nouvelle page d'accueil

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mon Album des Chanteurs',
      
      debugShowCheckedModeBanner: false,
       initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
         '/singers': (context) => AddSingerScreen(),
         '/settings': (context) => SettingsPage(),
      },
    );
  }
}