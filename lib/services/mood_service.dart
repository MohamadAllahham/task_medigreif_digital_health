import 'package:get_it/get_it.dart';
import 'package:task_medigreif_digital_health/models/mood/create_mood_request_body.dart';
import 'package:task_medigreif_digital_health/models/mood/mood.dart';
import 'package:task_medigreif_digital_health/models/network/api_response.dart';
import 'package:task_medigreif_digital_health/services/api_service.dart';

class MoodService {
  final _apiService = GetIt.I.get<ApiService>();

  Future<ApiResponse<Mood>> getMoodById(int moodId) async {
    final response = await _apiService.get('mood/$moodId');

    return ApiResponse<Mood>.fromJson(
      response,
          (json) => Mood.fromJson(json as Map<String, dynamic>),
    );
  }

  Future<ApiResponse<Mood>> createMood(CreateMoodRequestBody body) async {
    final response = await _apiService.post('mood/create', body.toJson());

    return ApiResponse<Mood>.fromJson(
      response,
          (json) => Mood.fromJson(json as Map<String, dynamic>),
    );
  }
}
