import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:task_medigreif_digital_health/router/app_router.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:task_medigreif_digital_health/services/data_storage_service.dart';
import 'package:task_medigreif_digital_health/services/mood_service.dart';
import 'package:task_medigreif_digital_health/services/user_service.dart';
import 'package:task_medigreif_digital_health/theme.dart';
import 'generated/app_localizations.dart';
import 'services/api_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await dotenv.load(fileName: ".env");
  } catch (e) {
    debugPrint('Failed to load .env file: $e');
  }
  _setupDependencies();
  runApp(const ProviderScope(child: MyApp()));
}

void _setupDependencies() {
   final getIt = GetIt.instance;

   getIt.registerLazySingleton<ApiService>(() => ApiService());
   getIt.registerLazySingleton<UserService>(() => UserService());
   getIt.registerLazySingleton<MoodService>(() => MoodService());
   getIt.registerLazySingleton<DataStorageService>(() => DataStorageService());
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return MaterialApp.router(
      title: 'Mood Tracker',
      routerConfig: ref.watch(routerProvider),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: AppLocalizations.supportedLocales[0], // german
      theme: themeData,
    );
  }
}
