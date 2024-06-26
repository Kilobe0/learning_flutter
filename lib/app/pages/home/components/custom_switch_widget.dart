import 'package:flutter/material.dart';

import '../../../app_controller.dart';

class CustomSwitchWidget extends StatefulWidget {
  const CustomSwitchWidget({super.key});

  @override
  State<CustomSwitchWidget> createState() => _CustomSwitchWidgetState();
}

class _CustomSwitchWidgetState extends State<CustomSwitchWidget> {
  @override
  Widget build(BuildContext context) {
    return Switch(
      value: AppController.instance.isDark,
      onChanged: (value) {
        AppController.instance.changeThemeViewmodel.changeTheme(value);
        setState(() {});
      },
    );
  }
}
