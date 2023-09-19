// ignore_for_file: non_constant_identifier_names

import 'package:flutter_dotenv/flutter_dotenv.dart';

final String GET_KEY_URL = dotenv.env["GET_KEY_URL"] ?? "";
final String CHECK_KEY_URL = dotenv.env["CHECK_KEY_URL"] ?? "";
final String SIGN_URL = dotenv.env["SIGN_URL"] ?? "";
// ignore: constant_identifier_names
const String WIKI_URL = "https://github.com/Flajt/decentproof-app/wiki/FAQ";
