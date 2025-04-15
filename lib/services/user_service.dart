import 'package:get_it/get_it.dart';
import 'package:task_medigreif_digital_health/models/network/api_response.dart';
import 'package:task_medigreif_digital_health/models/user/login_body_request.dart';
import 'package:task_medigreif_digital_health/models/user/user.dart';
import 'package:task_medigreif_digital_health/services/api_service.dart';
import 'package:task_medigreif_digital_health/models/network/error_exception.dart';

class UserService {
  final _apiService = GetIt.I.get<ApiService>();

  Future<ApiResponse<User>> getUserById(String id) async {
    try {
      final response = await _apiService.get('user/$id');

      return ApiResponse<User>.fromJson(
        response,
            (json) => User.fromJson(json as Map<String, dynamic>),
      );
    } catch (e) {
      throw ErrorException('Failed to fetch user by ID. Please check your connection.');
    }
  }

  // Login method
  Future<ApiResponse<User>> login(LoginBodyRequest body) async {
    try {
      final response = await _apiService.post('login', body.toJson());

      return ApiResponse<User>.fromJson(
        response,
            (json) => User.fromJson(json as Map<String, dynamic>),
      );
    } on ErrorException catch (e) {
      throw ErrorException('Login failed. Error: ${e.message}');
    } catch (e) {
      throw ErrorException('Login failed. Unexpected error: $e');
    }
  }
}