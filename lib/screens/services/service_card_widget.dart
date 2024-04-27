import 'package:flutter/material.dart';
import 'package:techer/screens/services/provided_service.dart';
import 'package:techer/ui_configuration/styled_text.dart';
import 'package:techer/ui_configuration/theme.dart';

class ServiceCardWidget extends StatelessWidget {
  const ServiceCardWidget({
    super.key,
    required this.service,
    required this.onTap,
    required this.selected,
  });

  final ProvidedService service;
  final void Function(ProvidedService) onTap;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap(service);
      },
      child: Card(
        color: selected ? AppColors.secondaryColor : Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(children: [
            // vocation img
            // Image.asset(
            //   'assets/img/vocations/${service.image}',
            //   width: 80,
            //   colorBlendMode: BlendMode.color,
            //   color: !selected
            //       ? Colors.black.withOpacity(0.8)
            //       : Colors.transparent,
            // ),
            const SizedBox(width: 10),

            // vocation name & description
            Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    StyledHeading(service.name),
                    StyledText(service.description)
                  ]),
            ),
          ]),
        ),
      ),
    );
  }
}
