// ignore_for_file: non_constant_identifier_names

import 'package:dotenv/dotenv.dart';

final env = DotEnv(includePlatformEnvironment: true)..load();
final String GET_KEY_URL = env["GET_KEY_URL"] ?? "";
final String CHECK_KEY_URL = env["CHECK_KEY_URL"] ?? "";
final String SIGN_URL = env["SIGN_URL"] ?? "";
