import 'package:task_medigreif_digital_health/models/user/user.dart';

class UserState {
  final User? user;
  final bool isLoading;
  final String? errorMessage;

  const UserState({this.user, this.isLoading = false, this.errorMessage});

  UserState copyWith({
    User? user,
    bool? isLoading,
    String? errorMessage,
  }) {
    return UserState(
      user: user ?? this.user,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
    );
  }
}