import 'package:url_launcher/url_launcher.dart';

enum Network { bitcoin, etherium }

class ShowInExplorer {
  final String _baseUrl =
      "https://www.blockchain.com/en/explorer/transactions/";
  Future<String> show(
      {required String transaction, Network network = Network.bitcoin}) async {
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
    final finalUrl = "$urlWithNetwork/$transaction";
    await launchUrl(Uri.parse(finalUrl));
    return finalUrl;
  }
}
