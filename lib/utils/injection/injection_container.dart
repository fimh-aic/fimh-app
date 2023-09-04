import 'package:fimh_app/data/datasources/remote_datasource.dart';
import 'package:fimh_app/data/repositories/repository_impl.dart';
import 'package:fimh_app/domain/repositories/repository.dart';
import 'package:fimh_app/domain/usecase/get_food.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import '../../domain/usecase/get_food_name.dart';

final sl = GetIt.instance;

Future<void> setUpLocator() async {
  sl.registerLazySingleton(() => GetFood(repository: sl()));
  sl.registerLazySingleton(() => GetFoodName(repository: sl()));

  sl.registerLazySingleton<Repository>(
    () => RepositoryImpl(
      remoteDataSource: sl(),
    ),
  );

  sl.registerLazySingleton<RemoteDataSource>(
    () => RemoteDataSourceImpl(),
  );

  sl.registerLazySingleton<RepositoryImpl>(
    () => RepositoryImpl(
      remoteDataSource: sl(),
    ),
  );

  sl.registerLazySingleton(() => http.Client());
}
