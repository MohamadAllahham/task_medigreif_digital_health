import 'package:task_medigreif_digital_health/models/mood/mood.dart';

class MoodState {
  final Mood? mood;
  final bool isLoading;
  final String? errorMessage;

  const MoodState({
    this.mood,
    this.isLoading = false,
    this.errorMessage,
  });

  MoodState copyWith({
    Mood? mood,
    bool? isLoading,
    String? errorMessage,
  }) {
    return MoodState(
      mood: mood ?? this.mood,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
    );
  }
}