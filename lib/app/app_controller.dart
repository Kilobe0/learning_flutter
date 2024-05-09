import 'package:flutter/material.dart';
import 'package:learning_flutter/app/interfaces/local_storage_interface.dart';
import 'package:learning_flutter/app/services/shared_local_storage_service.dart';

import 'models/appconfig_model.dart';

class AppController {
  // Final para garantir que a instância não seja alterada.
  static final AppController instance = AppController._();

  // Construtor privado para garantir que a classe seja um singleton.
  AppController._() {
    storage.get('isDark').then(
      (value) {
        if (value != null) {
          config.themeSwitch.value = value;
        }
      },
    );
  }

  final AppConfigModel config = AppConfigModel();
  bool get isDark => config.themeSwitch.value;
  ValueNotifier<bool> get themeSwitch => config.themeSwitch;

  final ILocalStorage storage = SharedLocalStorageService();

  void changeTheme(bool value) {
    config.themeSwitch.value = value;
    storage.put('isDark', value);
  }
}
