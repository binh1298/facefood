import 'dart:io';

import 'package:facefood/utils/secure_storage.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

final apiUrl = DotEnv().env['API_URL'];

class ApiCaller {
  post({String body, String route}) async {
    print('POST $apiUrl$route');
    String token = await getJwtToken();
    return http.post(
      '$apiUrl$route',
      headers: <String, String>{
        HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
        HttpHeaders.authorizationHeader: 'Bearer $token',
      },
      body: body,
    );
  }

  get({String route}) async {
    print('GET $apiUrl$route');
    String token = await getJwtToken();
    return http.get(
      '$apiUrl$route',
      headers: <String, String>{
        HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
        HttpHeaders.authorizationHeader: 'Bearer $token',
      },
    );
  }

  patch({String route, dynamic body}) async {
    print('PATCH $apiUrl$route');
    String token = await getJwtToken();
    return http.patch(
      '$apiUrl$route',
      headers: <String, String>{
        HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
        HttpHeaders.authorizationHeader: 'Bearer $token',
      },
      body: body,
    );
  }

  put({String route, dynamic body}) async {
    String token = await getJwtToken();
    http.Response response = await http.put(
      '$apiUrl$route',
      headers: <String, String>{
        HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
        HttpHeaders.authorizationHeader: 'Bearer $token',
      },
      body: body,
    );
    print('PUT $apiUrl$route ${response.body}');
    return response;
  }
}

final apiCaller = ApiCaller();
