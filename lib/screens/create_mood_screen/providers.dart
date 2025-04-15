import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_medigreif_digital_health/models/mood/mood_type.dart';

final moodTypeProvider = StateProvider<MoodType?>((ref) => null);
final stepIndex = StateProvider<int>((ref) => 0);
final feelingsProvider = StateProvider<List<int>>((ref) => []);
final sleepingProvider = StateProvider<List<int>>((ref) => []);
final achievementsProvider = StateProvider<List<int>>((ref) => []);
final highlightOfTheDayControllerProvider =
    Provider.autoDispose<TextEditingController>((ref) {
  final controller = TextEditingController();
  ref.onDispose(() => controller.dispose());
  return controller;
});
final noteControllerProvider =
    Provider.autoDispose<TextEditingController>((ref) {
  final controller = TextEditingController();
  ref.onDispose(() => controller.dispose());
  return controller;
});
