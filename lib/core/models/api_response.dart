import 'package:flutter_tata_neu_assignment/core/models/dashboard_details.dart';

// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';

part 'api_response.g.dart';

@JsonSerializable()
class APIResponse {
  bool? status;
  String? message;
  DashboardDetails? result;

  APIResponse({this.status, this.message, this.result});

  factory APIResponse.fromJson(Map<String, dynamic> json) =>
      _$APIResponseFromJson(json);

  Map<String, dynamic> toJson() => _$APIResponseToJson(this);
}
