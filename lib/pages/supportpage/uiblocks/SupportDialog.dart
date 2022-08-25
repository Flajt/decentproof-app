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
              Text("Support Development",
                  style: Theme.of(context).textTheme.headline5),
              const Text(
                "If you like this project, consider checking one of these links out. This will help immensely.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16.0),
              ),
              const KofiButton(
                kofiName: "flajt",
                text: "Support Development",
                kofiColor: KofiColor.Red,
              ),
              const BuyMeACoffeButton(
                buyMeACoffeName: "flajt",
                text: "Help Development",
                color: BuyMeACoffeColor.Green,
              ),
              ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(primary: Colors.white),
                  onPressed: () => launchUrlString(
                      "https://github.com/Flajt/decentproof-app"),
                  icon: const Icon(SimpleIcons.github),
                  label: const Text("Checkout the code"))
            ],
          ),
        ),
      ),
    );
  }
}
