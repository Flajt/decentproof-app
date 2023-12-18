import 'package:decentproof/features/metadata/bloc/LocationWarningBloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/LocationWarningBlocStates.dart';

class EnableLocationWarning extends StatelessWidget {
  final double width;
  final double height;
  const EnableLocationWarning({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocationWarningBloc, LocationWarningState>(
        builder: (context, state) {
      if (state is LocationServiceDisabled) {
        return Container(
          width: width,
          height: height,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black), color: Colors.redAccent),
          child: Center(
              child: Text(
            "homePage.options.locationWarning",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium,
          ).tr()),
        );
      }
      return Container();
    });
  }
}
