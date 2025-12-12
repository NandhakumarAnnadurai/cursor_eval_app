import 'package:flutter/material.dart';

import 'app.dart';
import 'config/app_environment.dart';
import 'config/system_ui.dart';

Future<void> bootstrap(EnvironmentConfig config) async {
  WidgetsFlutterBinding.ensureInitialized();
  AppEnvironmentManager.init(config);
  await configureSystemUi(enableEdgeToEdge: config.enableEdgeToEdge);
  runApp(const App());
}

