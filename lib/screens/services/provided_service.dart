import 'package:flutter/material.dart';

class ProvidedService {
  final ServiceType type;
  final String name;
  final String description;
  const ProvidedService(
      {required this.name, required this.type, this.description = ''});
}

enum ServiceType {
  inerview_engineers,
  develop_flutter_app,
  improve_ios_performance,
  improve_team_process,
  scale_mobile_app
}
