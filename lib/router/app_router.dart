import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:task_medigreif_digital_health/models/mood/mood_type.dart';
import 'package:task_medigreif_digital_health/models/user/user.dart';
import 'package:task_medigreif_digital_health/providers/user/user_provider.dart';
import 'package:task_medigreif_digital_health/screens/create_mood_screen/create_mood_screen.dart';
import 'package:task_medigreif_digital_health/screens/main_screen/main_screen.dart';
import 'package:task_medigreif_digital_health/screens/login_screen.dart';
import 'package:task_medigreif_digital_health/router/router_refresh_stream.dart';
import 'package:task_medigreif_digital_health/screens/mood_created_screen/mood_created_screen.dart';

final authStateProvider = StateProvider<User?>((ref) => null);

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    refreshListenable: GoRouterRefreshNotifier(ref),
    redirect: (context, state) {
      final user = ref.read(userProvider).user;
      final isLoggingIn = state.matchedLocation == '/login';

      if (user == null) return isLoggingIn ? null : '/login';
      if (isLoggingIn) return '/';

      return null;
    },
    routes: [
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/',
        builder: (context, state) => const MainScreen(),
      ),
      GoRoute(
        path: '/create-mood',
        builder: (context, state) {
          final moodType = state.extra as MoodType;
          return CreateMoodScreen(moodType);
        },
      ),
      GoRoute(
        path: '/mood-created',
        builder: (context, state) => const MoodCreatedScreen(),
      ),
    ],
  );
});
