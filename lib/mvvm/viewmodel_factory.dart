import 'package:pb_flutter_mvvm_provider/di/di.dart';
import 'package:pb_flutter_mvvm_provider/mvvm/viewmodel_base.dart';

abstract class ViewModelFactory {
  T create<T extends PBViewModelBase>();
}

class ViewModelFactoryImpl implements ViewModelFactory {
  @override
  T create<T extends PBViewModelBase>() => sl.get<T>();
}
