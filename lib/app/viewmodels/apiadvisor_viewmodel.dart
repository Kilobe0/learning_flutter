import 'package:flutter/material.dart';
import 'package:learning_flutter/app/models/apiadvisor_model.dart';
import 'package:learning_flutter/app/repositories/apiadvisor_repository_interface.dart';

class ApiadvisorViewModel {
  final IApiAdvisor repository;

  final ValueNotifier<ApiadvisorModel?> apiadvisorModel = ValueNotifier(null);

  ApiadvisorViewModel(this.repository);

  Future<void> fill() async {
    apiadvisorModel.value = await repository.getWeather();
  }
}
