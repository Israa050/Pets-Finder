

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pets_finder_app/core/networking/api_service.dart';
import 'package:pets_finder_app/core/networking/dio_factory.dart';
import 'package:pets_finder_app/features/home/cubit/home_cubit.dart';
import 'package:pets_finder_app/features/home/data/repos/home_repo.dart';



final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio & ApiService
  Dio dio = DioFactory.getDio();
 
  // home
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));
  getIt.registerLazySingleton<HomeRepo>(() => HomeRepo(apiService: getIt()));
  getIt.registerFactory<HomeCubit>(() => HomeCubit(homeRepo: getIt()));
}