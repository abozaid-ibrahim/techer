import 'package:flutter/material.dart';

class CVStore extends ChangeNotifier {
  final List<Job> _jobs = [];

  List<Job> get jobs => _jobs;
}

class Job {
  final String title;
  final String companyName;
  final List<String> tasks;
  const Job(this.title, this.companyName, this.tasks);
}
