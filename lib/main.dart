import 'package:flutter/material.dart';
import 'package:lab_project/sidebar.dart';
import 'add_exp.dart';
import 'exp_list.dart';
import 'home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(
            color: Colors.white, // Set the icon color to white
          ),
        ),
      ),
      home: DashBoard(),
    );
  }
}
