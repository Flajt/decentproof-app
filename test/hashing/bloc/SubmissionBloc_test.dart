import 'package:bloc_test/bloc_test.dart';
import 'package:decentproof/features/hashing/bloc/SubmissionBloc.dart';
import 'package:decentproof/features/hashing/bloc/SubmissionEvents.dart';
import 'package:get_it/get_it.dart';
import 'package:test/test.dart';

void main() {
  setUp(() async => await GetIt.I.reset());
  group("SubmissionBloc success", () {
    blocTest("Submit Hash without E-Mail",
        build: () => SubmissionBloc(),
        act: (bloc) => bloc.add(SubmitHash("hash")));
  });
}
