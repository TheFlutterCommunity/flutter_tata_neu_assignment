import 'package:dio/dio.dart';
import 'package:flutter_tata_neu_assignment/core/constants/service_constants.dart';
import 'package:flutter_tata_neu_assignment/core/models/api_response.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ServiceConstants.baseUrl)
abstract class ApiProvider {
  factory ApiProvider(Dio dio, {String baseUrl}) = _ApiProvider;

  @GET(ServiceConstants.getDashboardDetails)
  Future<APIResponse> getDashboardDetails();
}
