import 'package:flutter/material.dart';
import 'package:pb_flutter_mvvm_provider/mvvm/viewmodel_base.dart';
import 'package:pb_flutter_mvvm_provider/mvvm/viewmodel_factory.dart';
import 'package:provider/provider.dart';

final RouteObserver<ModalRoute> routeObserver = RouteObserver<ModalRoute>();

abstract class ParamStatefulWidget<TInitParameter> extends StatefulWidget {
  final TInitParameter _param;

  const ParamStatefulWidget(this._param, {Key? key}) : super(key: key);

  TInitParameter get param => _param;

  @override
  // ignore: no_logic_in_create_state
  State createState() => createMVVMState();

  PBMVVMPage createMVVMState();
}

abstract class PBMVVMPage<
    T extends ParamStatefulWidget,
    VM extends PBViewModelBase<TInitParameter, TVMParameter>,
    TInitParameter,
    TVMParameter extends StateData> extends State<T> with RouteAware {
  late final VM _viewModel;

  VM get viewModel => _viewModel;

  @override
  @mustCallSuper
  void initState() {
    _viewModel = context.read<ViewModelFactory>().create<VM>();
    _viewModel.initialize(widget.param);
    super.initState();
  }

  Widget buildContent(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ValueListenableProvider<TVMParameter>.value(value: viewModel),
      ],
      builder: (context, _) => buildContent(context),
    );
  }

  @override
  @mustCallSuper
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context)!);
  }

  @override
  @mustCallSuper
  void dispose() {
    routeObserver.unsubscribe(this);
    viewModel.onDispose();
    super.dispose();
  }

  @override
  @mustCallSuper
  void didPush() {}

  @override
  @mustCallSuper
  void didPopNext() {
    viewModel.onResume();
  }
}
