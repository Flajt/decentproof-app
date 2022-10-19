import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

List<PageViewModel> introPages = [
  PageViewModel(
      decoration: const PageDecoration(bodyAlignment: Alignment.center),
      title: "Welcome to Decentproof",
      bodyWidget: const Center(
        child: Icon(
          Icons.waving_hand_rounded,
          semanticLabel: "Waving hand",
          size: 150,
        ),
      )),
  PageViewModel(
      decoration: const PageDecoration(bodyAlignment: Alignment.center),
      title: "What can you do?",
      body:
          "With this App you can create multimedia files and later proof that this file has not been tampered with!"),
  PageViewModel(
      decoration: const PageDecoration(bodyAlignment: Alignment.center),
      title: "How does it work?",
      body:
          "Simply select on of the 2 options in the main menu and start creating your file. Supported are: .mp4, .png & .mp3"),
  PageViewModel(
      decoration: const PageDecoration(bodyAlignment: Alignment.center),
      title: "A note about shareing",
      body:
          "You can simply share the file from any App you want, but we recommend you use E-Mail, a Cloud storage or direct export.\n\nIf you use other apps like a chat app you might loose metadata and might not be able to later validate the file!"),
  PageViewModel(
      decoration: const PageDecoration(bodyAlignment: Alignment.center),
      title: "Verifying files",
      body:
          "Thats easy, simply select the third entry in the main Menu and select your file. Everything else is self explantory!"),
  PageViewModel(
      decoration: const PageDecoration(bodyAlignment: Alignment.center),
      title: "Finish",
      body:
          "That's it, if you want to support the App, or would like to get more info about how it works, feel free to check the top right icon, on the main page, out. I would appreciate it!")
];
