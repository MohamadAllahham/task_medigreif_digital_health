import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_medigreif_digital_health/providers/user/user_provider.dart';
import 'package:task_medigreif_digital_health/providers/user/user_state.dart';

class GoRouterRefreshNotifier extends ChangeNotifier {
  GoRouterRefreshNotifier(Ref ref) {
    ref.listen<UserState>(
      userProvider,
          (_, __) => notifyListeners(),
    );
  }
}