import 'package:flutter/foundation.dart';

class AppController {
  // Final para garantir que a instância não seja alterada.
  static final AppController instance = AppController._();

  // Construtor privado para garantir que a classe seja um singleton.
  AppController._();

  final themeSwitch = ValueNotifier<bool>(false);

  void changeTheme(bool value) {
    themeSwitch.value = value;
  }
}
