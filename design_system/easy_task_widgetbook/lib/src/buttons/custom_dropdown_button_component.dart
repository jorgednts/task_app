import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';

enum _DropdownValues {
  firstOption(icon: Icons.add),
  secondOption(icon: Icons.remove),
  thirdOption(icon: Icons.edit),
  fourthOption(icon: Icons.delete),
  fifthOption(icon: Icons.save),
  sixthOption(icon: Icons.cancel),
  seventhOption(icon: Icons.info),
  eighthOption(icon: Icons.warning),
  ninthOption(icon: Icons.error),
  tenthOption(icon: Icons.help);

  const _DropdownValues({required this.icon});

  final IconData icon;
}

class CustomDropdownButtonComponent extends WidgetbookComponent {
  CustomDropdownButtonComponent()
    : super(
        name: 'CustomDropdownButton',
        useCases: [
          WidgetbookUseCase(
            name: 'Generic',
            builder: (context) {
              return Scaffold(
                body: Center(
                  child: CustomDropdownButton<_DropdownValues>(
                    hint: 'Dropdown hint',
                    initialValue: _DropdownValues.firstOption,
                    options: _DropdownValues.values,
                    onChanged: (value) {
                      debugPrint('Selected value: $value');
                    },
                    nameBuilder: (value) => value.name,
                    leadingBuilder: (value) => Icon(value.icon),
                  ),
                ),
              );
            },
          ),
        ],
      );
}
