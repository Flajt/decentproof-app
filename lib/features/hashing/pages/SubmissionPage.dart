import 'package:decentproof/features/hashing/bloc/SubmissionBloc.dart';
import 'package:decentproof/features/hashing/bloc/SubmissionEvents.dart';
import 'package:decentproof/features/hashing/bloc/SubmissionState.dart';
import 'package:decentproof/shared/uiblocks/ErrorDialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../uiblocks/BackToHomeButton.dart';
import '../uiblocks/ShareButton.dart';

class SubmissionPage extends StatelessWidget {
  const SubmissionPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Map<String, String> args =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
            child: SizedBox.fromSize(
          size: size,
          child: BlocListener<SubmissionBloc, SubmissionStates>(
            listener: (context, state) {
              if (state is SubmissionError) {
                showDialog(
                    context: context,
                    builder: (context) => ErrorDialog(
                          error: state.message,
                          size: size,
                        ));
              }
            },
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ShareButton(filePath: args["path"]!)),
                ),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: BackToHomeButton(),
                  ),
                ),
                Positioned(
                  height: size.height * .4,
                  width: size.width - 10,
                  top: size.height * .2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SelectableText(
                      "${"submissionPage.hash".tr()}\n\n ${args["hash"]}",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ),
                ),
                BlocBuilder<SubmissionBloc, SubmissionStates>(
                    builder: (context, state) {
                  if (state is SubmissionInitial) {
                    return Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                              onPressed: () async {
                                context
                                    .read<SubmissionBloc>()
                                    .add(SubmitHash(args["hash"]!));
                              },
                              child: const Text("submissionPage.submitt").tr()),
                        ));
                  } else if (state is SubmissionSuccessfull) {
                    return Align(
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("submissionPage.submissionSuccess",
                                  style: Theme.of(context).textTheme.bodyLarge)
                              .tr(),
                          const BackToHomeButton()
                        ],
                      ),
                    );
                  }
                  return const Center(
                      child: CircularProgressIndicator.adaptive());
                })
              ],
            ),
          ),
        )));
  }
}
