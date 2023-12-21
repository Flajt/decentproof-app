import 'package:decentproof/features/metadata/uiblocks/EnableLocationWarning.dart';
import 'package:decentproof/features/review/logic/InAppReviewWrapper.dart';
import 'package:decentproof/shared/util/RequestUtil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_simple_updates/flutter_simple_updates.dart';
import 'package:simple_mastodon_updates/logic/SimpleMastodonParser.dart';

import '../../metadata/bloc/LocationWarningBloc.dart';
import '../../metadata/bloc/LocationWarningBlocEvents.dart';
import '../uiblocks/OptionsMenu.dart';
import '../uiblocks/SettingsButton.dart';
import '../uiblocks/SupportButton.dart';

class HomePage extends StatelessWidget {
  late final Future<void> request;
  final SimpleMastodonParser feedProvider =
      SimpleMastodonParser("!", "https://mastodon.world/@Decentproof");
  HomePage({Key? key}) : super(key: key) {
    request = RequestUtil.updateOrRetriveKey();
    InAppReviewWrapper.requestReview();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    context.read<LocationWarningBloc>().add(CheckLocationService());
    return Scaffold(
      body: SafeArea(
          child: SizedBox(
        width: size.width,
        height: size.height,
        child: Stack(children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: EnableLocationWarning(
                width: size.width, height: size.height * .08),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: NotificationWidget(
                  feedProvider: feedProvider, cache: HiveCacheWrapper()),
            ),
          ),
          const Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: SettingsButton(),
              )),
          Align(
              alignment: Alignment.center,
              child: FutureBuilder(
                future: request,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                        child: Text(
                      snapshot.error.toString(),
                      textAlign: TextAlign.center,
                    ));
                  } else if (snapshot.hasError == false &&
                      snapshot.connectionState == ConnectionState.done) {
                    return const OptionsMenu();
                  }
                  return const Center(
                      child: CircularProgressIndicator(
                          backgroundColor: Colors.white, strokeWidth: 10));
                },
              )),
          const Align(
              alignment: Alignment.topRight,
              child:
                  Padding(padding: EdgeInsets.all(8.0), child: SupportButton()))
        ]),
      )),
    );
  }
}
