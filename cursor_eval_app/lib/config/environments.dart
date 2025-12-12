import 'app_environment.dart';

const EnvironmentConfig devConfig = EnvironmentConfig(
  environment: AppEnvironmentType.dev,
  baseUrl: 'https://dev.example.com',
  appNameSuffix: ' DEV',
  enableEdgeToEdge: true,
);

const EnvironmentConfig qaConfig = EnvironmentConfig(
  environment: AppEnvironmentType.qa,
  baseUrl: 'https://qa.example.com',
  appNameSuffix: ' QA',
  enableEdgeToEdge: true,
);

const EnvironmentConfig stagingConfig = EnvironmentConfig(
  environment: AppEnvironmentType.staging,
  baseUrl: 'https://staging.example.com',
  appNameSuffix: ' STAGING',
  enableEdgeToEdge: true,
);

const EnvironmentConfig prodConfig = EnvironmentConfig(
  environment: AppEnvironmentType.prod,
  baseUrl: 'https://api.example.com',
  appNameSuffix: '',
  enableEdgeToEdge: true,
);

