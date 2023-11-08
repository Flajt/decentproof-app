import 'package:decentproof/features/hashing/logic/backend/ShowInExplorer.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:url_launcher_platform_interface/url_launcher_platform_interface.dart';
import '../../../mocks.dart';

void main() {
  final MockUrlLauncher mockUrlLauncher = MockUrlLauncher();
  setUp(() => UrlLauncherPlatform.instance = mockUrlLauncher);

  group("ShowInExplorer", () {
    const String testBitcoinTxn =
        "aed3db9ef94953f65e93d56a4e5bcf234d43e27a1b3e7ce0f274cc7ed750d0e2";
    const String testEthTxn =
        "0xfcf561f119707f5ffce1d4c647a6c2fa7523f06fe40ddca78f24ad26cb680cb8";
    final ShowInExplorer showInExplorer = ShowInExplorer();

    group("successfully", () {
      test("launch bitcoin url if bitcoin is passed", () async {
        String url = await showInExplorer.show(transaction: testBitcoinTxn);
        expect(url,
            "https://www.blockchain.com/en/explorer/transactions/btc/$testBitcoinTxn");
      });
      test("launch etherum url if Network.etherium is passed", () async {
        String url = await showInExplorer.show(
            transaction: testEthTxn, network: Network.etherium);
        expect(url,
            "https://www.blockchain.com/en/explorer/transactions/eth/$testEthTxn");
      });
    });
  });
}
