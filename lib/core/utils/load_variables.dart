// ignore_for_file: non_constant_identifier_names

late String URL;
late String PUBLIC_KEY;
late String USER_NAME;
late String USER_PASS;
late String STORAGE_URL;

void loadVariables() {
  URL = const String.fromEnvironment('URL', defaultValue: '');
  PUBLIC_KEY = const String.fromEnvironment('PUBLIC_KEY', defaultValue: '');
  USER_NAME = const String.fromEnvironment('USER_NAME', defaultValue: '');
  USER_PASS = const String.fromEnvironment('USER_PASS', defaultValue: '');
  STORAGE_URL = const String.fromEnvironment('STORAGE_URL', defaultValue: '');
}
