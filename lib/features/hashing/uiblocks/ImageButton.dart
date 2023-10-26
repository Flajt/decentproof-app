import 'package:decentproof/features/hashing/bloc/metaDataBloc/MetaDataBloc.dart';
import 'package:decentproof/features/hashing/bloc/metaDataBloc/MetaDataEvents.dart';
import 'package:decentproof/features/hashing/bloc/metaDataBloc/MetaDataStates.dart';
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
    return BlocListener<MetaDataBloc, MetaDataState>(
      listener: (context, state) {
        if (state is MetaDataHasError) {
          Navigator.of(context).pop();
          showDialog(
              context: context,
              builder: (context) =>
                  ErrorDialog(size: size, error: state.errorMsg));
        } else if (state is MetaDataIsSuccessfull) {
          Navigator.of(context).pushNamed("/submissionPage",
              arguments: {"hash": state.hash, "path": state.path});
        } else if (state is MetaDataIsAplyingWaterMark) {
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
        child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () =>
                  context.read<MetaDataBloc>().add(ApplyMetaDataToImage()),
              radius: size.width,
              splashColor: Colors.orangeAccent,
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
    );
  }
}
