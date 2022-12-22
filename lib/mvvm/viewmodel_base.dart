import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

abstract class PBViewModelBase<TInitParameter, TVMParameter extends StateData>
    extends ValueListenable<TVMParameter> {
  PBViewModelBase(TVMParameter initial)
      : _stateDataNotifier = ValueNotifier(initial) {
    stateData = initial;
  }

  late TVMParameter _stateData;

  TVMParameter get stateData => _stateData;

  Future<void> initialize(TInitParameter parameter);

  void onResume() {}

  @mustCallSuper
  void onDispose() {
    _stateDataNotifier.dispose();
    debugPrint("$runtimeType disposed...");
  }

  final ValueNotifier<TVMParameter> _stateDataNotifier;

  @protected
  set stateData(TVMParameter value) {
    _stateData = value;
    _stateDataNotifier.value = value;
  }

  @override
  TVMParameter get value => _stateDataNotifier.value;

  @override
  void addListener(VoidCallback listener) {
    _stateDataNotifier.addListener(listener);
  }

  @override
  void removeListener(VoidCallback listener) {
    _stateDataNotifier.removeListener(listener);
  }
}

abstract class StateData extends Equatable {
  const StateData();
}

class NoParam {}
