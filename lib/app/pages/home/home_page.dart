import 'package:flutter/material.dart';
import 'package:learning_flutter/app/models/apiadvisor_model.dart';
import 'package:learning_flutter/app/pages/home/components/custom_switch_widget.dart';
import 'package:learning_flutter/app/pages/home/home_controller.dart';
import 'package:learning_flutter/app/repositories/apiadvisor_repository.dart';
import 'package:learning_flutter/app/services/client_http_service.dart';
import 'package:learning_flutter/app/viewmodels/apiadvisor_viewmodel.dart';

import '../../interfaces/client_http_interface.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  IClientHttp client = ClientHttpService();
  final controller = HomeController(
    ApiadvisorViewModel(
      ApiadvisorRepository(
        ClientHttpService(),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeData().colorScheme.primary,
        title: const Text('Home Page'),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.refresh),
        onPressed: () async {
          await controller.getWeather();
        },
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ValueListenableBuilder<ApiadvisorModel?>(
              valueListenable: controller.weather,
              builder: (context, model, child) {
                if (model?.text == null) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                return Text(model?.text ?? '');
              },
            ),
            const CustomSwitchWidget(),
          ],
        ),
      ),
    );
  }
}
