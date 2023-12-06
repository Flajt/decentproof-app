import 'package:decentproof/features/hashing/bloc/PreparationBloc/PreparationBloc.dart';
import 'package:decentproof/features/hashing/bloc/PreparationBloc/PerparationEvents.dart';
import 'package:decentproof/features/hashing/bloc/PreparationBloc/PerparationStates.dart';
import 'package:decentproof/features/hashing/bloc/SubmissionBloc.dart';
import 'package:decentproof/features/hashing/bloc/SubmissionEvents.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/uiblocks/ErrorDialog.dart';
import '../../../shared/uiblocks/ProcessingDialog.dart';

class ImageButton extends StatelessWidget {
  const ImageButton({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocListener<PreparationBloc, PreparationState>(
      listener: (context, state) {
        if (state is PreparationHasError) {
          Navigator.of(context).pop();
          showDialog(
              context: context,
              builder: (context) =>
                  ErrorDialog(size: size, error: state.errorMsg));
        } else if (state is PreparationIsSuccessfull) {
          context.read<SubmissionBloc>().add(ResetSubmissionState());
          Navigator.of(context).pushNamed("/submissionPage",
              arguments: {"hash": state.hash, "path": state.path});
        } else if (state is PrepareationIsAplyingWaterMark) {
          showDialog(
              context: context, builder: (context) => const ProcessingDialog());
        }
      },
      child: Container(
        width: size.width * .6,
        height: size.height * .2,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 2.0),
            borderRadius: const BorderRadius.all(Radius.circular(20.0))),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(20.0)),
          child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () =>
                    context.read<PreparationBloc>().add(PrepareImage()),
                radius: size.width,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Icon(
                        Icons.camera,
                        size: 100.0,
                      ),
                      Text("videoImagePage.photo".tr(),
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20.0))
                    ]),
              )),
        ),
      ),
    );
  }
}
