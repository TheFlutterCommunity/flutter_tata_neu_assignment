import 'dart:convert';
import 'dart:developer';

import 'package:flutter_tata_neu_assignment/core/di/locator.dart';
import 'package:flutter_tata_neu_assignment/core/enums/view_state.dart';
import 'package:flutter_tata_neu_assignment/core/models/api_response.dart';
import 'package:flutter_tata_neu_assignment/core/models/dashboard_details.dart';
import 'package:flutter_tata_neu_assignment/core/repositories/api_repository.dart';
import 'package:flutter_tata_neu_assignment/core/utils/helper_utils.dart';
import 'package:flutter_tata_neu_assignment/core/view_models/base/base_model.dart';

class DashboardViewModel extends BaseModel {
  final APIRepository _apiRepository = locator<APIRepository>();

  int? _currentIndex = 0;

  int? get currentIndex => _currentIndex;

  set currentIndex(int? value) {
    _currentIndex = value;
    updateUI();
  }

  int? _topBannerIndex = 0;

  int? get topBannerIndex => _topBannerIndex;

  set topBannerIndex(int? value) {
    _topBannerIndex = value;
    updateUI();
  }

  DashboardDetails? _dashboardDetails;

  DashboardDetails? get dashboardDetails => _dashboardDetails;

  set dashboardDetails(DashboardDetails? value) {
    _dashboardDetails = value;
    updateUI();
  }

  Future<bool> getDashboardDetails() async {
    state = ViewState.busy;
    try {
      APIResponse? response = await _apiRepository.getDashboardDetails();
      if (response.status == true) {
        _dashboardDetails = response.result;
        log("getProfileDetails:: Response:: ${json.encode(_dashboardDetails!)}");
        state = ViewState.idle;
        return true;
      } else {
        error = 'Failed to get details!';
        HelperUtils.showToast(
            message: response.message != null
                ? response.message!
                : 'Failed to get details!');
        state = ViewState.error;
        return false;
      }
    } catch (err) {
      log('Error: $err');
      error = 'Failed to get details!';
      HelperUtils.showToast(message: 'Failed to get details!');
      state = ViewState.error;
      return false;
    }
  }
}
