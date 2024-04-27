import 'package:flutter/material.dart';
import 'package:techer/screens/cv_widget.dart';
import 'package:techer/screens/services/services_widget.dart';
import 'package:techer/ui_configuration/styled_button';
import 'package:techer/ui_configuration/styled_text.dart';

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({super.key, required this.title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Padding(
                padding: const EdgeInsets.all(40),
                child: const StyledHeading('CV will be uploaded soon')),
            const CVWidget(),
            const StyledHeading("Services"),
            ServicesWidget(),
            const Text("Startups"),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            StyledButton(
              onPressed: _incrementCounter,
              child: const Row(
                children: [Icon(Icons.meeting_room), StyledText("Lets meet")],
              ),
            )
          ],
        ),
      ),
    );
  }
}
