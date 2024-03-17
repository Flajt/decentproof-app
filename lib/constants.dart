// ignore_for_file: non_constant_identifier_names, constant_identifier_names

import 'dart:ui';
import 'package:flutter_dotenv/flutter_dotenv.dart';

final String GET_KEY_URL = dotenv.env["GET_KEY_URL"] ?? "";
final String CHECK_KEY_URL = dotenv.env["CHECK_KEY_URL"] ?? "";
final String SIGN_URL = dotenv.env["SIGN_URL"] ?? "";
final String VERIFY_URL = dotenv.env["VERIFY_URL"] ?? "";
final String SENTRY_DSN = dotenv.env["SENTRY_DSN"] ?? "";
const List<Locale> SUPPORTED_LOCALS = [
  Locale("en"),
  Locale("de"),
  Locale("sn"),
  Locale("fr"),
  Locale("jp"),
  Locale("zn"),
  Locale("ar")
];

const String WIKI_URL = "https://github.com/Flajt/decentproof-app/wiki/FAQ";
