import 'package:flutter/material.dart';

import 'models/appconfig_model.dart';

class AppController {
  // Final para garantir que a instância não seja alterada.
  static final AppController instance = AppController._();

  // Construtor privado para garantir que a classe seja um singleton.
  AppController._();

  final AppConfigModel config = AppConfigModel();
  bool get isDark => config.themeSwitch.value;
  ValueNotifier<bool> get themeSwitch => config.themeSwitch;

  void changeTheme(bool value) {
    config.themeSwitch.value = value;
  }
}
