import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:living_app/utils/network/exceptions/app_exception.dart';

class ApiBaseHelper {
  static const _backendBaseUrlRaw = '192.168.233.82:8080';
  static const _backendBaseUrl = 'http://$_backendBaseUrlRaw/';

  Future<dynamic> get(String path, {Map<String, String>? queryParams}) async {
    var responseJson;
    var uri = Uri.http(_backendBaseUrlRaw, path, queryParams);
    try {
      final response = await http.get(
        uri,
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Host': _backendBaseUrlRaw
        },
      );
      responseJson = await _returnResponse(path, response);
    } on SocketException {
      throw FetchDataException();
    }
    return responseJson;
  }

  Future<dynamic> delete(String path, dynamic body) async {
    var responseJson;

    try {
      final response = await http.delete(
        Uri.parse(_backendBaseUrl + path),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(body),
      );
      responseJson = await _returnResponse(path, response);
    } on SocketException {
      throw FetchDataException();
    }
    return responseJson;
  }

  Future<dynamic> post(String path, dynamic body, {bool doAuth = true}) async {
    var responseJson;

    try {
      final response = await http.post(
        Uri.parse((_backendBaseUrl) + path),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(body),
      );
      responseJson = await _returnResponse(path, response);
    } on SocketException {
      throw FetchDataException();
    }
    return responseJson;
  }

  Future<dynamic> put(String path, dynamic body) async {
    var responseJson;

    try {
      final response = await http.put(Uri.parse(_backendBaseUrl + path),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(body));
      responseJson = await _returnResponse(path, response);
    } on SocketException {
      throw FetchDataException();
    }
    return responseJson;
  }

  Future<dynamic> patch(String path, dynamic body) async {
    var responseJson;

    try {
      final response = await http.patch(Uri.parse(_backendBaseUrl + path),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(body));
      responseJson = await _returnResponse(path, response);
    } on SocketException {
      throw FetchDataException();
    }
    return responseJson;
  }

  Future<dynamic> patchFormData(
      String path, Map<String, String> fields, XFile file) async {
    var responseJson;

    try {
      var request = MultipartRequest('PATCH', Uri.parse(_backendBaseUrl + path))
        ..fields.addAll(fields)
        ..files.add(await http.MultipartFile.fromPath('photo', file.path));

      var response = await Response.fromStream(await request.send());
      responseJson = await _returnResponse(path, response);
    } on SocketException {
      throw FetchDataException();
    }
    return responseJson;
  }

  dynamic _returnResponse(String path, Response response) async {
    print(response.statusCode);
    print(response.body);
    switch (response.statusCode) {
      case 200:
      case 201:
        var responseJson = jsonDecode(utf8.decode(response.bodyBytes));
        return responseJson;
      case 400:
      case 403:
        throw BadRequestException();
      case 401:
        throw UnauthorizedException();
      case 404:
        throw EntityNotFoundException();
      case 500:
      default:
        throw GenericErrorException();
    }
  }
}
