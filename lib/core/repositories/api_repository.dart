import 'package:dio/dio.dart';

import 'package:flutter_tata_neu_assignment/core/constants/service_constants.dart';
import 'package:flutter_tata_neu_assignment/core/models/api_response.dart';
import 'package:flutter_tata_neu_assignment/core/services/api_service.dart';

class APIRepository {
  final ApiProvider _apiProvider =
      ApiProvider(Dio(), baseUrl: ServiceConstants.baseUrl);

  Future<APIResponse> getDashboardDetails() async {
    return _apiProvider.getDashboardDetails();
  }
}
