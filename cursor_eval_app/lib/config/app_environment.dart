enum AppEnvironmentType {
  dev,
  qa,
  staging,
  prod,
}

class EnvironmentConfig {
  const EnvironmentConfig({
    required this.environment,
    required this.baseUrl,
    this.appNameSuffix = '',
    this.enableEdgeToEdge = true,
  });

  final AppEnvironmentType environment;
  final String baseUrl;
  final String appNameSuffix;
  final bool enableEdgeToEdge;
}

class AppEnvironmentState {
  const AppEnvironmentState(this._config);

  final EnvironmentConfig _config;

  EnvironmentConfig get config => _config;
}

class AppEnvironmentManager {
  static AppEnvironmentState? _state;

  static void init(EnvironmentConfig config) {
    _state = AppEnvironmentState(config);
  }

  static EnvironmentConfig get config {
    final currentState = _state;
    if (currentState == null) {
      throw StateError('AppEnvironmentManager not initialized');
    }
    return currentState.config;
  }
}

