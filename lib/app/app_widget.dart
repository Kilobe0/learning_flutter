import 'package:flutter/material.dart';
import 'package:learning_flutter/app/pages/home/home_page.dart';

import 'controllers/app_controller.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: AppController.instance.themeSwitch,
      builder: (context, isDark, child) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            useMaterial3: true,
            brightness: isDark ? Brightness.dark : Brightness.light,
          ),
          home: const HomePage(),
        );
      },
    );
  }
}
