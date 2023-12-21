import 'package:decentproof/features/hashing/bloc/PreparationBloc/PreparationBloc.dart';
import 'package:decentproof/features/hashing/bloc/PreparationBloc/PerparationEvents.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImageButton extends StatelessWidget {
  const ImageButton({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
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
              onTap: () => context.read<PreparationBloc>().add(PrepareImage()),
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
    );
  }
}
