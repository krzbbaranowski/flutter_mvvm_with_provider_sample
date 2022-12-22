import 'package:flutter/material.dart';
import 'package:pb_flutter_mvvm_provider/di/di.dart';
import 'package:pb_flutter_mvvm_provider/mvvm/viewmodel_factory.dart';
import 'package:provider/provider.dart';

class GlobalProvider extends StatelessWidget {
  const GlobalProvider({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider.value(value: sl.get<ViewModelFactory>()),
      ],
      child: child,
    );
  }
}
