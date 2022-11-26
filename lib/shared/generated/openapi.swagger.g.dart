// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'openapi.swagger.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Message _$MessageFromJson(Map<String, dynamic> json) => Message(
      networkId: json['networkId'] as String,
      parentMessageIds: (json['parentMessageIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      payload: json['payload'],
      nonce: json['nonce'] as String,
    );

Map<String, dynamic> _$MessageToJson(Message instance) => <String, dynamic>{
      'networkId': instance.networkId,
      'parentMessageIds': instance.parentMessageIds,
      'payload': instance.payload,
      'nonce': instance.nonce,
    };

TransactionPayload _$TransactionPayloadFromJson(Map<String, dynamic> json) =>
    TransactionPayload(
      type: json['type'] as int,
      essence: json['essence'] as Object,
      unlockBlocks: (json['unlockBlocks'] as List<dynamic>?)
              ?.map((e) => e as Object)
              .toList() ??
          [],
    );

Map<String, dynamic> _$TransactionPayloadToJson(TransactionPayload instance) =>
    <String, dynamic>{
      'type': instance.type,
      'essence': instance.essence,
      'unlockBlocks': instance.unlockBlocks,
    };

TransactionEssence _$TransactionEssenceFromJson(Map<String, dynamic> json) =>
    TransactionEssence(
      type: json['type'] as int,
      inputs: (json['inputs'] as List<dynamic>?)
              ?.map((e) => e as Object)
              .toList() ??
          [],
      outputs: (json['outputs'] as List<dynamic>?)
              ?.map((e) => e as Object)
              .toList() ??
          [],
      payload: json['payload'],
    );

Map<String, dynamic> _$TransactionEssenceToJson(TransactionEssence instance) =>
    <String, dynamic>{
      'type': instance.type,
      'inputs': instance.inputs,
      'outputs': instance.outputs,
      'payload': instance.payload,
    };

UTXOInput _$UTXOInputFromJson(Map<String, dynamic> json) => UTXOInput(
      type: json['type'] as int,
      transactionId: json['transactionId'] as String,
      transactionOutputIndex: json['transactionOutputIndex'] as int,
    );

Map<String, dynamic> _$UTXOInputToJson(UTXOInput instance) => <String, dynamic>{
      'type': instance.type,
      'transactionId': instance.transactionId,
      'transactionOutputIndex': instance.transactionOutputIndex,
    };

SigLockedSingleOutput _$SigLockedSingleOutputFromJson(
        Map<String, dynamic> json) =>
    SigLockedSingleOutput(
      type: json['type'] as int,
      address: json['address'],
      amount: json['amount'] as int,
    );

Map<String, dynamic> _$SigLockedSingleOutputToJson(
        SigLockedSingleOutput instance) =>
    <String, dynamic>{
      'type': instance.type,
      'address': instance.address,
      'amount': instance.amount,
    };

SigLockedDustAllowanceOutput _$SigLockedDustAllowanceOutputFromJson(
        Map<String, dynamic> json) =>
    SigLockedDustAllowanceOutput(
      type: json['type'] as int,
      address: json['address'],
      amount: json['amount'] as int,
    );

Map<String, dynamic> _$SigLockedDustAllowanceOutputToJson(
        SigLockedDustAllowanceOutput instance) =>
    <String, dynamic>{
      'type': instance.type,
      'address': instance.address,
      'amount': instance.amount,
    };

Ed25519Address _$Ed25519AddressFromJson(Map<String, dynamic> json) =>
    Ed25519Address(
      type: json['type'] as int,
      address: json['address'] as String,
    );

Map<String, dynamic> _$Ed25519AddressToJson(Ed25519Address instance) =>
    <String, dynamic>{
      'type': instance.type,
      'address': instance.address,
    };

SignatureUnlockBlock _$SignatureUnlockBlockFromJson(
        Map<String, dynamic> json) =>
    SignatureUnlockBlock(
      type: json['type'] as int,
      signature: json['signature'] as Object,
    );

Map<String, dynamic> _$SignatureUnlockBlockToJson(
        SignatureUnlockBlock instance) =>
    <String, dynamic>{
      'type': instance.type,
      'signature': instance.signature,
    };

Ed25519Signature _$Ed25519SignatureFromJson(Map<String, dynamic> json) =>
    Ed25519Signature(
      type: json['type'] as int,
      publicKey: json['publicKey'] as String,
      signature: json['signature'] as String,
    );

Map<String, dynamic> _$Ed25519SignatureToJson(Ed25519Signature instance) =>
    <String, dynamic>{
      'type': instance.type,
      'publicKey': instance.publicKey,
      'signature': instance.signature,
    };

ReferenceUnlockBlock _$ReferenceUnlockBlockFromJson(
        Map<String, dynamic> json) =>
    ReferenceUnlockBlock(
      type: json['type'] as int,
      reference: json['reference'] as int,
    );

Map<String, dynamic> _$ReferenceUnlockBlockToJson(
        ReferenceUnlockBlock instance) =>
    <String, dynamic>{
      'type': instance.type,
      'reference': instance.reference,
    };

MilestonePayload _$MilestonePayloadFromJson(Map<String, dynamic> json) =>
    MilestonePayload(
      type: json['type'] as int,
      index: json['index'] as int,
      timestamp: json['timestamp'] as int,
      parents: (json['parents'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      inclusionMerkleProof: json['inclusionMerkleProof'] as String,
      nextPoWScore: (json['nextPoWScore'] as num).toDouble(),
      nextPoWScoreMilestoneIndex:
          (json['nextPoWScoreMilestoneIndex'] as num).toDouble(),
      publicKeys: (json['publicKeys'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      signatures: (json['signatures'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
    );

Map<String, dynamic> _$MilestonePayloadToJson(MilestonePayload instance) =>
    <String, dynamic>{
      'type': instance.type,
      'index': instance.index,
      'timestamp': instance.timestamp,
      'parents': instance.parents,
      'inclusionMerkleProof': instance.inclusionMerkleProof,
      'nextPoWScore': instance.nextPoWScore,
      'nextPoWScoreMilestoneIndex': instance.nextPoWScoreMilestoneIndex,
      'publicKeys': instance.publicKeys,
      'signatures': instance.signatures,
    };

IndexationPayload _$IndexationPayloadFromJson(Map<String, dynamic> json) =>
    IndexationPayload(
      type: json['type'] as int,
      index: json['index'] as String,
      data: json['data'] as String,
    );

Map<String, dynamic> _$IndexationPayloadToJson(IndexationPayload instance) =>
    <String, dynamic>{
      'type': instance.type,
      'index': instance.index,
      'data': instance.data,
    };

TreasuryTransactionPayload _$TreasuryTransactionPayloadFromJson(
        Map<String, dynamic> json) =>
    TreasuryTransactionPayload(
      type: json['type'] as int,
      input: TreasuryInput.fromJson(json['input'] as Map<String, dynamic>),
      output: TreasuryOutput.fromJson(json['output'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TreasuryTransactionPayloadToJson(
        TreasuryTransactionPayload instance) =>
    <String, dynamic>{
      'type': instance.type,
      'input': instance.input.toJson(),
      'output': instance.output.toJson(),
    };

TreasuryInput _$TreasuryInputFromJson(Map<String, dynamic> json) =>
    TreasuryInput(
      type: json['type'] as int,
      milestoneId: json['milestoneId'] as String,
    );

Map<String, dynamic> _$TreasuryInputToJson(TreasuryInput instance) =>
    <String, dynamic>{
      'type': instance.type,
      'milestoneId': instance.milestoneId,
    };

TreasuryOutput _$TreasuryOutputFromJson(Map<String, dynamic> json) =>
    TreasuryOutput(
      type: json['type'] as int,
      amount: json['amount'] as int,
    );

Map<String, dynamic> _$TreasuryOutputToJson(TreasuryOutput instance) =>
    <String, dynamic>{
      'type': instance.type,
      'amount': instance.amount,
    };

Peer _$PeerFromJson(Map<String, dynamic> json) => Peer(
      id: json['id'] as String,
      multiAddresses: (json['multiAddresses'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      alias: json['alias'] as String?,
      relation: peerRelationFromJson(json['relation']),
      connected: json['connected'] as bool,
      gossip: Gossip.fromJson(json['gossip'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PeerToJson(Peer instance) => <String, dynamic>{
      'id': instance.id,
      'multiAddresses': instance.multiAddresses,
      'alias': instance.alias,
      'relation': peerRelationToJson(instance.relation),
      'connected': instance.connected,
      'gossip': instance.gossip.toJson(),
    };

Gossip _$GossipFromJson(Map<String, dynamic> json) => Gossip(
      heartbeat: json['heartbeat'] == null
          ? null
          : Heartbeat.fromJson(json['heartbeat'] as Map<String, dynamic>),
      metrics: json['metrics'] == null
          ? null
          : Metrics.fromJson(json['metrics'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GossipToJson(Gossip instance) => <String, dynamic>{
      'heartbeat': instance.heartbeat?.toJson(),
      'metrics': instance.metrics?.toJson(),
    };

Heartbeat _$HeartbeatFromJson(Map<String, dynamic> json) => Heartbeat(
      solidMilestoneIndex: json['solidMilestoneIndex'] as int?,
      prunedMilestoneIndex: json['prunedMilestoneIndex'] as int?,
      latestMilestoneIndex: json['latestMilestoneIndex'] as int?,
      connectedNeighbors: json['connectedNeighbors'] as int?,
      syncedNeighbors: json['syncedNeighbors'] as int?,
    );

Map<String, dynamic> _$HeartbeatToJson(Heartbeat instance) => <String, dynamic>{
      'solidMilestoneIndex': instance.solidMilestoneIndex,
      'prunedMilestoneIndex': instance.prunedMilestoneIndex,
      'latestMilestoneIndex': instance.latestMilestoneIndex,
      'connectedNeighbors': instance.connectedNeighbors,
      'syncedNeighbors': instance.syncedNeighbors,
    };

Metrics _$MetricsFromJson(Map<String, dynamic> json) => Metrics(
      newMessages: json['newMessages'] as int,
      knownMessages: json['knownMessages'] as int,
      receivedMessages: json['receivedMessages'] as int,
      receivedMessageRequests: json['receivedMessageRequests'] as int,
      receivedMilestoneRequests: json['receivedMilestoneRequests'] as int,
      receivedHeartbeats: json['receivedHeartbeats'] as int,
      sentMessages: json['sentMessages'] as int,
      sentMessageRequests: json['sentMessageRequests'] as int,
      sentMilestoneRequests: json['sentMilestoneRequests'] as int,
      sentHeartbeats: json['sentHeartbeats'] as int,
      droppedPackets: json['droppedPackets'] as int,
    );

Map<String, dynamic> _$MetricsToJson(Metrics instance) => <String, dynamic>{
      'newMessages': instance.newMessages,
      'knownMessages': instance.knownMessages,
      'receivedMessages': instance.receivedMessages,
      'receivedMessageRequests': instance.receivedMessageRequests,
      'receivedMilestoneRequests': instance.receivedMilestoneRequests,
      'receivedHeartbeats': instance.receivedHeartbeats,
      'sentMessages': instance.sentMessages,
      'sentMessageRequests': instance.sentMessageRequests,
      'sentMilestoneRequests': instance.sentMilestoneRequests,
      'sentHeartbeats': instance.sentHeartbeats,
      'droppedPackets': instance.droppedPackets,
    };

ReceiptTuple _$ReceiptTupleFromJson(Map<String, dynamic> json) => ReceiptTuple(
      receipt: ReceiptPayload.fromJson(json['receipt'] as Map<String, dynamic>),
      milestoneIndex: json['milestoneIndex'] as int,
    );

Map<String, dynamic> _$ReceiptTupleToJson(ReceiptTuple instance) =>
    <String, dynamic>{
      'receipt': instance.receipt.toJson(),
      'milestoneIndex': instance.milestoneIndex,
    };

ReceiptPayload _$ReceiptPayloadFromJson(Map<String, dynamic> json) =>
    ReceiptPayload(
      migratedAt: json['migratedAt'] as int,
      $final: json['final'] as bool,
      funds: (json['funds'] as List<dynamic>?)
              ?.map(
                  (e) => MigratedFundsEntry.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      transaction: TreasuryTransactionPayload.fromJson(
          json['transaction'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ReceiptPayloadToJson(ReceiptPayload instance) =>
    <String, dynamic>{
      'migratedAt': instance.migratedAt,
      'final': instance.$final,
      'funds': instance.funds.map((e) => e.toJson()).toList(),
      'transaction': instance.transaction.toJson(),
    };

MigratedFundsEntry _$MigratedFundsEntryFromJson(Map<String, dynamic> json) =>
    MigratedFundsEntry(
      tailTransactionHash: json['tailTransactionHash'] as String,
      address: json['address'],
      deposit: json['deposit'] as int,
    );

Map<String, dynamic> _$MigratedFundsEntryToJson(MigratedFundsEntry instance) =>
    <String, dynamic>{
      'tailTransactionHash': instance.tailTransactionHash,
      'address': instance.address,
      'deposit': instance.deposit,
    };

ErrorResponse _$ErrorResponseFromJson(Map<String, dynamic> json) =>
    ErrorResponse(
      error:
          ErrorResponse$Error.fromJson(json['error'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ErrorResponseToJson(ErrorResponse instance) =>
    <String, dynamic>{
      'error': instance.error.toJson(),
    };

ForbiddenResponse _$ForbiddenResponseFromJson(Map<String, dynamic> json) =>
    ForbiddenResponse(
      error: ForbiddenResponse$Error.fromJson(
          json['error'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ForbiddenResponseToJson(ForbiddenResponse instance) =>
    <String, dynamic>{
      'error': instance.error.toJson(),
    };

ServiceUnavailableResponse _$ServiceUnavailableResponseFromJson(
        Map<String, dynamic> json) =>
    ServiceUnavailableResponse(
      error: ServiceUnavailableResponse$Error.fromJson(
          json['error'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ServiceUnavailableResponseToJson(
        ServiceUnavailableResponse instance) =>
    <String, dynamic>{
      'error': instance.error.toJson(),
    };

BadRequestResponse _$BadRequestResponseFromJson(Map<String, dynamic> json) =>
    BadRequestResponse(
      error: BadRequestResponse$Error.fromJson(
          json['error'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BadRequestResponseToJson(BadRequestResponse instance) =>
    <String, dynamic>{
      'error': instance.error.toJson(),
    };

NotFoundResponse _$NotFoundResponseFromJson(Map<String, dynamic> json) =>
    NotFoundResponse(
      error: NotFoundResponse$Error.fromJson(
          json['error'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NotFoundResponseToJson(NotFoundResponse instance) =>
    <String, dynamic>{
      'error': instance.error.toJson(),
    };

InternalErrorResponse _$InternalErrorResponseFromJson(
        Map<String, dynamic> json) =>
    InternalErrorResponse(
      error: InternalErrorResponse$Error.fromJson(
          json['error'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$InternalErrorResponseToJson(
        InternalErrorResponse instance) =>
    <String, dynamic>{
      'error': instance.error.toJson(),
    };

InfoResponse _$InfoResponseFromJson(Map<String, dynamic> json) => InfoResponse(
      data: InfoResponse$Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$InfoResponseToJson(InfoResponse instance) =>
    <String, dynamic>{
      'data': instance.data.toJson(),
    };

TipsResponse _$TipsResponseFromJson(Map<String, dynamic> json) => TipsResponse(
      data: TipsResponse$Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TipsResponseToJson(TipsResponse instance) =>
    <String, dynamic>{
      'data': instance.data.toJson(),
    };

SubmitMessageRequest _$SubmitMessageRequestFromJson(
        Map<String, dynamic> json) =>
    SubmitMessageRequest(
      networkId: json['networkId'] as String?,
      parentMessageIds: (json['parentMessageIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      payload: json['payload'],
      nonce: json['nonce'] as String?,
    );

Map<String, dynamic> _$SubmitMessageRequestToJson(
        SubmitMessageRequest instance) =>
    <String, dynamic>{
      'networkId': instance.networkId,
      'parentMessageIds': instance.parentMessageIds,
      'payload': instance.payload,
      'nonce': instance.nonce,
    };

SubmitMessageResponse _$SubmitMessageResponseFromJson(
        Map<String, dynamic> json) =>
    SubmitMessageResponse(
      data: SubmitMessageResponse$Data.fromJson(
          json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SubmitMessageResponseToJson(
        SubmitMessageResponse instance) =>
    <String, dynamic>{
      'data': instance.data.toJson(),
    };

MessagesFindResponse _$MessagesFindResponseFromJson(
        Map<String, dynamic> json) =>
    MessagesFindResponse(
      data: MessagesFindResponse$Data.fromJson(
          json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MessagesFindResponseToJson(
        MessagesFindResponse instance) =>
    <String, dynamic>{
      'data': instance.data.toJson(),
    };

MessageMetadataResponse _$MessageMetadataResponseFromJson(
        Map<String, dynamic> json) =>
    MessageMetadataResponse(
      data: MessageMetadataResponse$Data.fromJson(
          json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MessageMetadataResponseToJson(
        MessageMetadataResponse instance) =>
    <String, dynamic>{
      'data': instance.data.toJson(),
    };

MessageResponse _$MessageResponseFromJson(Map<String, dynamic> json) =>
    MessageResponse(
      data: MessageResponse$Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MessageResponseToJson(MessageResponse instance) =>
    <String, dynamic>{
      'data': instance.data.toJson(),
    };

MessageChildrenResponse _$MessageChildrenResponseFromJson(
        Map<String, dynamic> json) =>
    MessageChildrenResponse(
      data: MessageChildrenResponse$Data.fromJson(
          json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MessageChildrenResponseToJson(
        MessageChildrenResponse instance) =>
    <String, dynamic>{
      'data': instance.data.toJson(),
    };

OutputResponse _$OutputResponseFromJson(Map<String, dynamic> json) =>
    OutputResponse(
      data: OutputResponse$Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OutputResponseToJson(OutputResponse instance) =>
    <String, dynamic>{
      'data': instance.data.toJson(),
    };

BalanceAddressResponse _$BalanceAddressResponseFromJson(
        Map<String, dynamic> json) =>
    BalanceAddressResponse(
      data: BalanceAddressResponse$Data.fromJson(
          json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BalanceAddressResponseToJson(
        BalanceAddressResponse instance) =>
    <String, dynamic>{
      'data': instance.data.toJson(),
    };

OutputsAddressResponse _$OutputsAddressResponseFromJson(
        Map<String, dynamic> json) =>
    OutputsAddressResponse(
      data: OutputsAddressResponse$Data.fromJson(
          json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OutputsAddressResponseToJson(
        OutputsAddressResponse instance) =>
    <String, dynamic>{
      'data': instance.data.toJson(),
    };

ReceiptsResponse _$ReceiptsResponseFromJson(Map<String, dynamic> json) =>
    ReceiptsResponse(
      data:
          ReceiptsResponse$Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ReceiptsResponseToJson(ReceiptsResponse instance) =>
    <String, dynamic>{
      'data': instance.data.toJson(),
    };

TreasuryResponse _$TreasuryResponseFromJson(Map<String, dynamic> json) =>
    TreasuryResponse(
      data:
          TreasuryResponse$Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TreasuryResponseToJson(TreasuryResponse instance) =>
    <String, dynamic>{
      'data': instance.data.toJson(),
    };

MilestoneResponse _$MilestoneResponseFromJson(Map<String, dynamic> json) =>
    MilestoneResponse(
      data:
          MilestoneResponse$Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MilestoneResponseToJson(MilestoneResponse instance) =>
    <String, dynamic>{
      'data': instance.data.toJson(),
    };

UTXOChangesResponse _$UTXOChangesResponseFromJson(Map<String, dynamic> json) =>
    UTXOChangesResponse(
      data: UTXOChangesResponse$Data.fromJson(
          json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UTXOChangesResponseToJson(
        UTXOChangesResponse instance) =>
    <String, dynamic>{
      'data': instance.data.toJson(),
    };

PeersResponse _$PeersResponseFromJson(Map<String, dynamic> json) =>
    PeersResponse(
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => Peer.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$PeersResponseToJson(PeersResponse instance) =>
    <String, dynamic>{
      'data': instance.data.map((e) => e.toJson()).toList(),
    };

PeerResponse _$PeerResponseFromJson(Map<String, dynamic> json) => PeerResponse(
      data: Peer.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PeerResponseToJson(PeerResponse instance) =>
    <String, dynamic>{
      'data': instance.data.toJson(),
    };

AddPeerRequest _$AddPeerRequestFromJson(Map<String, dynamic> json) =>
    AddPeerRequest(
      multiAddress: json['multiAddress'] as String,
      alias: json['alias'] as String?,
    );

Map<String, dynamic> _$AddPeerRequestToJson(AddPeerRequest instance) =>
    <String, dynamic>{
      'multiAddress': instance.multiAddress,
      'alias': instance.alias,
    };

AddPeerResponse _$AddPeerResponseFromJson(Map<String, dynamic> json) =>
    AddPeerResponse(
      data: Peer.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AddPeerResponseToJson(AddPeerResponse instance) =>
    <String, dynamic>{
      'data': instance.data.toJson(),
    };

ErrorResponse$Error _$ErrorResponse$ErrorFromJson(Map<String, dynamic> json) =>
    ErrorResponse$Error(
      code: json['code'] as String,
      message: json['message'] as String,
    );

Map<String, dynamic> _$ErrorResponse$ErrorToJson(
        ErrorResponse$Error instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
    };

ForbiddenResponse$Error _$ForbiddenResponse$ErrorFromJson(
        Map<String, dynamic> json) =>
    ForbiddenResponse$Error(
      code: json['code'] as String,
      message: json['message'] as String,
    );

Map<String, dynamic> _$ForbiddenResponse$ErrorToJson(
        ForbiddenResponse$Error instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
    };

ServiceUnavailableResponse$Error _$ServiceUnavailableResponse$ErrorFromJson(
        Map<String, dynamic> json) =>
    ServiceUnavailableResponse$Error(
      code: json['code'] as String,
      message: json['message'] as String,
    );

Map<String, dynamic> _$ServiceUnavailableResponse$ErrorToJson(
        ServiceUnavailableResponse$Error instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
    };

BadRequestResponse$Error _$BadRequestResponse$ErrorFromJson(
        Map<String, dynamic> json) =>
    BadRequestResponse$Error(
      code: json['code'] as String,
      message: json['message'] as String,
    );

Map<String, dynamic> _$BadRequestResponse$ErrorToJson(
        BadRequestResponse$Error instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
    };

NotFoundResponse$Error _$NotFoundResponse$ErrorFromJson(
        Map<String, dynamic> json) =>
    NotFoundResponse$Error(
      code: json['code'] as String,
      message: json['message'] as String,
    );

Map<String, dynamic> _$NotFoundResponse$ErrorToJson(
        NotFoundResponse$Error instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
    };

InternalErrorResponse$Error _$InternalErrorResponse$ErrorFromJson(
        Map<String, dynamic> json) =>
    InternalErrorResponse$Error(
      code: json['code'] as String,
      message: json['message'] as String,
    );

Map<String, dynamic> _$InternalErrorResponse$ErrorToJson(
        InternalErrorResponse$Error instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
    };

InfoResponse$Data _$InfoResponse$DataFromJson(Map<String, dynamic> json) =>
    InfoResponse$Data(
      name: json['name'] as String,
      version: json['version'] as String,
      isHealthy: json['isHealthy'] as bool,
      networkId: json['networkId'] as String,
      bech32HRP: json['bech32HRP'] as String,
      minPoWScore: (json['minPoWScore'] as num).toDouble(),
      messagesPerSecond: (json['messagesPerSecond'] as num).toDouble(),
      referencedMessagesPerSecond:
          (json['referencedMessagesPerSecond'] as num).toDouble(),
      referencedRate: (json['referencedRate'] as num).toDouble(),
      latestMilestoneTimestamp: json['latestMilestoneTimestamp'] as int,
      latestMilestoneIndex: json['latestMilestoneIndex'] as int,
      confirmedMilestoneIndex: json['confirmedMilestoneIndex'] as int,
      pruningIndex: json['pruningIndex'] as int,
      features: (json['features'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
    );

Map<String, dynamic> _$InfoResponse$DataToJson(InfoResponse$Data instance) =>
    <String, dynamic>{
      'name': instance.name,
      'version': instance.version,
      'isHealthy': instance.isHealthy,
      'networkId': instance.networkId,
      'bech32HRP': instance.bech32HRP,
      'minPoWScore': instance.minPoWScore,
      'messagesPerSecond': instance.messagesPerSecond,
      'referencedMessagesPerSecond': instance.referencedMessagesPerSecond,
      'referencedRate': instance.referencedRate,
      'latestMilestoneTimestamp': instance.latestMilestoneTimestamp,
      'latestMilestoneIndex': instance.latestMilestoneIndex,
      'confirmedMilestoneIndex': instance.confirmedMilestoneIndex,
      'pruningIndex': instance.pruningIndex,
      'features': instance.features,
    };

TipsResponse$Data _$TipsResponse$DataFromJson(Map<String, dynamic> json) =>
    TipsResponse$Data(
      tipMessageIds: (json['tipMessageIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
    );

Map<String, dynamic> _$TipsResponse$DataToJson(TipsResponse$Data instance) =>
    <String, dynamic>{
      'tipMessageIds': instance.tipMessageIds,
    };

SubmitMessageResponse$Data _$SubmitMessageResponse$DataFromJson(
        Map<String, dynamic> json) =>
    SubmitMessageResponse$Data(
      messageId: json['messageId'] as String,
    );

Map<String, dynamic> _$SubmitMessageResponse$DataToJson(
        SubmitMessageResponse$Data instance) =>
    <String, dynamic>{
      'messageId': instance.messageId,
    };

MessagesFindResponse$Data _$MessagesFindResponse$DataFromJson(
        Map<String, dynamic> json) =>
    MessagesFindResponse$Data(
      index: json['index'] as String,
      maxResults: json['maxResults'] as int,
      count: json['count'] as int,
      messageIds: (json['messageIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
    );

Map<String, dynamic> _$MessagesFindResponse$DataToJson(
        MessagesFindResponse$Data instance) =>
    <String, dynamic>{
      'index': instance.index,
      'maxResults': instance.maxResults,
      'count': instance.count,
      'messageIds': instance.messageIds,
    };

MessageMetadataResponse$Data _$MessageMetadataResponse$DataFromJson(
        Map<String, dynamic> json) =>
    MessageMetadataResponse$Data(
      messageId: json['messageId'] as String,
      parentMessageIds: (json['parentMessageIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      isSolid: json['isSolid'] as bool,
      referencedByMilestoneIndex: json['referencedByMilestoneIndex'] as int?,
      milestoneIndex: json['milestoneIndex'] as int?,
      ledgerInclusionState: $enumDecodeNullable(
          _$MessageMetadataResponse$DataLedgerInclusionStateEnumMap,
          json['ledgerInclusionState']),
      conflictReason: json['conflictReason'] as int?,
      shouldPromote: json['shouldPromote'] as bool?,
      shouldReattach: json['shouldReattach'] as bool?,
    );

Map<String, dynamic> _$MessageMetadataResponse$DataToJson(
        MessageMetadataResponse$Data instance) =>
    <String, dynamic>{
      'messageId': instance.messageId,
      'parentMessageIds': instance.parentMessageIds,
      'isSolid': instance.isSolid,
      'referencedByMilestoneIndex': instance.referencedByMilestoneIndex,
      'milestoneIndex': instance.milestoneIndex,
      'ledgerInclusionState':
          _$MessageMetadataResponse$DataLedgerInclusionStateEnumMap[
              instance.ledgerInclusionState],
      'conflictReason': instance.conflictReason,
      'shouldPromote': instance.shouldPromote,
      'shouldReattach': instance.shouldReattach,
    };

const _$MessageMetadataResponse$DataLedgerInclusionStateEnumMap = {
  MessageMetadataResponse$DataLedgerInclusionState.swaggerGeneratedUnknown:
      'swaggerGeneratedUnknown',
  MessageMetadataResponse$DataLedgerInclusionState.included: 'included',
  MessageMetadataResponse$DataLedgerInclusionState.conflicting: 'conflicting',
  MessageMetadataResponse$DataLedgerInclusionState.notransaction:
      'noTransaction',
};

MessageResponse$Data _$MessageResponse$DataFromJson(Map<String, dynamic> json) {
  return MessageResponse$Data(
    allOf: Message.fromJson(
        json), //allOf is not a key in the json, idk where it's comming from
  );
}

Map<String, dynamic> _$MessageResponse$DataToJson(
        MessageResponse$Data instance) =>
    <String, dynamic>{
      'allOf': instance.allOf?.toJson(),
    };

MessageChildrenResponse$Data _$MessageChildrenResponse$DataFromJson(
        Map<String, dynamic> json) =>
    MessageChildrenResponse$Data(
      messageId: json['messageId'] as String,
      maxResults: json['maxResults'] as int,
      count: json['count'] as int,
      childrenMessageIds: (json['childrenMessageIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
    );

Map<String, dynamic> _$MessageChildrenResponse$DataToJson(
        MessageChildrenResponse$Data instance) =>
    <String, dynamic>{
      'messageId': instance.messageId,
      'maxResults': instance.maxResults,
      'count': instance.count,
      'childrenMessageIds': instance.childrenMessageIds,
    };

OutputResponse$Data _$OutputResponse$DataFromJson(Map<String, dynamic> json) =>
    OutputResponse$Data(
      messageId: json['messageId'] as String,
      transactionId: json['transactionId'] as String,
      outputIndex: json['outputIndex'] as int,
      isSpent: json['isSpent'] as bool,
      output: json['output'],
      ledgerIndex: json['ledgerIndex'] as int,
    );

Map<String, dynamic> _$OutputResponse$DataToJson(
        OutputResponse$Data instance) =>
    <String, dynamic>{
      'messageId': instance.messageId,
      'transactionId': instance.transactionId,
      'outputIndex': instance.outputIndex,
      'isSpent': instance.isSpent,
      'output': instance.output,
      'ledgerIndex': instance.ledgerIndex,
    };

BalanceAddressResponse$Data _$BalanceAddressResponse$DataFromJson(
        Map<String, dynamic> json) =>
    BalanceAddressResponse$Data(
      addressType: json['addressType'] as int,
      address: json['address'] as String,
      balance: json['balance'] as int,
      dustAllowed: json['dustAllowed'] as bool,
      ledgerIndex: json['ledgerIndex'] as int,
    );

Map<String, dynamic> _$BalanceAddressResponse$DataToJson(
        BalanceAddressResponse$Data instance) =>
    <String, dynamic>{
      'addressType': instance.addressType,
      'address': instance.address,
      'balance': instance.balance,
      'dustAllowed': instance.dustAllowed,
      'ledgerIndex': instance.ledgerIndex,
    };

OutputsAddressResponse$Data _$OutputsAddressResponse$DataFromJson(
        Map<String, dynamic> json) =>
    OutputsAddressResponse$Data(
      addressType: json['addressType'] as int,
      address: json['address'] as String,
      maxResults: json['maxResults'] as int,
      count: json['count'] as int,
      outputIds: (json['outputIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      ledgerIndex: json['ledgerIndex'] as int,
    );

Map<String, dynamic> _$OutputsAddressResponse$DataToJson(
        OutputsAddressResponse$Data instance) =>
    <String, dynamic>{
      'addressType': instance.addressType,
      'address': instance.address,
      'maxResults': instance.maxResults,
      'count': instance.count,
      'outputIds': instance.outputIds,
      'ledgerIndex': instance.ledgerIndex,
    };

ReceiptsResponse$Data _$ReceiptsResponse$DataFromJson(
        Map<String, dynamic> json) =>
    ReceiptsResponse$Data(
      receipts: (json['receipts'] as List<dynamic>?)
              ?.map((e) => ReceiptTuple.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$ReceiptsResponse$DataToJson(
        ReceiptsResponse$Data instance) =>
    <String, dynamic>{
      'receipts': instance.receipts.map((e) => e.toJson()).toList(),
    };

TreasuryResponse$Data _$TreasuryResponse$DataFromJson(
        Map<String, dynamic> json) =>
    TreasuryResponse$Data(
      milestoneId: json['milestoneId'] as String,
      amount: json['amount'] as int,
    );

Map<String, dynamic> _$TreasuryResponse$DataToJson(
        TreasuryResponse$Data instance) =>
    <String, dynamic>{
      'milestoneId': instance.milestoneId,
      'amount': instance.amount,
    };

MilestoneResponse$Data _$MilestoneResponse$DataFromJson(
        Map<String, dynamic> json) =>
    MilestoneResponse$Data(
      index: json['index'] as int,
      messageId: json['messageId'] as String,
      timestamp: json['timestamp'] as int,
    );

Map<String, dynamic> _$MilestoneResponse$DataToJson(
        MilestoneResponse$Data instance) =>
    <String, dynamic>{
      'index': instance.index,
      'messageId': instance.messageId,
      'timestamp': instance.timestamp,
    };

UTXOChangesResponse$Data _$UTXOChangesResponse$DataFromJson(
        Map<String, dynamic> json) =>
    UTXOChangesResponse$Data(
      index: json['index'] as int,
      createdOutputs: (json['createdOutputs'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      consumedOutputs: (json['consumedOutputs'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
    );

Map<String, dynamic> _$UTXOChangesResponse$DataToJson(
        UTXOChangesResponse$Data instance) =>
    <String, dynamic>{
      'index': instance.index,
      'createdOutputs': instance.createdOutputs,
      'consumedOutputs': instance.consumedOutputs,
    };
