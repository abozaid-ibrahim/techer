import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:techer/screens/home_page.dart';
import 'package:techer/screens/services/provided_service.dart';
import 'package:techer/screens/services/service_card_widget.dart';
import 'package:techer/screens/services/services_repo.dart';
import 'package:techer/ui_configuration/styled_button';
import 'package:techer/ui_configuration/styled_text.dart';
import 'package:techer/ui_configuration/theme.dart';

class RequestServiceWidget extends StatefulWidget {
  const RequestServiceWidget({super.key});

  @override
  State<RequestServiceWidget> createState() => _RequestServiceWidgetState();
}

class _RequestServiceWidgetState extends State<RequestServiceWidget> {
  final _nameController = TextEditingController();
  final _sloganController = TextEditingController();

  @override
  void dispose() {
    // clean up the controller when the widget is disposed
    _nameController.dispose();
    _sloganController.dispose();
    super.dispose();
  }

  // handling vocation selection
  ProvidedService? selectedService;

  void updateVocation(ProvidedService service) {
    setState(() {
      selectedService = service;
    });
  }

  // submit handler
  void handleSubmit() {
    if (_nameController.text.trim().isEmpty) {
      showDialog(
          context: context,
          builder: (ctx) {
            return AlertDialog(
              title: const StyledHeading('Missing Character Name'),
              content: const StyledText(
                  'Every good RPG character needs a great name...'),
              actions: [
                StyledButton(
                  onPressed: () {
                    Navigator.pop(ctx);
                  },
                  child: const StyledHeading('Close'),
                ),
              ],
              actionsAlignment: MainAxisAlignment.center,
            );
          });

      return;
    }
    if (_sloganController.text.trim().isEmpty) {
      showDialog(
          context: context,
          builder: (ctx) {
            return AlertDialog(
              title: const StyledHeading('Missing Character Slogan'),
              content: const StyledText('Remember to add a catchy saying...'),
              actions: [
                StyledButton(
                  onPressed: () => Navigator.pop(ctx),
                  child: const StyledHeading('Close'),
                ),
              ],
              actionsAlignment: MainAxisAlignment.center,
            );
          });

      return;
    }

    // Provider.of<ServicesStore>(context, listen: false).requestService(
    //     ProvidedService(
    //         name: _nameController.text.trim(),
    //         type: _sloganController.text.trim()));

    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (ctx) => const MyHomePage(title: "Home"),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const StyledTitle('Character Creation'),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // welcome message
              Center(
                child: Icon(Icons.code, color: AppColors.primaryColor),
              ),
              const Center(
                child: StyledHeading('Welcome, new player.'),
              ),
              const Center(
                child: StyledText('Create a name & slogan for your character.'),
              ),
              const SizedBox(height: 30),

              // input for name & slogan
              TextField(
                controller: _nameController,
                cursorColor: AppColors.textColor,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.person_2),
                  label: StyledText('Character name'),
                ),
                style: GoogleFonts.kanit(
                  textStyle: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _sloganController,
                cursorColor: AppColors.textColor,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.chat),
                  label: StyledText('Character slogan'),
                ),
                style: GoogleFonts.kanit(
                  textStyle: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              const SizedBox(height: 30),

              // select vocation title
              Center(
                child: Icon(Icons.code, color: AppColors.primaryColor),
              ),
              const Center(child: StyledHeading('Choose a Vocation.')),
              const Center(
                  child: StyledText('This determines your available skills.')),
              const SizedBox(height: 30),

              // vocation cards
              ServiceCardWidget(
                service: ProvidedService(
                    name: "develop_flutter_app",
                    type: ServiceType.develop_flutter_app),
                onTap: updateVocation,
                selected: selectedService ==
                    ProvidedService(
                        name: "develop_flutter_app",
                        type: ServiceType.develop_flutter_app),
              ),
              ServiceCardWidget(
                service: ProvidedService(
                    name: "improve_ios_performance",
                    type: ServiceType.improve_ios_performance),
                onTap: updateVocation,
                selected: selectedService ==
                    ProvidedService(
                        name: "improve_ios_performance",
                        type: ServiceType.improve_ios_performance),
              ),
              ServiceCardWidget(
                service: ProvidedService(
                    name: "inerview_engineers",
                    type: ServiceType.inerview_engineers),
                onTap: updateVocation,
                selected: selectedService ==
                    ProvidedService(
                        name: "inerview_engineers",
                        type: ServiceType.inerview_engineers),
              ),

              // good luck message
              Center(child: Icon(Icons.code, color: AppColors.primaryColor)),
              const Center(child: StyledHeading('Good Luck.')),
              const Center(
                child: StyledText('And enjoy the journey ahead...'),
              ),
              const SizedBox(height: 30),

              // submit button
              Center(
                child: StyledButton(
                  onPressed: handleSubmit,
                  child: const StyledHeading('Create Character'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
