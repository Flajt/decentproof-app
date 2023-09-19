import 'package:json_annotation/json_annotation.dart';
import 'package:collection/collection.dart';

enum PeerRelation {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('known')
  known('known'),
  @JsonValue('unknown')
  unknown('unknown'),
  @JsonValue('autopeered')
  autopeered('autopeered');

  final String? value;

  const PeerRelation(this.value);
}

enum MessageMetadataResponse$DataLedgerInclusionState {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('included')
  included('included'),
  @JsonValue('conflicting')
  conflicting('conflicting'),
  @JsonValue('noTransaction')
  notransaction('noTransaction');

  final String? value;

  const MessageMetadataResponse$DataLedgerInclusionState(this.value);
}
