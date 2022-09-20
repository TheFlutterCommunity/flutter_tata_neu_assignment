import 'package:flutter_tata_neu_assignment/core/persistence/prefs_helper.dart';
import 'package:flutter_tata_neu_assignment/core/services/dialog_service.dart';
import 'package:flutter_tata_neu_assignment/core/services/navigation_service.dart';
import 'package:flutter_tata_neu_assignment/core/view_models/dashboard/dashboard_view_model.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_tata_neu_assignment/core/repositories/api_repository.dart';

final locator = GetIt.instance;

void setupLocator() {
  // Repository
  locator.registerLazySingleton(() => APIRepository());

  // ViewModels
  locator.registerLazySingleton(() => DashboardViewModel());
  // Preferences
  locator.registerLazySingleton(() => PrefsHelper());

  // Services
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => DialogService());
}
