import 'dart:ui';

import 'package:decentproof/constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization/src/easy_localization_controller.dart';
import 'package:easy_localization/src/localization.dart';

/// Load translations from assets and keep them in memory
/// Can be used to load translations in foreground services etc
/// Please also use `final Localization L = Localization.instance;` in the foreground service with `L.tr("my.key")`
/// See: https://github.com/aissat/easy_localization/issues/210#issuecomment-806089855
Future<void> loadTranslations() async {
  //this will only set EasyLocalizationController.savedLocale
  await EasyLocalizationController.initEasyLocation();

  final controller = EasyLocalizationController(
    saveLocale: true, //mandatory to use EasyLocalizationController.savedLocale
    fallbackLocale: const Locale('en'),
    supportedLocales: SUPPORTED_LOCALS,
    assetLoader: const RootBundleAssetLoader(),
    useOnlyLangCode: true,
    useFallbackTranslations: true,
    path: "assets/translations",
    onLoadError: (e) {},
  );

  //Load translations from assets
  await controller.loadTranslations();

  //load translations into exploitable data, kept in memory
  Localization.load(controller.locale,
      translations: controller.translations,
      fallbackTranslations: controller.fallbackTranslations);
}
