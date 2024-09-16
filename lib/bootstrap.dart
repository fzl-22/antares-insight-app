import 'dart:async';
import 'dart:developer';

import 'package:antares_insight_app/core/injection/injection.dart';
import 'package:antares_insight_app/core/utils/logger.dart';
import 'package:antares_insight_app/firebase_options.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:permission_handler/permission_handler.dart';

class AppBlocObserver extends BlocObserver {
  const AppBlocObserver();
  @override
  void onEvent(Bloc<dynamic, dynamic> bloc, Object? event) {
    super.onEvent(bloc, event);
    AppLogger.debug('onEvent(${bloc.runtimeType}, $event)');
  }

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    AppLogger.debug('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    AppLogger.error('onError(${bloc.runtimeType}, $error, $stackTrace)');
  }
}

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  WidgetsFlutterBinding.ensureInitialized();

  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  Bloc.observer = const AppBlocObserver();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.android);

  // initializes dependencies
  await initDependencies();

  // request notification permission if denied
  final notificationIsDenied = await Permission.notification.isDenied;
  if (notificationIsDenied) {
    await Permission.notification.request();
  }

  runApp(await builder());
}
