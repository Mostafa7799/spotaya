import 'package:get_it/get_it.dart';
import 'package:spotaya/Plan/data/datasources/places_data_source.dart';
import 'package:spotaya/Plan/data/repositories/places_repo.dart';
import 'package:spotaya/Plan/data/use_cases/get_places_use_case.dart';
import 'package:spotaya/Plan/network/dio_helper.dart';
import 'package:spotaya/Plan/presentation/bloc/plan_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Bloc
  sl.registerFactory(() => PlanBloc(sl()));

  // Use cases
  sl.registerLazySingleton(() => GetPlacesUseCase(sl()));

  // Repository
  sl.registerLazySingleton<PlacesBaseRepo>(() => PlacesRepo(sl()));

  // Data source
  sl.registerLazySingleton<PlacesBaseDataSource>(() => PlacesDataSource(sl()));

  // Dio
  sl.registerLazySingleton<BaseDioHelper>(() => DioHelper());
}
