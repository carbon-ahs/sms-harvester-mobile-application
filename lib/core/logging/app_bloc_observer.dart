import 'dart:developer' as developer;

import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocObserver extends BlocObserver {
  const AppBlocObserver();

  static const _logName = 'SmsHarvester.Bloc';

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    developer.log(
      '${bloc.runtimeType} event: ${event.runtimeType}',
      name: _logName,
    );
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    developer.log(
      '${bloc.runtimeType} transition: '
      '${transition.currentState.runtimeType} -> '
      '${transition.nextState.runtimeType}',
      name: _logName,
    );
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    developer.log(
      '${bloc.runtimeType} error',
      name: _logName,
      error: error,
      stackTrace: stackTrace,
    );
    super.onError(bloc, error, stackTrace);
  }
}
