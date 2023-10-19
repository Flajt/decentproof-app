import 'package:url_launcher/url_launcher.dart';

enum Network { bitcoin, etherium }

class ShowInExplorer {
  final String _baseUrl =
      "https://www.blockchain.com/en/explorer/transactions/";
  Future<void> show(
      {required String hash, Network network = Network.bitcoin}) async {
    String urlWithNetwork = _baseUrl;
    switch (network) {
      case Network.bitcoin:
        urlWithNetwork += "btc";
        break;
      case Network.etherium:
        urlWithNetwork += "eth";
        break;
      default:
        urlWithNetwork += "btc";
        break;
    }
    final finalUrl = "$urlWithNetwork/$hash";
    await launchUrl(Uri.parse(finalUrl));
  }
}
