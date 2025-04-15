import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_medigreif_digital_health/models/network/api_response.dart';
import 'package:task_medigreif_digital_health/models/network/error_exception.dart';
import 'package:task_medigreif_digital_health/models/user/user.dart';
import 'package:task_medigreif_digital_health/providers/user/user_state.dart';
import 'package:task_medigreif_digital_health/services/data_storage_service.dart';
import 'package:task_medigreif_digital_health/services/user_service.dart';
import 'package:task_medigreif_digital_health/models/user/login_body_request.dart';
import 'package:get_it/get_it.dart';

class UserProvider extends StateNotifier<UserState> {
  final _storage = GetIt.I<DataStorageService>();
  final _userService = GetIt.I<UserService>();

  UserProvider() : super(const UserState()) {
    _loadUser();
  }

  Future<void> _loadUser() async {
    final user = await _storage.getUser();
    state = state.copyWith(user: user);
  }

  Future<ApiResponse<User>?> login(LoginBodyRequest body) async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    try {
      final response = await _userService.login(body);
      await _storage.saveUser(response.data);
      state = UserState(user: response.data);
      return response;
    } on ErrorException catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: e.message,
      );
      return null;
    } catch (_) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: "Unbekannter Fehler.",
      );
      return null;
    }
  }

  void logout() {
    _storage.clearUser();
    state = const UserState();
  }
}

final userProvider = StateNotifierProvider<UserProvider, UserState>(
  (ref) => UserProvider(),
);
