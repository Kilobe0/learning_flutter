import 'package:learning_flutter/app/interfaces/client_http_interface.dart';
import 'package:learning_flutter/app/models/apiadvisor_model.dart';

import 'apiadvisor_repository_interface.dart';

class ApiadvisorRepository implements IApiAdvisor {
  final IClientHttp client;

  ApiadvisorRepository(this.client);

  @override
  Future<ApiadvisorModel> getWeather() async {
    try {
      var json = await client.get(
          'http://apiadvisor.climatempo.com.br/api/v1/anl/synoptic/locale/BR?token=e4e9d0d4141a4549fa6f1ba827e51f6e');
      ApiadvisorModel model = ApiadvisorModel.fromJson(json[0]);
      return model;
    } catch (e) {
      print(e);
    }
    return ApiadvisorModel();
  }
}
