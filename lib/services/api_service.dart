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

      final response = await (method == 'POST'
          ? http.post(url, headers: _headers, body: json.encode(data))
          : http.get(url, headers: _headers))
          .timeout(_timeout);

      final statusCode = response.statusCode;
      final responseBody = response.body;

      dynamic body;
      try {
        body = json.decode(responseBody);
      } catch (_) {
        throw ErrorException('Invalid server response.', statusCode: statusCode);
      }

      if (statusCode >= 200 && statusCode < 300) {
        return body;
      }

      // Handle known error shape
      final errorMessage = body is Map && body.containsKey('error')
          ? body['error']
          : 'Unexpected error.';

      throw ErrorException(errorMessage, statusCode: statusCode);
    } on SocketException {
      throw ErrorException('No internet connection.');
    } on TimeoutException {
      throw ErrorException('Request timed out.');
    } on ErrorException {
      rethrow; // Keep your custom error with its message
    } catch (e) {
      // This is for any other unexpected errors
      throw ErrorException('Something went wrong.');
    }
  }
}