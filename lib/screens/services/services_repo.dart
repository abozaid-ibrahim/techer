import 'dart:developer';

import 'package:flutter/material.dart';

class ServicesStore extends ChangeNotifier {
  void requestService(Service service) {
    log('Requesting service: $service');
    notifyListeners();
  }
}
