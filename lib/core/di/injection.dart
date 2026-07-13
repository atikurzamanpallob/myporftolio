import 'package:get_it/get_it.dart';
import 'package:myportfolioapp/features/home/data/datasource/home_datasource.dart';
import 'package:myportfolioapp/features/home/data/repository/home_repository_imp.dart';
import 'package:myportfolioapp/features/home/domain/repository/home_repository.dart';
import 'package:myportfolioapp/features/home/domain/usecase/get_home_data.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final getIt = GetIt.instance;

Future<void> injectDependency() async {
  getIt.registerLazySingleton<SupabaseClient>(() => Supabase.instance.client);
  getIt.registerLazySingleton<HomeDatasource>(() => HomeDataSourceImp(getIt()));
  getIt.registerLazySingleton<HomeRepository>(() => HomeRepositoryImp(getIt()));
  getIt.registerLazySingleton(() => GetHomeData(getIt()));
}
