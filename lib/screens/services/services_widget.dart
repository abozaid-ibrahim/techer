import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:techer/screens/services/provided_service.dart';
import 'package:techer/screens/services/service_row_widget.dart';

class ServicesWidget extends StatefulWidget {
  ServicesWidget({super.key});
  final List<ProvidedService> services = [
    ///move it as enum
    ProvidedService(
        name: "Scaling Mobile apps", type: ServiceType.scale_mobile_app),
    ProvidedService(
        name: "Improving iOS apps Performance",
        type: ServiceType.improve_ios_performance),
    ProvidedService(
        name: "Interviewing Mobile Engineers",
        type: ServiceType.inerview_engineers),
    ProvidedService(
        name: "Improving teams performance",
        type: ServiceType.improve_team_process),
  ];

  @override
  State<ServicesWidget> createState() => _ServicesWidgetState();
}

class _ServicesWidgetState extends State<ServicesWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
            itemCount: widget.services.length,
            itemBuilder: (_, index) {
              return Padding(
                  padding: const EdgeInsets.all(10),
                  child: ServiceRowWidget(widget.services[index]));
            }));
  }
}
