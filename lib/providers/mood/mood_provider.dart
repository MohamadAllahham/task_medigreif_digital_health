import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:task_medigreif_digital_health/models/mood/create_mood_request_body.dart';
import 'package:task_medigreif_digital_health/models/network/error_exception.dart';
import 'package:task_medigreif_digital_health/services/mood_service.dart';
import 'mood_state.dart';

class MoodProvider extends StateNotifier<MoodState> {
  final _moodService = GetIt.I<MoodService>();

  MoodProvider() : super(const MoodState());

  Future<void> getMood(int moodId) async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    try {
      final response = await _moodService.getMoodById(moodId);
      state = state.copyWith(mood: response.data, isLoading: false);
    } on ErrorException catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: e.message,
      );
    } catch (_) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: "Unbekannter Fehler beim Laden des Moods.",
      );
    }
  }

  Future<void> createMood(CreateMoodRequestBody body) async {
    state = state.copyWith(isLoading: true, errorMessage: null);

    try {
      final response = await _moodService.createMood(body);

      state = state.copyWith(mood: response.data, isLoading: false);
    } on ErrorException catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: e.message,
      );
    } catch (e) {
      state = state.copyWith(isLoading: false);
    }
  }

  void clearMood() {
    state = const MoodState();
  }
}

final moodProvider = StateNotifierProvider<MoodProvider, MoodState>((ref) {
  return MoodProvider();
});
