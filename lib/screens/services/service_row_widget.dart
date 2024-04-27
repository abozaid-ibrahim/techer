import 'package:flutter/material.dart';
import 'package:techer/screens/services/provided_service.dart';
import 'package:techer/screens/services/request_service_widget.dart';

class ServiceRowWidget extends StatefulWidget {
  final ProvidedService service;

  const ServiceRowWidget(this.service, {super.key});

  @override
  State<ServiceRowWidget> createState() => _ServiceRowWidgetState();
}

class _ServiceRowWidgetState extends State<ServiceRowWidget> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (ctx) => const RequestServiceWidget(),
            ));
      },
      child: Text(widget.service.name),
    );
  }
}
