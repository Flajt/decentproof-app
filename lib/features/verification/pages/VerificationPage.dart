import 'package:decentproof/features/hashing/logic/backend/ShowInExplorer.dart';
import 'package:decentproof/features/verification/bloc/VerificationBloc.dart';
import 'package:decentproof/features/verification/bloc/VerificationBlocEvents.dart';
import 'package:decentproof/features/verification/bloc/VerificationBlocStates.dart';
import 'package:decentproof/features/verification/uiblocks/CheckMarkTable.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/uiblocks/ErrorDialog.dart';

class VerificationPage extends StatelessWidget {
  const VerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<VerificationBloc, VerificationBlocStates>(
            listener: (context, state) {
          if (state is ErrorState) {
            showDialog(
                context: context,
                builder: (context) => ErrorDialog(
                      size: size,
                      error: state.message,
                    ));
          }
        }, builder: (context, state) {
          if (state is InitialState) {
            return Center(
                child: FilledButton(
              onPressed: () =>
                  context.read<VerificationBloc>().add(VerifyHashEvent()),
              child: const Text("verificationPage.selectFile").tr(),
            ));
          } else if (state is VerifiedState) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CheckMarkTable(statusModel: state.statusModel),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    OutlinedButton(
                      onPressed: () =>
                          context.read<VerificationBloc>().add(ResetEvent()),
                      child: const Text("verificationPage.reset").tr(),
                    ),
                    FilledButton(
                        onPressed: () => ShowInExplorer()
                            .show(hash: state.statusModel.transaction),
                        child:
                            const Text("verificationPage.showInExplorer").tr())
                  ],
                )
              ],
            );
          }
          return const Center(child: CircularProgressIndicator.adaptive());
        }),
      ),
    );
  }
}
