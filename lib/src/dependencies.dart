import 'package:dio_app/src/features/dashboard/controller/dashboard_controller.dart';
import 'package:dio_app/src/features/dashboard/repository/dashboard_repository.dart';
import 'package:get_it/get_it.dart';

GetIt di = GetIt.I;

void registerDependencies() {
  di.registerLazySingleton<DashboardRepository>(() => DashboardRepository());
  di.registerLazySingleton<DashbordController>(
      () => DashbordController(di.get()));
}
