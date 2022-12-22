import 'package:get_it/get_it.dart';
import 'package:pb_flutter_mvvm_provider/features/post_details/posts_details_viewmodel.dart';
import 'package:pb_flutter_mvvm_provider/features/posts/posts_viewmodel.dart';
import 'package:pb_flutter_mvvm_provider/main.dart';
import 'package:pb_flutter_mvvm_provider/mvvm/viewmodel_factory.dart';
import 'package:pb_flutter_mvvm_provider/repositories/posts_repository.dart';
import 'package:pb_flutter_mvvm_provider/services/navigation_service.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  sl.registerLazySingleton<ViewModelFactory>(() => ViewModelFactoryImpl());

  sl.registerLazySingleton<NavigationService>(
      () => NavigationService(navigatorKey));
  
  sl.registerLazySingleton<PostsRepository>(() => PostsRepository());

  // ViewModels
  sl.registerFactory(() => PostsViewModel(sl()));
  sl.registerFactory(() => PostsDetailsViewModel(sl()));
}
