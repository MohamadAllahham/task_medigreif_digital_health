import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:task_medigreif_digital_health/models/network/error_exception.dart';

class ApiService {
  final _baseUrl = dotenv.env['API_URI']!;
  final _headers = {'Content-Type': 'application/json'};
  final _timeout = const Duration(seconds: 10);

  Future<dynamic> get(String endpoint) => _request('GET', endpoint);
  Future<dynamic> post(String endpoint, Map<String, dynamic> data) =>
      _request('POST', endpoint, data: data);

  Future<dynamic> _request(String method, String endpoint, {Map<String, dynamic>? data}) async {
    try {
      final url = Uri.parse('$_baseUrl$endpoint');

      final res = await (method == 'POST'
          ? http.post(url, headers: _headers, body:  json.encode(data))
          : http.get(url, headers: _headers))
          .timeout(_timeout);

      final body = json.decode(res.body);
      if (res.statusCode >= 200 && res.statusCode < 300) return body;
      throw ErrorException(body['error'] ?? 'Unexpected error.');
    } on SocketException {
      throw ErrorException('No internet connection.');
    } on TimeoutException {
      throw ErrorException('Request timed out.');
    } catch (_) {
      throw ErrorException('Something went wrong.');
    }
  }
}