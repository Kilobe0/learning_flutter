import 'package:flutter/material.dart';
import 'package:learning_flutter/app/viewmodels/apiadvisor_viewmodel.dart';

import '../../models/apiadvisor_model.dart';

class HomeController {
  final ApiadvisorViewModel viewModel;

  HomeController(this.viewModel);

  ValueNotifier<ApiadvisorModel?> get weather => viewModel.apiadvisorModel;

  Future<void> getWeather() async {
    await viewModel.fill();
  }
}
