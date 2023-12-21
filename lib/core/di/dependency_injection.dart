import 'package:dio/dio.dart';
import 'package:engas_task/features/login/data/repositories/login_repo_impl.dart';
import 'package:get_it/get_it.dart';

import '../../features/login/logic/login_cubit.dart';
import '../networking/api_service.dart';
import '../networking/dio_factory.dart';

final sl = GetIt.instance;

abstract class DependencyInjection {
  static void init() {
    // Dio & ApiService
    Dio dio = DioFactory.getDio();
    sl.registerLazySingleton<ApiService>(() => ApiService(dio));

    // login
    sl.registerLazySingleton<LoginRepoImpl>(() => LoginRepoImpl(sl()));
    sl.registerLazySingleton<LoginCubit>(() => LoginCubit(sl()));
  }
}