import 'package:flutter/material.dart';
import 'package:pb_flutter_mvvm_provider/di/di.dart';
import 'package:pb_flutter_mvvm_provider/features/posts/posts_page.dart';
import 'package:pb_flutter_mvvm_provider/mvvm/global_provider.dart';
import 'package:pb_flutter_mvvm_provider/mvvm/viewmodel_base.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey();
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GlobalProvider(
      child: MaterialApp(
        title: 'Flutter Demo',
          navigatorKey: navigatorKey,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: PostsPage(NoParam())
      ),
    );
  }
}
