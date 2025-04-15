import 'package:json_annotation/json_annotation.dart';
import 'package:task_medigreif_digital_health/models/mood/mood.dart';

part '../../generated/models/user/user.g.dart';

@JsonSerializable()
class User {
  final int id;
  final String username;
  final List<Mood> moods;

  const User({
    required this.id,
    required this.username,
     this.moods = const [],
  });

  factory User.fromJson(Map<String, dynamic> json) =>
      _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}