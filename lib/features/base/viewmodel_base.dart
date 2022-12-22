import 'package:pb_flutter_mvvm_provider/di/di.dart';
import 'package:pb_flutter_mvvm_provider/mvvm/viewmodel_base.dart';
import 'package:pb_flutter_mvvm_provider/services/navigation_service.dart';

abstract class ViewModelBase<TParameter, TVMParameter extends StateData>
    extends PBViewModelBase<TParameter, TVMParameter> {
  late TParameter parameter;

  final NavigationService navigationService = sl();

  ViewModelBase(TVMParameter initial) : super(initial);
}
