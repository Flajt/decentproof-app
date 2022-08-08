import 'package:json_annotation/json_annotation.dart';

enum PeerRelation {
  @JsonValue('swaggerGeneratedUnknown')
  swaggerGeneratedUnknown,
  @JsonValue('known')
  known,
  @JsonValue('unknown')
  unknown,
  @JsonValue('autopeered')
  autopeered
}

const $PeerRelationMap = {
  PeerRelation.known: 'known',
  PeerRelation.unknown: 'unknown',
  PeerRelation.autopeered: 'autopeered'
};

enum MessageMetadataResponse$DataLedgerInclusionState {
  @JsonValue('swaggerGeneratedUnknown')
  swaggerGeneratedUnknown,
  @JsonValue('included')
  included,
  @JsonValue('conflicting')
  conflicting,
  @JsonValue('noTransaction')
  notransaction
}

const $MessageMetadataResponse$DataLedgerInclusionStateMap = {
  MessageMetadataResponse$DataLedgerInclusionState.included: 'included',
  MessageMetadataResponse$DataLedgerInclusionState.conflicting: 'conflicting',
  MessageMetadataResponse$DataLedgerInclusionState.notransaction:
      'noTransaction'
};
