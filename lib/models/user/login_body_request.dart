import 'package:json_annotation/json_annotation.dart';

part '../../generated/models/user/login_body_request.g.dart';

@JsonSerializable()
class LoginBodyRequest {
  final String username;
  final String password;

  const LoginBodyRequest({
    required this.username,
    required this.password,
  });

  factory LoginBodyRequest.fromJson(Map<String, dynamic> json) =>
      _$LoginBodyRequestFromJson(json);

  Map<String, dynamic> toJson() => _$LoginBodyRequestToJson(this);
}