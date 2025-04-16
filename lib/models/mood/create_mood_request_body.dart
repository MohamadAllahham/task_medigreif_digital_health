import 'package:json_annotation/json_annotation.dart';

part '../../generated/models/mood/create_mood_request_body.g.dart';

@JsonSerializable()
class CreateMoodRequestBody {
  final String userId;
  final String moodType;
  final String? note;

  const CreateMoodRequestBody({
    required this.userId,
    required this.moodType,
    this.note,
  });

  factory CreateMoodRequestBody.fromJson(Map<String, dynamic> json) =>
      _$CreateMoodRequestBodyFromJson(json);

  Map<String, dynamic> toJson() => _$CreateMoodRequestBodyToJson(this);
}
