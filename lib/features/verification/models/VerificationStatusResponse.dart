import 'package:decentproof/features/verification/models/OriginstampTimeStampModel.dart';

class VerificationStatusResponsModel {
  final VerificationStatusData data;
  final int errorCode;
  final String error;

  const VerificationStatusResponsModel(this.data, this.errorCode, this.error);

  VerificationStatusResponsModel.fromJson(Map<String, dynamic> json)
      : data = VerificationStatusData.fromJson(json["data"]),
        errorCode = json["error_code"],
        error = json["error_message"];
}

class VerificationStatusData {
  final String comment;
  final bool created;
  final int dateCreated;
  final String hashString;
  final List<OriginstampTimeStampModel> timestamps;

  VerificationStatusData.fromJson(Map<String, dynamic> json)
      : comment = json["comment"],
        created = json["created"],
        dateCreated = json["date_created"],
        hashString = json["hash_string"],
        timestamps = json["timestamps"]
            .map((e) => OriginstampTimeStampModel.fromJson(e))
            .toList();
}
