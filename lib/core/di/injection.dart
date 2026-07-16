import 'package:get_it/get_it.dart';
import 'package:myportfolioapp/features/career/data/datasources/career_datasource.dart';
import 'package:myportfolioapp/features/career/data/repository/career_repository_impl.dart';
import 'package:myportfolioapp/features/career/domain/repository/career_repository.dart';
import 'package:myportfolioapp/features/career/domain/usecase/career_data.dart';
import 'package:myportfolioapp/features/career/presentation/bloc/career_bloc.dart';
import 'package:myportfolioapp/features/contact/data/datasource/contact_datasource.dart';
import 'package:myportfolioapp/features/contact/data/repositories/contact_repositories_impl.dart';
import 'package:myportfolioapp/features/contact/domain/repositories/contact_repository.dart';
import 'package:myportfolioapp/features/contact/domain/usecase/contact_data.dart';
import 'package:myportfolioapp/features/contact/presentation/bloc/contact_bloc.dart';
import 'package:myportfolioapp/features/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:myportfolioapp/features/home/data/datasource/home_datasource.dart';
import 'package:myportfolioapp/features/home/data/repository/home_repository_imp.dart';
import 'package:myportfolioapp/features/home/domain/repository/home_repository.dart';
import 'package:myportfolioapp/features/home/domain/usecase/get_home_data.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../features/home/presentation/bloc/home_bloc.dart';

final getIt = GetIt.instance;

Future<void> injectDependency() async {
  getIt.registerLazySingleton<SupabaseClient>(() => Supabase.instance.client);

  //home dependency
  getIt.registerLazySingleton<HomeDatasource>(() => HomeDataSourceImp(getIt()));
  getIt.registerLazySingleton<HomeRepository>(() => HomeRepositoryImp(getIt()));
  getIt.registerLazySingleton(() => GetHomeData(getIt()));
  getIt.registerFactory(() => HomeBloc(getIt()));

  //contact dependency
  getIt.registerLazySingleton<ContactDataSource>(
    () => ContactDataSourceImp(getIt()),
  );
  getIt.registerLazySingleton<ContactRepository>(
    () => ContactRepositoryImpl(getIt()),
  );
  getIt.registerLazySingleton(() => ContactData(getIt(), getIt()));
  getIt.registerFactory(() => ContactBloc(getIt()));

  //career dependency

  getIt.registerLazySingleton<CareerDatasource>(
    () => CareerDatasourceImp(getIt()),
  );
  getIt.registerLazySingleton<CareerRepository>(
    () => CareerRepositoryImpl(getIt()),
  );
  getIt.registerLazySingleton(() => CareerData(getIt()));
  getIt.registerFactory(() => CareerBloc(getIt()));

  //dashboard

  getIt.registerFactory(() => DashBoardBloc());
}
