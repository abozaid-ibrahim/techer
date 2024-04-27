import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:techer/screens/home_page.dart';
import 'package:techer/state/cv_store.dart';
import 'package:techer/ui_configuration/theme.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => CVStore(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Techer',
      theme: primaryTheme,
      home: const MyHomePage(title: 'Techer: 4 startups a year journey MJSD'),
    );
  }
}
