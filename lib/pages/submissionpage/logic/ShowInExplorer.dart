import 'package:url_launcher/url_launcher.dart';

class ShowInExplorer {
  final String _baseUrl = "https://explorer.iota.org/";
  Future<void> show(String messageId, [bool devNet = true]) async {
    String netType = "mainnet";
    if (devNet) {
      netType = "devnet";
    }
    final finalUrl = "$_baseUrl$netType/message/$messageId";
    await launchUrl(Uri.parse(finalUrl));
  }
}
