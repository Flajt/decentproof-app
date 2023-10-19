class OriginstampTimeStampModel {
  const OriginstampTimeStampModel(this.seedId, this.currencyId,
      this.transaction, this.privateKey, this.timestamp, this.submitStatus);
  final String seedId;

  /// 0:
  /// 1: Bitcoin
  /// 2: Ethereum
  /// 3: Südkurier

  final int currencyId;
  final String transaction;
  final String privateKey;
  final int timestamp;

  /// 0: Hashes contained in this seed were only submitted to OriginStamp and added to the timestamping queue. They will be timestamped with the next timestamp submission.
  /// 1: Hashes contained in this seed were submitted to the blockchain network, but are not yet included.
  /// 2: Hashes contained in this seed are included in the latest block.
  /// 3: Hashes contained in this seed have a tamper-proof timestamp.
  final int submitStatus;

  OriginstampTimeStampModel.fromJson(Map<String, dynamic> json)
      : seedId = json["seed_id"],
        currencyId = json["currency_id"],
        transaction = json["transaction"],
        privateKey = json["private_key"],
        timestamp = json["timestamp"],
        submitStatus = json["submit_status"];
}
