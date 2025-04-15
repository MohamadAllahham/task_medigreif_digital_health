import 'package:json_annotation/json_annotation.dart';
import 'mood_type.dart';

part '../../generated/models/mood/mood.g.dart';

@JsonSerializable()
class Mood {
  final int id;
  final MoodType moodType;
  final DateTime timestamp;
  final int userId;
  final String? note;

  const Mood({
    required this.id,
    required this.moodType,
    required this.timestamp,
    required this.userId,
    this.note,
  });

  factory Mood.fromJson(Map<String, dynamic> json) =>
      _$MoodFromJson(json);

  Map<String, dynamic> toJson() => _$MoodToJson(this);
}