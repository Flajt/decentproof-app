import 'package:decentproof/features/hashing/bloc/PreparationBloc/PerparationStates.dart';
import 'package:decentproof/features/hashing/bloc/PreparationBloc/PreparationBloc.dart';
import 'package:decentproof/features/hashing/bloc/SubmissionBloc.dart';
import 'package:decentproof/features/hashing/bloc/SubmissionEvents.dart';
import 'package:decentproof/shared/uiblocks/ErrorDialog.dart';
import 'package:decentproof/shared/uiblocks/ProcessingDialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../uiblocks/ImageButton.dart';
import '../uiblocks/VideoButton.dart';

class VideoImagePage extends StatelessWidget {
  const VideoImagePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        // Note to self: WithForegroundTask was here
        body: SafeArea(
            child: BlocListener<PreparationBloc, PreparationState>(
      listener: (context, state) {
        if (state is PreparationHasError) {
          Navigator.of(context).pop();
          showDialog(
              context: context,
              builder: (context) =>
                  ErrorDialog(size: size, error: state.errorMsg));
        } else if (state is PreparationIsSuccessfull) {
          Navigator.of(context).pop();
          context.read<SubmissionBloc>().add(ResetSubmissionState());
          Navigator.of(context).pushReplacementNamed(
              "/submissionPage", // This or popAndPushNamed should only be used here to prevent issues with repeating listener build calls
              arguments: {"hash": state.hash, "path": state.path});
        } else if (state is PrepareationIsAplyingWaterMark) {
          showDialog(
              context: context, builder: (context) => const ProcessingDialog());
        }
      },
      child: SizedBox(
          width: size.width,
          height: size.height,
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [ImageButton(), VideoButton()],
          )),
    )));
  }
}
