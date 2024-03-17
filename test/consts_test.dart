import "package:decentproof/constants.dart";
import "package:flutter_dotenv/flutter_dotenv.dart";
import "package:test/test.dart";

// While it seems senseless at first, this is to figure out if the env vars can be accessed in the CI/CD pipeline.
void main() {
  setUp(() async {
    await dotenv.load(fileName: ".env");
  });
  group(
    "Constants",
    () {
      test("SENTRY_DSN is not empty", () {
        expect(SENTRY_DSN, isNotEmpty);
      });
      test("SIGN_URL is not empty", () {
        expect(SIGN_URL, isNotEmpty);
      });
      test("VERIFY_URL is not empty", () {
        expect(VERIFY_URL, isNotEmpty);
      });
      test("GET_KEY_URL is not empty", () {
        expect(GET_KEY_URL, isNotEmpty);
      });
      test("CHECK_KEY_URL is not empty", () {
        expect(CHECK_KEY_URL, isNotEmpty);
      });
      test("WIKI_URL is not empty", () {
        expect(WIKI_URL, isNotEmpty);
      });
    },
  );
}
