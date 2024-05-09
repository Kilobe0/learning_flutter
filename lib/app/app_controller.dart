import 'package:flutter/material.dart';
import 'package:learning_flutter/app/interfaces/local_storage_interface.dart';
import 'package:learning_flutter/app/services/shared_local_storage_service.dart';
import 'package:learning_flutter/app/viewmodels/change_theme_viewmodel.dart';

class AppController {
  // Final para garantir que a instância não seja alterada.
  static final AppController instance = AppController._();

  // Construtor privado para garantir que a classe seja um singleton.
  AppController._() {
    changeThemeViewmodel.init();
  }

  final ChangeThemeViewmodel changeThemeViewmodel = ChangeThemeViewmodel(
    SharedLocalStorageService(),
  );

  bool get isDark => changeThemeViewmodel.config.themeSwitch.value;
  ValueNotifier<bool> get themeSwitch =>
      changeThemeViewmodel.config.themeSwitch;

  final ILocalStorage storage = SharedLocalStorageService();
}
