import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

// This class is kinda mad designed, will be removed as soon as Android Support for audio is working
class IntroPages {
  final List<PageViewModel> _pages = [
    PageViewModel(
        decoration: const PageDecoration(bodyAlignment: Alignment.center),
        title: "introPage.title0".tr(),
        bodyWidget: const Center(
          child: Icon(
            Icons.waving_hand_rounded,
            semanticLabel: "Waving hand",
            size: 150,
          ),
        )),
    PageViewModel(
        decoration: const PageDecoration(bodyAlignment: Alignment.center),
        title: "introPage.title1".tr(),
        body: "introPage.body1".tr()),
    PageViewModel(
        decoration: const PageDecoration(bodyAlignment: Alignment.center),
        title: "introPage.title2".tr(),
        body: "introPage.body2".tr()),
    PageViewModel(
        decoration: const PageDecoration(bodyAlignment: Alignment.center),
        title: "introPage.title3".tr(),
        body: "introPage.body3".tr()),
    PageViewModel(
        decoration: const PageDecoration(bodyAlignment: Alignment.center),
        title: "introPage.title4".tr(),
        body: "introPage.body4".tr()),
    PageViewModel(
        decoration: const PageDecoration(bodyAlignment: Alignment.center),
        title: "introPage.title5".tr(),
        body: "introPage.body5".tr())
  ];

  List<PageViewModel> get introPages {
    if (Platform.isAndroid) {
      _pages.add(PageViewModel(
          decoration: const PageDecoration(bodyAlignment: Alignment.center),
          title: "introPage.tempTitle".tr(),
          body: "introPage.tempBody".tr()));
    }
    return _pages;
  }
}
