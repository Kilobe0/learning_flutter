import 'package:dio/dio.dart';
import 'package:learning_flutter/app/interfaces/client_http_interface.dart';

class ClientHttpService implements IClientHttp {
  
  final Dio dio = Dio();

  @override
  void addToken(String token) {}

  @override
  Future get(String url) async {
    var response = await dio.get(url);
    return response.data;
  }
}
