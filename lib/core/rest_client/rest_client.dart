import 'package:get/get_connect.dart';

class RestClient extends GetConnect {
  String backendBaseUrl = 'http://dartweek.academiadoflutter.com.br';

  RestClient() {
    httpClient.baseUrl = backendBaseUrl;
    httpClient.errorSafety = false;
  }
}

class RestClientException implements Exception {
  final int? code;
  String? message;
  RestClientException(this.message, {this.code});
}
