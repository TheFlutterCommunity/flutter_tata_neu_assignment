// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

APIResponse _$APIResponseFromJson(Map<String, dynamic> json) => APIResponse(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      result: json['result'] == null
          ? null
          : DashboardDetails.fromJson(json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$APIResponseToJson(APIResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'result': instance.result,
    };
