import 'package:get_it/get_it.dart';
import 'package:myportfolioapp/features/blogs/data/datasource/blog_datasource.dart';
import 'package:myportfolioapp/features/blogs/data/datasource/blog_details_datasource.dart';
import 'package:myportfolioapp/features/blogs/data/repository/blog_repository_impl.dart';
import 'package:myportfolioapp/features/blogs/domain/repository/blog_repository.dart';
import 'package:myportfolioapp/features/blogs/domain/usecase/blog_data.dart';
import 'package:myportfolioapp/features/blogs/domain/usecase/blog_details_data.dart';
import 'package:myportfolioapp/features/blogs/presentation/bloc/blog_bloc.dart';
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
import 'package:myportfolioapp/features/dashboard/data/datasource/category_datasource.dart';
import 'package:myportfolioapp/features/dashboard/data/repository/category_repository_impl.dart';
import 'package:myportfolioapp/features/dashboard/domain/repository/category_respository.dart';
import 'package:myportfolioapp/features/dashboard/domain/usecase/dashboard_data.dart';
import 'package:myportfolioapp/features/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:myportfolioapp/features/home/data/datasource/home_datasource.dart';
import 'package:myportfolioapp/features/home/data/repository/home_repository_imp.dart';
import 'package:myportfolioapp/features/home/domain/repository/home_repository.dart';
import 'package:myportfolioapp/features/home/domain/usecase/get_home_data.dart';
import 'package:myportfolioapp/features/projects/data/datasource/project_datasource.dart';
import 'package:myportfolioapp/features/projects/data/repository/project_repository_impl.dart';
import 'package:myportfolioapp/features/projects/domain/repository/project_repository.dart';
import 'package:myportfolioapp/features/projects/domain/usecase/project_data.dart';
import 'package:myportfolioapp/features/projects/presentation/bloc/project_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../features/blogs/data/repository/blog_details_repository_impl.dart';
import '../../features/blogs/domain/repository/blog_details_repository.dart';
import '../../features/blogs/presentation/bloc/blog_details_bloc.dart';
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

  //project dependency

  getIt.registerLazySingleton<ProjectDatasource>(
    () => ProjectDatasourceImp(getIt()),
  );
  getIt.registerLazySingleton<ProjectRepository>(
    () => ProjectRepositoryImpl(getIt()),
  );
  getIt.registerLazySingleton(() => ProjectData(getIt()));
  getIt.registerFactory(() => ProjectBloc(getIt()));

  //blogs dependency
  getIt.registerLazySingleton<BlogDatasource>(() => BlogDatasourceImp(getIt()));
  getIt.registerLazySingleton<BlogRepository>(
    () => BlogRepositoryImpl(getIt(), getIt()),
  );
  getIt.registerLazySingleton(() => BlogData(getIt()));
  getIt.registerFactory(() => BlogBloc(getIt()));

  //blog details
  getIt.registerLazySingleton<BlogDetailsDatasource>(
    () => BlogDetailsDatasourceImpl(getIt()),
  );

  getIt.registerLazySingleton<BlogDetailsRepository>(
    () => BlogDetailsRepositoryImpl(getIt(), getIt()),
  );
  getIt.registerLazySingleton(() => BlogDetailsData(getIt()));
  getIt.registerFactory(() => BlogDetailsBloc(getIt()));

  //dashboard
  getIt.registerLazySingleton<CategoryDatasource>(
    () => CategoryDatasourceImp(getIt()),
  );
  getIt.registerLazySingleton<CategoryRespository>(
    () => CategoryRepositoryImpl(getIt()),
  );
  getIt.registerLazySingleton(
    () => DashboardData(projectData: getIt(), repository: getIt()),
  );
  getIt.registerFactory(() => DashBoardBloc(getIt(), getIt()));
}
