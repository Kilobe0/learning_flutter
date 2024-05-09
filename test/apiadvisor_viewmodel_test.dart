import 'package:flutter_test/flutter_test.dart';
import 'package:learning_flutter/app/interfaces/client_http_interface.dart';
import 'package:learning_flutter/app/models/apiadvisor_model.dart';
import 'package:learning_flutter/app/repositories/apiadvisor_repository.dart';
import 'package:learning_flutter/app/viewmodels/apiadvisor_viewmodel.dart';
import 'package:mockito/mockito.dart';

class ClientHttpMockito extends Mock implements IClientHttp {}

void main() {
  final mock = ClientHttpMockito();

  const url =
      'http://apiadvisor.climatempo.com.br/api/v1/anl/synoptic/locale/BR?token=e4e9d0d4141a4549fa6f1ba827e51f6e';

  final viewModel = ApiadvisorViewModel(
    ApiadvisorRepository(mock),
  );

  group('ApiAdvisorViewModel', () {
    when(mock.get(url)).thenAnswer(
      (_) => Future.value(
        [
          ApiadvisorModel(country: 'BR', date: '2021-09-01', text: 'Test')
              .toJson(),
        ],
      ),
    );
    test(
      'ApiAdvisorViewModel success',
      () async {
        await viewModel.fill();
        expect(viewModel.apiadvisorModel.value, isA<ApiadvisorModel>());
      },
    );

    when(mock.get(url)).thenThrow(Exception("error"));
    test(
      'ApiAdvisorViewModel error',
      () async {
        await viewModel.fill();
        expect(viewModel.apiadvisorModel.value, null);
      },
    );
  });
}
