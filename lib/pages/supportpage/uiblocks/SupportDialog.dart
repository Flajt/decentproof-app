import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_donation_buttons/donationButtons/buyMeACoffeButton.dart';
import 'package:flutter_donation_buttons/donationButtons/ko-fiButton.dart';
import 'package:simple_icons/simple_icons.dart';
import 'package:url_launcher/url_launcher_string.dart';

class SupportDialog extends StatelessWidget {
  const SupportDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      child: SingleChildScrollView(
        child: SizedBox(
          height: 350,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("supportPage.title".tr(),
                  style: Theme.of(context).textTheme.headline5),
              const Text(
                "supportPage.description",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16.0),
              ).tr(),
              KofiButton(
                kofiName: "flajt",
                text: "supportPage.support".tr(),
                kofiColor: KofiColor.Red,
              ),
              BuyMeACoffeButton(
                buyMeACoffeName: "flajt",
                text: "supportPage.help".tr(),
                color: BuyMeACoffeColor.Green,
              ),
              ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.white),
                  onPressed: () => launchUrlString(
                      "https://github.com/Flajt/decentproof-app"),
                  icon: const Icon(SimpleIcons.github),
                  label: const Text("supportPage.code").tr())
            ],
          ),
        ),
      ),
    );
  }
}
