import 'package:flutter/material.dart';

import '../controllers/app_controller.dart';

class CustomSwitchWidget extends StatefulWidget {
  const CustomSwitchWidget({super.key});

  @override
  State<CustomSwitchWidget> createState() => _CustomSwitchWidgetState();
}

class _CustomSwitchWidgetState extends State<CustomSwitchWidget> {
  @override
  Widget build(BuildContext context) {
    return Switch(
      value: AppController.instance.themeSwitch.value,
      onChanged: (value) {
        AppController.instance.changeTheme(value);
        setState(() {});
      },
    );
  }
}
