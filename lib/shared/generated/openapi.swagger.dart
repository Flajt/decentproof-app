// ignore_for_file: type=lint

import 'package:json_annotation/json_annotation.dart';
import 'package:collection/collection.dart';
import 'dart:convert';

import 'package:chopper/chopper.dart';

import 'client_mapping.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:chopper/chopper.dart' as chopper;
import 'openapi.enums.swagger.dart' as enums;
export 'openapi.enums.swagger.dart';

part 'openapi.swagger.chopper.dart';
part 'openapi.swagger.g.dart';

// **************************************************************************
// SwaggerChopperGenerator
// **************************************************************************

@ChopperApi()
abstract class Openapi extends ChopperService {
  static Openapi create({
    ChopperClient? client,
    http.Client? httpClient,
    Authenticator? authenticator,
    Converter? converter,
    Uri? baseUrl,
    Iterable<dynamic>? interceptors,
  }) {
    if (client != null) {
      return _$Openapi(client);
    }

    final newClient = ChopperClient(
        services: [_$Openapi()],
        converter: converter ?? $JsonSerializableConverter(),
        interceptors: interceptors ?? [],
        client: httpClient,
        authenticator: authenticator,
        baseUrl: baseUrl ?? Uri.parse('http://'));
    return _$Openapi(newClient);
  }

  ///Returns the health of the node.
  Future<chopper.Response> healthGet() {
    return _healthGet();
  }

  ///Returns the health of the node.
  @Get(path: '/health')
  Future<chopper.Response> _healthGet();

  ///Returns general information about the node.
  Future<chopper.Response<InfoResponse>> apiV1InfoGet() {
    generatedMapping.putIfAbsent(
        InfoResponse, () => InfoResponse.fromJsonFactory);

    return _apiV1InfoGet();
  }

  ///Returns general information about the node.
  @Get(path: '/api/v1/info')
  Future<chopper.Response<InfoResponse>> _apiV1InfoGet();

  ///Returns tips that are ideal for attaching a message.
  Future<chopper.Response<TipsResponse>> apiV1TipsGet() {
    generatedMapping.putIfAbsent(
        TipsResponse, () => TipsResponse.fromJsonFactory);

    return _apiV1TipsGet();
  }

  ///Returns tips that are ideal for attaching a message.
  @Get(path: '/api/v1/tips')
  Future<chopper.Response<TipsResponse>> _apiV1TipsGet();

  ///Submit a message.
  Future<chopper.Response<SubmitMessageResponse>> apiV1MessagesPost(
      {required SubmitMessageRequest? body}) {
    generatedMapping.putIfAbsent(
        SubmitMessageResponse, () => SubmitMessageResponse.fromJsonFactory);

    return _apiV1MessagesPost(body: body);
  }

  ///Submit a message.
  @Post(
    path: '/api/v1/messages',
    optionalBody: true,
  )
  Future<chopper.Response<SubmitMessageResponse>> _apiV1MessagesPost(
      {@Body() required SubmitMessageRequest? body});

  ///Search for messages matching a given indexation key.
  ///@param index Hex-encoded indexation key that should be searched for.
  Future<chopper.Response<MessagesFindResponse>> apiV1MessagesGet(
      {required String? index}) {
    generatedMapping.putIfAbsent(
        MessagesFindResponse, () => MessagesFindResponse.fromJsonFactory);

    return _apiV1MessagesGet(index: index);
  }

  ///Search for messages matching a given indexation key.
  ///@param index Hex-encoded indexation key that should be searched for.
  @Get(path: '/api/v1/messages')
  Future<chopper.Response<MessagesFindResponse>> _apiV1MessagesGet(
      {@Query('index') required String? index});

  ///Returns message data as JSON by its identifier.
  ///@param messageId Identifier of the message.
  Future<chopper.Response<MessageResponse>> apiV1MessagesMessageIdGet(
      {required String? messageId}) {
    generatedMapping.putIfAbsent(
        MessageResponse, () => MessageResponse.fromJsonFactory);

    return _apiV1MessagesMessageIdGet(messageId: messageId);
  }

  ///Returns message data as JSON by its identifier.
  ///@param messageId Identifier of the message.
  @Get(path: '/api/v1/messages/{messageId}')
  Future<chopper.Response<MessageResponse>> _apiV1MessagesMessageIdGet(
      {@Path('messageId') required String? messageId});

  ///Find the metadata of a given message.
  ///@param messageId Identifier of the message.
  Future<chopper.Response<MessageMetadataResponse>>
      apiV1MessagesMessageIdMetadataGet({required String? messageId}) {
    generatedMapping.putIfAbsent(
        MessageMetadataResponse, () => MessageMetadataResponse.fromJsonFactory);

    return _apiV1MessagesMessageIdMetadataGet(messageId: messageId);
  }

  ///Find the metadata of a given message.
  ///@param messageId Identifier of the message.
  @Get(path: '/api/v1/messages/{messageId}/metadata')
  Future<chopper.Response<MessageMetadataResponse>>
      _apiV1MessagesMessageIdMetadataGet(
          {@Path('messageId') required String? messageId});

  ///Returns message raw bytes by its identifier.
  ///@param messageId Identifier of the message.
  Future<chopper.Response<String>> apiV1MessagesMessageIdRawGet(
      {required String? messageId}) {
    return _apiV1MessagesMessageIdRawGet(messageId: messageId);
  }

  ///Returns message raw bytes by its identifier.
  ///@param messageId Identifier of the message.
  @Get(path: '/api/v1/messages/{messageId}/raw')
  Future<chopper.Response<String>> _apiV1MessagesMessageIdRawGet(
      {@Path('messageId') required String? messageId});

  ///Returns the children of a message.
  ///@param messageId Identifier of the message.
  Future<chopper.Response<MessageChildrenResponse>>
      apiV1MessagesMessageIdChildrenGet({required String? messageId}) {
    generatedMapping.putIfAbsent(
        MessageChildrenResponse, () => MessageChildrenResponse.fromJsonFactory);

    return _apiV1MessagesMessageIdChildrenGet(messageId: messageId);
  }

  ///Returns the children of a message.
  ///@param messageId Identifier of the message.
  @Get(path: '/api/v1/messages/{messageId}/children')
  Future<chopper.Response<MessageChildrenResponse>>
      _apiV1MessagesMessageIdChildrenGet(
          {@Path('messageId') required String? messageId});

  ///Find an output by its identifier.
  ///@param outputId Identifier of the output encoded in hex. An output is identified by the concatenation of `transaction_id+output_index`.
  Future<chopper.Response<OutputResponse>> apiV1OutputsOutputIdGet(
      {required String? outputId}) {
    generatedMapping.putIfAbsent(
        OutputResponse, () => OutputResponse.fromJsonFactory);

    return _apiV1OutputsOutputIdGet(outputId: outputId);
  }

  ///Find an output by its identifier.
  ///@param outputId Identifier of the output encoded in hex. An output is identified by the concatenation of `transaction_id+output_index`.
  @Get(path: '/api/v1/outputs/{outputId}')
  Future<chopper.Response<OutputResponse>> _apiV1OutputsOutputIdGet(
      {@Path('outputId') required String? outputId});

  ///Get the balance of a bech32-encoded address.
  ///@param address bech32 encoded address
  Future<chopper.Response<BalanceAddressResponse>> apiV1AddressesAddressGet(
      {required String? address}) {
    generatedMapping.putIfAbsent(
        BalanceAddressResponse, () => BalanceAddressResponse.fromJsonFactory);

    return _apiV1AddressesAddressGet(address: address);
  }

  ///Get the balance of a bech32-encoded address.
  ///@param address bech32 encoded address
  @Get(path: '/api/v1/addresses/{address}')
  Future<chopper.Response<BalanceAddressResponse>> _apiV1AddressesAddressGet(
      {@Path('address') required String? address});

  ///Get the balance of a hex-encoded Ed25519 address.
  ///@param address hex-encoded Ed25519 address
  Future<chopper.Response<BalanceAddressResponse>>
      apiV1AddressesEd25519AddressGet({required String? address}) {
    generatedMapping.putIfAbsent(
        BalanceAddressResponse, () => BalanceAddressResponse.fromJsonFactory);

    return _apiV1AddressesEd25519AddressGet(address: address);
  }

  ///Get the balance of a hex-encoded Ed25519 address.
  ///@param address hex-encoded Ed25519 address
  @Get(path: '/api/v1/addresses/ed25519/{address}')
  Future<chopper.Response<BalanceAddressResponse>>
      _apiV1AddressesEd25519AddressGet(
          {@Path('address') required String? address});

  ///Get all outputs that use a given bech32-encoded address.
  ///@param address bech32-encoded address that is referenced by the outputs.
  ///@param include-spent Set to true to also include the known spent outputs for the given address.
  ///@param type Allows to filter the results by output type. Set to value `0` to filter outputs of type `SigLockedSingleOutput`. Set to value `1` to filter outputs of type `SigLockedDustAllowanceOutput`.
  Future<chopper.Response<OutputsAddressResponse>>
      apiV1AddressesAddressOutputsGet({
    required String? address,
    bool? includeSpent,
    int? type,
  }) {
    generatedMapping.putIfAbsent(
        OutputsAddressResponse, () => OutputsAddressResponse.fromJsonFactory);

    return _apiV1AddressesAddressOutputsGet(
        address: address, includeSpent: includeSpent, type: type);
  }

  ///Get all outputs that use a given bech32-encoded address.
  ///@param address bech32-encoded address that is referenced by the outputs.
  ///@param include-spent Set to true to also include the known spent outputs for the given address.
  ///@param type Allows to filter the results by output type. Set to value `0` to filter outputs of type `SigLockedSingleOutput`. Set to value `1` to filter outputs of type `SigLockedDustAllowanceOutput`.
  @Get(path: '/api/v1/addresses/{address}/outputs')
  Future<chopper.Response<OutputsAddressResponse>>
      _apiV1AddressesAddressOutputsGet({
    @Path('address') required String? address,
    @Query('include-spent') bool? includeSpent,
    @Query('type') int? type,
  });

  ///Get all outputs that use a given hex-encoded Ed25519 address.
  ///@param address hex-encoded Ed25519 address that is referenced by the outputs.
  ///@param include-spent Set to true to also include the known spent outputs for the given address.
  ///@param type Allows to filter the results by output type. Set to value `0` to filter outputs of type `SigLockedSingleOutput`. Set to value `1` to filter outputs of type `SigLockedDustAllowanceOutput`.
  Future<chopper.Response<OutputsAddressResponse>>
      apiV1AddressesEd25519AddressOutputsGet({
    required String? address,
    bool? includeSpent,
    int? type,
  }) {
    generatedMapping.putIfAbsent(
        OutputsAddressResponse, () => OutputsAddressResponse.fromJsonFactory);

    return _apiV1AddressesEd25519AddressOutputsGet(
        address: address, includeSpent: includeSpent, type: type);
  }

  ///Get all outputs that use a given hex-encoded Ed25519 address.
  ///@param address hex-encoded Ed25519 address that is referenced by the outputs.
  ///@param include-spent Set to true to also include the known spent outputs for the given address.
  ///@param type Allows to filter the results by output type. Set to value `0` to filter outputs of type `SigLockedSingleOutput`. Set to value `1` to filter outputs of type `SigLockedDustAllowanceOutput`.
  @Get(path: '/api/v1/addresses/ed25519/{address}/outputs')
  Future<chopper.Response<OutputsAddressResponse>>
      _apiV1AddressesEd25519AddressOutputsGet({
    @Path('address') required String? address,
    @Query('include-spent') bool? includeSpent,
    @Query('type') int? type,
  });

  ///Returns all stored receipts.
  Future<chopper.Response<ReceiptsResponse>> apiV1ReceiptsGet() {
    generatedMapping.putIfAbsent(
        ReceiptsResponse, () => ReceiptsResponse.fromJsonFactory);

    return _apiV1ReceiptsGet();
  }

  ///Returns all stored receipts.
  @Get(path: '/api/v1/receipts')
  Future<chopper.Response<ReceiptsResponse>> _apiV1ReceiptsGet();

  ///Returns all stored receipts for a given migration index.
  ///@param migratedAt Migration index to look up.
  Future<chopper.Response<ReceiptsResponse>> apiV1ReceiptsMigratedAtGet(
      {required num? migratedAt}) {
    generatedMapping.putIfAbsent(
        ReceiptsResponse, () => ReceiptsResponse.fromJsonFactory);

    return _apiV1ReceiptsMigratedAtGet(migratedAt: migratedAt);
  }

  ///Returns all stored receipts for a given migration index.
  ///@param migratedAt Migration index to look up.
  @Get(path: '/api/v1/receipts/{migratedAt}')
  Future<chopper.Response<ReceiptsResponse>> _apiV1ReceiptsMigratedAtGet(
      {@Path('migratedAt') required num? migratedAt});

  ///Returns information about the treasury.
  Future<chopper.Response<TreasuryResponse>> apiV1TreasuryGet() {
    generatedMapping.putIfAbsent(
        TreasuryResponse, () => TreasuryResponse.fromJsonFactory);

    return _apiV1TreasuryGet();
  }

  ///Returns information about the treasury.
  @Get(path: '/api/v1/treasury')
  Future<chopper.Response<TreasuryResponse>> _apiV1TreasuryGet();

  ///Returns the included message of a transaction.
  ///@param transactionId Identifier of the transaction to look up.
  Future<chopper.Response<MessageResponse>>
      apiV1TransactionsTransactionIdIncludedMessageGet(
          {required String? transactionId}) {
    generatedMapping.putIfAbsent(
        MessageResponse, () => MessageResponse.fromJsonFactory);

    return _apiV1TransactionsTransactionIdIncludedMessageGet(
        transactionId: transactionId);
  }

  ///Returns the included message of a transaction.
  ///@param transactionId Identifier of the transaction to look up.
  @Get(path: '/api/v1/transactions/{transactionId}/included-message')
  Future<chopper.Response<MessageResponse>>
      _apiV1TransactionsTransactionIdIncludedMessageGet(
          {@Path('transactionId') required String? transactionId});

  ///Look up a milestone by a given milestone index.
  ///@param index Index of the milestone to look up.
  Future<chopper.Response<MilestoneResponse>> apiV1MilestonesIndexGet(
      {required num? index}) {
    generatedMapping.putIfAbsent(
        MilestoneResponse, () => MilestoneResponse.fromJsonFactory);

    return _apiV1MilestonesIndexGet(index: index);
  }

  ///Look up a milestone by a given milestone index.
  ///@param index Index of the milestone to look up.
  @Get(path: '/api/v1/milestones/{index}')
  Future<chopper.Response<MilestoneResponse>> _apiV1MilestonesIndexGet(
      {@Path('index') required num? index});

  ///Get all UTXO changes of a given milestone.
  ///@param index Index of the milestone to look up.
  Future<chopper.Response<UTXOChangesResponse>>
      apiV1MilestonesIndexUtxoChangesGet({required num? index}) {
    generatedMapping.putIfAbsent(
        UTXOChangesResponse, () => UTXOChangesResponse.fromJsonFactory);

    return _apiV1MilestonesIndexUtxoChangesGet(index: index);
  }

  ///Get all UTXO changes of a given milestone.
  ///@param index Index of the milestone to look up.
  @Get(path: '/api/v1/milestones/{index}/utxo-changes')
  Future<chopper.Response<UTXOChangesResponse>>
      _apiV1MilestonesIndexUtxoChangesGet({@Path('index') required num? index});

  ///Get information about the peers of the node.
  Future<chopper.Response<PeersResponse>> apiV1PeersGet() {
    generatedMapping.putIfAbsent(
        PeersResponse, () => PeersResponse.fromJsonFactory);

    return _apiV1PeersGet();
  }

  ///Get information about the peers of the node.
  @Get(path: '/api/v1/peers')
  Future<chopper.Response<PeersResponse>> _apiV1PeersGet();

  ///Add a given peer to the node.
  Future<chopper.Response<AddPeerResponse>> apiV1PeersPost(
      {required AddPeerRequest? body}) {
    generatedMapping.putIfAbsent(
        AddPeerResponse, () => AddPeerResponse.fromJsonFactory);

    return _apiV1PeersPost(body: body);
  }

  ///Add a given peer to the node.
  @Post(
    path: '/api/v1/peers',
    optionalBody: true,
  )
  Future<chopper.Response<AddPeerResponse>> _apiV1PeersPost(
      {@Body() required AddPeerRequest? body});

  ///Get information about a given peer.
  ///@param peerId Identifier of the message.
  Future<chopper.Response<PeerResponse>> apiV1PeersPeerIdGet(
      {required String? peerId}) {
    generatedMapping.putIfAbsent(
        PeerResponse, () => PeerResponse.fromJsonFactory);

    return _apiV1PeersPeerIdGet(peerId: peerId);
  }

  ///Get information about a given peer.
  ///@param peerId Identifier of the message.
  @Get(path: '/api/v1/peers/{peerId}')
  Future<chopper.Response<PeerResponse>> _apiV1PeersPeerIdGet(
      {@Path('peerId') required String? peerId});

  ///Remove/disconnect a given peer.
  ///@param peerId Identifier of the peer.
  Future<chopper.Response> apiV1PeersPeerIdDelete({required String? peerId}) {
    return _apiV1PeersPeerIdDelete(peerId: peerId);
  }

  ///Remove/disconnect a given peer.
  ///@param peerId Identifier of the peer.
  @Delete(path: '/api/v1/peers/{peerId}')
  Future<chopper.Response> _apiV1PeersPeerIdDelete(
      {@Path('peerId') required String? peerId});
}

@JsonSerializable(explicitToJson: true)
class Message {
  Message({
    required this.networkId,
    required this.parentMessageIds,
    required this.payload,
    required this.nonce,
  });

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);

  static const toJsonFactory = _$MessageToJson;
  Map<String, dynamic> toJson() => _$MessageToJson(this);

  @JsonKey(name: 'networkId')
  final String networkId;
  @JsonKey(name: 'parentMessageIds', defaultValue: <String>[])
  final List<String> parentMessageIds;
  @JsonKey(name: 'payload')
  final dynamic payload;
  @JsonKey(name: 'nonce')
  final String nonce;
  static const fromJsonFactory = _$MessageFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Message &&
            (identical(other.networkId, networkId) ||
                const DeepCollectionEquality()
                    .equals(other.networkId, networkId)) &&
            (identical(other.parentMessageIds, parentMessageIds) ||
                const DeepCollectionEquality()
                    .equals(other.parentMessageIds, parentMessageIds)) &&
            (identical(other.payload, payload) ||
                const DeepCollectionEquality()
                    .equals(other.payload, payload)) &&
            (identical(other.nonce, nonce) ||
                const DeepCollectionEquality().equals(other.nonce, nonce)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(networkId) ^
      const DeepCollectionEquality().hash(parentMessageIds) ^
      const DeepCollectionEquality().hash(payload) ^
      const DeepCollectionEquality().hash(nonce) ^
      runtimeType.hashCode;
}

extension $MessageExtension on Message {
  Message copyWith(
      {String? networkId,
      List<String>? parentMessageIds,
      dynamic payload,
      String? nonce}) {
    return Message(
        networkId: networkId ?? this.networkId,
        parentMessageIds: parentMessageIds ?? this.parentMessageIds,
        payload: payload ?? this.payload,
        nonce: nonce ?? this.nonce);
  }

  Message copyWithWrapped(
      {Wrapped<String>? networkId,
      Wrapped<List<String>>? parentMessageIds,
      Wrapped<dynamic>? payload,
      Wrapped<String>? nonce}) {
    return Message(
        networkId: (networkId != null ? networkId.value : this.networkId),
        parentMessageIds: (parentMessageIds != null
            ? parentMessageIds.value
            : this.parentMessageIds),
        payload: (payload != null ? payload.value : this.payload),
        nonce: (nonce != null ? nonce.value : this.nonce));
  }
}

@JsonSerializable(explicitToJson: true)
class TransactionPayload {
  TransactionPayload({
    required this.type,
    required this.essence,
    required this.unlockBlocks,
  });

  factory TransactionPayload.fromJson(Map<String, dynamic> json) =>
      _$TransactionPayloadFromJson(json);

  static const toJsonFactory = _$TransactionPayloadToJson;
  Map<String, dynamic> toJson() => _$TransactionPayloadToJson(this);

  @JsonKey(name: 'type')
  final int type;
  @JsonKey(name: 'essence')
  final Object essence;
  @JsonKey(name: 'unlockBlocks', defaultValue: <Object>[])
  final List<Object> unlockBlocks;
  static const fromJsonFactory = _$TransactionPayloadFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is TransactionPayload &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.essence, essence) ||
                const DeepCollectionEquality()
                    .equals(other.essence, essence)) &&
            (identical(other.unlockBlocks, unlockBlocks) ||
                const DeepCollectionEquality()
                    .equals(other.unlockBlocks, unlockBlocks)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(essence) ^
      const DeepCollectionEquality().hash(unlockBlocks) ^
      runtimeType.hashCode;
}

extension $TransactionPayloadExtension on TransactionPayload {
  TransactionPayload copyWith(
      {int? type, Object? essence, List<Object>? unlockBlocks}) {
    return TransactionPayload(
        type: type ?? this.type,
        essence: essence ?? this.essence,
        unlockBlocks: unlockBlocks ?? this.unlockBlocks);
  }

  TransactionPayload copyWithWrapped(
      {Wrapped<int>? type,
      Wrapped<Object>? essence,
      Wrapped<List<Object>>? unlockBlocks}) {
    return TransactionPayload(
        type: (type != null ? type.value : this.type),
        essence: (essence != null ? essence.value : this.essence),
        unlockBlocks:
            (unlockBlocks != null ? unlockBlocks.value : this.unlockBlocks));
  }
}

@JsonSerializable(explicitToJson: true)
class TransactionEssence {
  TransactionEssence({
    required this.type,
    required this.inputs,
    required this.outputs,
    required this.payload,
  });

  factory TransactionEssence.fromJson(Map<String, dynamic> json) =>
      _$TransactionEssenceFromJson(json);

  static const toJsonFactory = _$TransactionEssenceToJson;
  Map<String, dynamic> toJson() => _$TransactionEssenceToJson(this);

  @JsonKey(name: 'type')
  final int type;
  @JsonKey(name: 'inputs', defaultValue: <Object>[])
  final List<Object> inputs;
  @JsonKey(name: 'outputs', defaultValue: <Object>[])
  final List<Object> outputs;
  @JsonKey(name: 'payload')
  final dynamic payload;
  static const fromJsonFactory = _$TransactionEssenceFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is TransactionEssence &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.inputs, inputs) ||
                const DeepCollectionEquality().equals(other.inputs, inputs)) &&
            (identical(other.outputs, outputs) ||
                const DeepCollectionEquality()
                    .equals(other.outputs, outputs)) &&
            (identical(other.payload, payload) ||
                const DeepCollectionEquality().equals(other.payload, payload)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(inputs) ^
      const DeepCollectionEquality().hash(outputs) ^
      const DeepCollectionEquality().hash(payload) ^
      runtimeType.hashCode;
}

extension $TransactionEssenceExtension on TransactionEssence {
  TransactionEssence copyWith(
      {int? type,
      List<Object>? inputs,
      List<Object>? outputs,
      dynamic payload}) {
    return TransactionEssence(
        type: type ?? this.type,
        inputs: inputs ?? this.inputs,
        outputs: outputs ?? this.outputs,
        payload: payload ?? this.payload);
  }

  TransactionEssence copyWithWrapped(
      {Wrapped<int>? type,
      Wrapped<List<Object>>? inputs,
      Wrapped<List<Object>>? outputs,
      Wrapped<dynamic>? payload}) {
    return TransactionEssence(
        type: (type != null ? type.value : this.type),
        inputs: (inputs != null ? inputs.value : this.inputs),
        outputs: (outputs != null ? outputs.value : this.outputs),
        payload: (payload != null ? payload.value : this.payload));
  }
}

@JsonSerializable(explicitToJson: true)
class UTXOInput {
  UTXOInput({
    required this.type,
    required this.transactionId,
    required this.transactionOutputIndex,
  });

  factory UTXOInput.fromJson(Map<String, dynamic> json) =>
      _$UTXOInputFromJson(json);

  static const toJsonFactory = _$UTXOInputToJson;
  Map<String, dynamic> toJson() => _$UTXOInputToJson(this);

  @JsonKey(name: 'type')
  final int type;
  @JsonKey(name: 'transactionId')
  final String transactionId;
  @JsonKey(name: 'transactionOutputIndex')
  final int transactionOutputIndex;
  static const fromJsonFactory = _$UTXOInputFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UTXOInput &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.transactionId, transactionId) ||
                const DeepCollectionEquality()
                    .equals(other.transactionId, transactionId)) &&
            (identical(other.transactionOutputIndex, transactionOutputIndex) ||
                const DeepCollectionEquality().equals(
                    other.transactionOutputIndex, transactionOutputIndex)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(transactionId) ^
      const DeepCollectionEquality().hash(transactionOutputIndex) ^
      runtimeType.hashCode;
}

extension $UTXOInputExtension on UTXOInput {
  UTXOInput copyWith(
      {int? type, String? transactionId, int? transactionOutputIndex}) {
    return UTXOInput(
        type: type ?? this.type,
        transactionId: transactionId ?? this.transactionId,
        transactionOutputIndex:
            transactionOutputIndex ?? this.transactionOutputIndex);
  }

  UTXOInput copyWithWrapped(
      {Wrapped<int>? type,
      Wrapped<String>? transactionId,
      Wrapped<int>? transactionOutputIndex}) {
    return UTXOInput(
        type: (type != null ? type.value : this.type),
        transactionId:
            (transactionId != null ? transactionId.value : this.transactionId),
        transactionOutputIndex: (transactionOutputIndex != null
            ? transactionOutputIndex.value
            : this.transactionOutputIndex));
  }
}

@JsonSerializable(explicitToJson: true)
class SigLockedSingleOutput {
  SigLockedSingleOutput({
    required this.type,
    required this.address,
    required this.amount,
  });

  factory SigLockedSingleOutput.fromJson(Map<String, dynamic> json) =>
      _$SigLockedSingleOutputFromJson(json);

  static const toJsonFactory = _$SigLockedSingleOutputToJson;
  Map<String, dynamic> toJson() => _$SigLockedSingleOutputToJson(this);

  @JsonKey(name: 'type')
  final int type;
  @JsonKey(name: 'address')
  final dynamic address;
  @JsonKey(name: 'amount')
  final int amount;
  static const fromJsonFactory = _$SigLockedSingleOutputFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SigLockedSingleOutput &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.address, address) ||
                const DeepCollectionEquality()
                    .equals(other.address, address)) &&
            (identical(other.amount, amount) ||
                const DeepCollectionEquality().equals(other.amount, amount)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(address) ^
      const DeepCollectionEquality().hash(amount) ^
      runtimeType.hashCode;
}

extension $SigLockedSingleOutputExtension on SigLockedSingleOutput {
  SigLockedSingleOutput copyWith({int? type, dynamic address, int? amount}) {
    return SigLockedSingleOutput(
        type: type ?? this.type,
        address: address ?? this.address,
        amount: amount ?? this.amount);
  }

  SigLockedSingleOutput copyWithWrapped(
      {Wrapped<int>? type, Wrapped<dynamic>? address, Wrapped<int>? amount}) {
    return SigLockedSingleOutput(
        type: (type != null ? type.value : this.type),
        address: (address != null ? address.value : this.address),
        amount: (amount != null ? amount.value : this.amount));
  }
}

@JsonSerializable(explicitToJson: true)
class SigLockedDustAllowanceOutput {
  SigLockedDustAllowanceOutput({
    required this.type,
    required this.address,
    required this.amount,
  });

  factory SigLockedDustAllowanceOutput.fromJson(Map<String, dynamic> json) =>
      _$SigLockedDustAllowanceOutputFromJson(json);

  static const toJsonFactory = _$SigLockedDustAllowanceOutputToJson;
  Map<String, dynamic> toJson() => _$SigLockedDustAllowanceOutputToJson(this);

  @JsonKey(name: 'type')
  final int type;
  @JsonKey(name: 'address')
  final dynamic address;
  @JsonKey(name: 'amount')
  final int amount;
  static const fromJsonFactory = _$SigLockedDustAllowanceOutputFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SigLockedDustAllowanceOutput &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.address, address) ||
                const DeepCollectionEquality()
                    .equals(other.address, address)) &&
            (identical(other.amount, amount) ||
                const DeepCollectionEquality().equals(other.amount, amount)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(address) ^
      const DeepCollectionEquality().hash(amount) ^
      runtimeType.hashCode;
}

extension $SigLockedDustAllowanceOutputExtension
    on SigLockedDustAllowanceOutput {
  SigLockedDustAllowanceOutput copyWith(
      {int? type, dynamic address, int? amount}) {
    return SigLockedDustAllowanceOutput(
        type: type ?? this.type,
        address: address ?? this.address,
        amount: amount ?? this.amount);
  }

  SigLockedDustAllowanceOutput copyWithWrapped(
      {Wrapped<int>? type, Wrapped<dynamic>? address, Wrapped<int>? amount}) {
    return SigLockedDustAllowanceOutput(
        type: (type != null ? type.value : this.type),
        address: (address != null ? address.value : this.address),
        amount: (amount != null ? amount.value : this.amount));
  }
}

@JsonSerializable(explicitToJson: true)
class Ed25519Address {
  Ed25519Address({
    required this.type,
    required this.address,
  });

  factory Ed25519Address.fromJson(Map<String, dynamic> json) =>
      _$Ed25519AddressFromJson(json);

  static const toJsonFactory = _$Ed25519AddressToJson;
  Map<String, dynamic> toJson() => _$Ed25519AddressToJson(this);

  @JsonKey(name: 'type')
  final int type;
  @JsonKey(name: 'address')
  final String address;
  static const fromJsonFactory = _$Ed25519AddressFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Ed25519Address &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.address, address) ||
                const DeepCollectionEquality().equals(other.address, address)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(address) ^
      runtimeType.hashCode;
}

extension $Ed25519AddressExtension on Ed25519Address {
  Ed25519Address copyWith({int? type, String? address}) {
    return Ed25519Address(
        type: type ?? this.type, address: address ?? this.address);
  }

  Ed25519Address copyWithWrapped(
      {Wrapped<int>? type, Wrapped<String>? address}) {
    return Ed25519Address(
        type: (type != null ? type.value : this.type),
        address: (address != null ? address.value : this.address));
  }
}

@JsonSerializable(explicitToJson: true)
class SignatureUnlockBlock {
  SignatureUnlockBlock({
    required this.type,
    required this.signature,
  });

  factory SignatureUnlockBlock.fromJson(Map<String, dynamic> json) =>
      _$SignatureUnlockBlockFromJson(json);

  static const toJsonFactory = _$SignatureUnlockBlockToJson;
  Map<String, dynamic> toJson() => _$SignatureUnlockBlockToJson(this);

  @JsonKey(name: 'type')
  final int type;
  @JsonKey(name: 'signature')
  final Object signature;
  static const fromJsonFactory = _$SignatureUnlockBlockFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SignatureUnlockBlock &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.signature, signature) ||
                const DeepCollectionEquality()
                    .equals(other.signature, signature)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(signature) ^
      runtimeType.hashCode;
}

extension $SignatureUnlockBlockExtension on SignatureUnlockBlock {
  SignatureUnlockBlock copyWith({int? type, Object? signature}) {
    return SignatureUnlockBlock(
        type: type ?? this.type, signature: signature ?? this.signature);
  }

  SignatureUnlockBlock copyWithWrapped(
      {Wrapped<int>? type, Wrapped<Object>? signature}) {
    return SignatureUnlockBlock(
        type: (type != null ? type.value : this.type),
        signature: (signature != null ? signature.value : this.signature));
  }
}

@JsonSerializable(explicitToJson: true)
class Ed25519Signature {
  Ed25519Signature({
    required this.type,
    required this.publicKey,
    required this.signature,
  });

  factory Ed25519Signature.fromJson(Map<String, dynamic> json) =>
      _$Ed25519SignatureFromJson(json);

  static const toJsonFactory = _$Ed25519SignatureToJson;
  Map<String, dynamic> toJson() => _$Ed25519SignatureToJson(this);

  @JsonKey(name: 'type')
  final int type;
  @JsonKey(name: 'publicKey')
  final String publicKey;
  @JsonKey(name: 'signature')
  final String signature;
  static const fromJsonFactory = _$Ed25519SignatureFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Ed25519Signature &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.publicKey, publicKey) ||
                const DeepCollectionEquality()
                    .equals(other.publicKey, publicKey)) &&
            (identical(other.signature, signature) ||
                const DeepCollectionEquality()
                    .equals(other.signature, signature)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(publicKey) ^
      const DeepCollectionEquality().hash(signature) ^
      runtimeType.hashCode;
}

extension $Ed25519SignatureExtension on Ed25519Signature {
  Ed25519Signature copyWith({int? type, String? publicKey, String? signature}) {
    return Ed25519Signature(
        type: type ?? this.type,
        publicKey: publicKey ?? this.publicKey,
        signature: signature ?? this.signature);
  }

  Ed25519Signature copyWithWrapped(
      {Wrapped<int>? type,
      Wrapped<String>? publicKey,
      Wrapped<String>? signature}) {
    return Ed25519Signature(
        type: (type != null ? type.value : this.type),
        publicKey: (publicKey != null ? publicKey.value : this.publicKey),
        signature: (signature != null ? signature.value : this.signature));
  }
}

@JsonSerializable(explicitToJson: true)
class ReferenceUnlockBlock {
  ReferenceUnlockBlock({
    required this.type,
    required this.reference,
  });

  factory ReferenceUnlockBlock.fromJson(Map<String, dynamic> json) =>
      _$ReferenceUnlockBlockFromJson(json);

  static const toJsonFactory = _$ReferenceUnlockBlockToJson;
  Map<String, dynamic> toJson() => _$ReferenceUnlockBlockToJson(this);

  @JsonKey(name: 'type')
  final int type;
  @JsonKey(name: 'reference')
  final int reference;
  static const fromJsonFactory = _$ReferenceUnlockBlockFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ReferenceUnlockBlock &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.reference, reference) ||
                const DeepCollectionEquality()
                    .equals(other.reference, reference)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(reference) ^
      runtimeType.hashCode;
}

extension $ReferenceUnlockBlockExtension on ReferenceUnlockBlock {
  ReferenceUnlockBlock copyWith({int? type, int? reference}) {
    return ReferenceUnlockBlock(
        type: type ?? this.type, reference: reference ?? this.reference);
  }

  ReferenceUnlockBlock copyWithWrapped(
      {Wrapped<int>? type, Wrapped<int>? reference}) {
    return ReferenceUnlockBlock(
        type: (type != null ? type.value : this.type),
        reference: (reference != null ? reference.value : this.reference));
  }
}

@JsonSerializable(explicitToJson: true)
class MilestonePayload {
  MilestonePayload({
    required this.type,
    required this.index,
    required this.timestamp,
    required this.parents,
    required this.inclusionMerkleProof,
    required this.nextPoWScore,
    required this.nextPoWScoreMilestoneIndex,
    required this.publicKeys,
    required this.signatures,
  });

  factory MilestonePayload.fromJson(Map<String, dynamic> json) =>
      _$MilestonePayloadFromJson(json);

  static const toJsonFactory = _$MilestonePayloadToJson;
  Map<String, dynamic> toJson() => _$MilestonePayloadToJson(this);

  @JsonKey(name: 'type')
  final int type;
  @JsonKey(name: 'index')
  final int index;
  @JsonKey(name: 'timestamp')
  final int timestamp;
  @JsonKey(name: 'parents', defaultValue: <String>[])
  final List<String> parents;
  @JsonKey(name: 'inclusionMerkleProof')
  final String inclusionMerkleProof;
  @JsonKey(name: 'nextPoWScore')
  final double nextPoWScore;
  @JsonKey(name: 'nextPoWScoreMilestoneIndex')
  final double nextPoWScoreMilestoneIndex;
  @JsonKey(name: 'publicKeys', defaultValue: <String>[])
  final List<String> publicKeys;
  @JsonKey(name: 'signatures', defaultValue: <String>[])
  final List<String> signatures;
  static const fromJsonFactory = _$MilestonePayloadFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is MilestonePayload &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.index, index) ||
                const DeepCollectionEquality().equals(other.index, index)) &&
            (identical(other.timestamp, timestamp) ||
                const DeepCollectionEquality()
                    .equals(other.timestamp, timestamp)) &&
            (identical(other.parents, parents) ||
                const DeepCollectionEquality()
                    .equals(other.parents, parents)) &&
            (identical(other.inclusionMerkleProof, inclusionMerkleProof) ||
                const DeepCollectionEquality().equals(
                    other.inclusionMerkleProof, inclusionMerkleProof)) &&
            (identical(other.nextPoWScore, nextPoWScore) ||
                const DeepCollectionEquality()
                    .equals(other.nextPoWScore, nextPoWScore)) &&
            (identical(other.nextPoWScoreMilestoneIndex,
                    nextPoWScoreMilestoneIndex) ||
                const DeepCollectionEquality().equals(
                    other.nextPoWScoreMilestoneIndex,
                    nextPoWScoreMilestoneIndex)) &&
            (identical(other.publicKeys, publicKeys) ||
                const DeepCollectionEquality()
                    .equals(other.publicKeys, publicKeys)) &&
            (identical(other.signatures, signatures) ||
                const DeepCollectionEquality()
                    .equals(other.signatures, signatures)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(index) ^
      const DeepCollectionEquality().hash(timestamp) ^
      const DeepCollectionEquality().hash(parents) ^
      const DeepCollectionEquality().hash(inclusionMerkleProof) ^
      const DeepCollectionEquality().hash(nextPoWScore) ^
      const DeepCollectionEquality().hash(nextPoWScoreMilestoneIndex) ^
      const DeepCollectionEquality().hash(publicKeys) ^
      const DeepCollectionEquality().hash(signatures) ^
      runtimeType.hashCode;
}

extension $MilestonePayloadExtension on MilestonePayload {
  MilestonePayload copyWith(
      {int? type,
      int? index,
      int? timestamp,
      List<String>? parents,
      String? inclusionMerkleProof,
      double? nextPoWScore,
      double? nextPoWScoreMilestoneIndex,
      List<String>? publicKeys,
      List<String>? signatures}) {
    return MilestonePayload(
        type: type ?? this.type,
        index: index ?? this.index,
        timestamp: timestamp ?? this.timestamp,
        parents: parents ?? this.parents,
        inclusionMerkleProof: inclusionMerkleProof ?? this.inclusionMerkleProof,
        nextPoWScore: nextPoWScore ?? this.nextPoWScore,
        nextPoWScoreMilestoneIndex:
            nextPoWScoreMilestoneIndex ?? this.nextPoWScoreMilestoneIndex,
        publicKeys: publicKeys ?? this.publicKeys,
        signatures: signatures ?? this.signatures);
  }

  MilestonePayload copyWithWrapped(
      {Wrapped<int>? type,
      Wrapped<int>? index,
      Wrapped<int>? timestamp,
      Wrapped<List<String>>? parents,
      Wrapped<String>? inclusionMerkleProof,
      Wrapped<double>? nextPoWScore,
      Wrapped<double>? nextPoWScoreMilestoneIndex,
      Wrapped<List<String>>? publicKeys,
      Wrapped<List<String>>? signatures}) {
    return MilestonePayload(
        type: (type != null ? type.value : this.type),
        index: (index != null ? index.value : this.index),
        timestamp: (timestamp != null ? timestamp.value : this.timestamp),
        parents: (parents != null ? parents.value : this.parents),
        inclusionMerkleProof: (inclusionMerkleProof != null
            ? inclusionMerkleProof.value
            : this.inclusionMerkleProof),
        nextPoWScore:
            (nextPoWScore != null ? nextPoWScore.value : this.nextPoWScore),
        nextPoWScoreMilestoneIndex: (nextPoWScoreMilestoneIndex != null
            ? nextPoWScoreMilestoneIndex.value
            : this.nextPoWScoreMilestoneIndex),
        publicKeys: (publicKeys != null ? publicKeys.value : this.publicKeys),
        signatures: (signatures != null ? signatures.value : this.signatures));
  }
}

@JsonSerializable(explicitToJson: true)
class IndexationPayload {
  IndexationPayload({
    required this.type,
    required this.index,
    required this.data,
  });

  factory IndexationPayload.fromJson(Map<String, dynamic> json) =>
      _$IndexationPayloadFromJson(json);

  static const toJsonFactory = _$IndexationPayloadToJson;
  Map<String, dynamic> toJson() => _$IndexationPayloadToJson(this);

  @JsonKey(name: 'type')
  final int type;
  @JsonKey(name: 'index')
  final String index;
  @JsonKey(name: 'data')
  final String data;
  static const fromJsonFactory = _$IndexationPayloadFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is IndexationPayload &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.index, index) ||
                const DeepCollectionEquality().equals(other.index, index)) &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(index) ^
      const DeepCollectionEquality().hash(data) ^
      runtimeType.hashCode;
}

extension $IndexationPayloadExtension on IndexationPayload {
  IndexationPayload copyWith({int? type, String? index, String? data}) {
    return IndexationPayload(
        type: type ?? this.type,
        index: index ?? this.index,
        data: data ?? this.data);
  }

  IndexationPayload copyWithWrapped(
      {Wrapped<int>? type, Wrapped<String>? index, Wrapped<String>? data}) {
    return IndexationPayload(
        type: (type != null ? type.value : this.type),
        index: (index != null ? index.value : this.index),
        data: (data != null ? data.value : this.data));
  }
}

@JsonSerializable(explicitToJson: true)
class TreasuryTransactionPayload {
  TreasuryTransactionPayload({
    required this.type,
    required this.input,
    required this.output,
  });

  factory TreasuryTransactionPayload.fromJson(Map<String, dynamic> json) =>
      _$TreasuryTransactionPayloadFromJson(json);

  static const toJsonFactory = _$TreasuryTransactionPayloadToJson;
  Map<String, dynamic> toJson() => _$TreasuryTransactionPayloadToJson(this);

  @JsonKey(name: 'type')
  final int type;
  @JsonKey(name: 'input')
  final TreasuryInput input;
  @JsonKey(name: 'output')
  final TreasuryOutput output;
  static const fromJsonFactory = _$TreasuryTransactionPayloadFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is TreasuryTransactionPayload &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.input, input) ||
                const DeepCollectionEquality().equals(other.input, input)) &&
            (identical(other.output, output) ||
                const DeepCollectionEquality().equals(other.output, output)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(input) ^
      const DeepCollectionEquality().hash(output) ^
      runtimeType.hashCode;
}

extension $TreasuryTransactionPayloadExtension on TreasuryTransactionPayload {
  TreasuryTransactionPayload copyWith(
      {int? type, TreasuryInput? input, TreasuryOutput? output}) {
    return TreasuryTransactionPayload(
        type: type ?? this.type,
        input: input ?? this.input,
        output: output ?? this.output);
  }

  TreasuryTransactionPayload copyWithWrapped(
      {Wrapped<int>? type,
      Wrapped<TreasuryInput>? input,
      Wrapped<TreasuryOutput>? output}) {
    return TreasuryTransactionPayload(
        type: (type != null ? type.value : this.type),
        input: (input != null ? input.value : this.input),
        output: (output != null ? output.value : this.output));
  }
}

@JsonSerializable(explicitToJson: true)
class TreasuryInput {
  TreasuryInput({
    required this.type,
    required this.milestoneId,
  });

  factory TreasuryInput.fromJson(Map<String, dynamic> json) =>
      _$TreasuryInputFromJson(json);

  static const toJsonFactory = _$TreasuryInputToJson;
  Map<String, dynamic> toJson() => _$TreasuryInputToJson(this);

  @JsonKey(name: 'type')
  final int type;
  @JsonKey(name: 'milestoneId')
  final String milestoneId;
  static const fromJsonFactory = _$TreasuryInputFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is TreasuryInput &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.milestoneId, milestoneId) ||
                const DeepCollectionEquality()
                    .equals(other.milestoneId, milestoneId)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(milestoneId) ^
      runtimeType.hashCode;
}

extension $TreasuryInputExtension on TreasuryInput {
  TreasuryInput copyWith({int? type, String? milestoneId}) {
    return TreasuryInput(
        type: type ?? this.type, milestoneId: milestoneId ?? this.milestoneId);
  }

  TreasuryInput copyWithWrapped(
      {Wrapped<int>? type, Wrapped<String>? milestoneId}) {
    return TreasuryInput(
        type: (type != null ? type.value : this.type),
        milestoneId:
            (milestoneId != null ? milestoneId.value : this.milestoneId));
  }
}

@JsonSerializable(explicitToJson: true)
class TreasuryOutput {
  TreasuryOutput({
    required this.type,
    required this.amount,
  });

  factory TreasuryOutput.fromJson(Map<String, dynamic> json) =>
      _$TreasuryOutputFromJson(json);

  static const toJsonFactory = _$TreasuryOutputToJson;
  Map<String, dynamic> toJson() => _$TreasuryOutputToJson(this);

  @JsonKey(name: 'type')
  final int type;
  @JsonKey(name: 'amount')
  final int amount;
  static const fromJsonFactory = _$TreasuryOutputFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is TreasuryOutput &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.amount, amount) ||
                const DeepCollectionEquality().equals(other.amount, amount)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(amount) ^
      runtimeType.hashCode;
}

extension $TreasuryOutputExtension on TreasuryOutput {
  TreasuryOutput copyWith({int? type, int? amount}) {
    return TreasuryOutput(
        type: type ?? this.type, amount: amount ?? this.amount);
  }

  TreasuryOutput copyWithWrapped({Wrapped<int>? type, Wrapped<int>? amount}) {
    return TreasuryOutput(
        type: (type != null ? type.value : this.type),
        amount: (amount != null ? amount.value : this.amount));
  }
}

@JsonSerializable(explicitToJson: true)
class Peer {
  Peer({
    required this.id,
    required this.multiAddresses,
    this.alias,
    required this.relation,
    required this.connected,
    required this.gossip,
  });

  factory Peer.fromJson(Map<String, dynamic> json) => _$PeerFromJson(json);

  static const toJsonFactory = _$PeerToJson;
  Map<String, dynamic> toJson() => _$PeerToJson(this);

  @JsonKey(name: 'id')
  final String id;
  @JsonKey(name: 'multiAddresses', defaultValue: <String>[])
  final List<String> multiAddresses;
  @JsonKey(name: 'alias')
  final String? alias;
  @JsonKey(
    name: 'relation',
    toJson: peerRelationToJson,
    fromJson: peerRelationFromJson,
  )
  final enums.PeerRelation relation;
  @JsonKey(name: 'connected')
  final bool connected;
  @JsonKey(name: 'gossip')
  final Gossip gossip;
  static const fromJsonFactory = _$PeerFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Peer &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.multiAddresses, multiAddresses) ||
                const DeepCollectionEquality()
                    .equals(other.multiAddresses, multiAddresses)) &&
            (identical(other.alias, alias) ||
                const DeepCollectionEquality().equals(other.alias, alias)) &&
            (identical(other.relation, relation) ||
                const DeepCollectionEquality()
                    .equals(other.relation, relation)) &&
            (identical(other.connected, connected) ||
                const DeepCollectionEquality()
                    .equals(other.connected, connected)) &&
            (identical(other.gossip, gossip) ||
                const DeepCollectionEquality().equals(other.gossip, gossip)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(multiAddresses) ^
      const DeepCollectionEquality().hash(alias) ^
      const DeepCollectionEquality().hash(relation) ^
      const DeepCollectionEquality().hash(connected) ^
      const DeepCollectionEquality().hash(gossip) ^
      runtimeType.hashCode;
}

extension $PeerExtension on Peer {
  Peer copyWith(
      {String? id,
      List<String>? multiAddresses,
      String? alias,
      enums.PeerRelation? relation,
      bool? connected,
      Gossip? gossip}) {
    return Peer(
        id: id ?? this.id,
        multiAddresses: multiAddresses ?? this.multiAddresses,
        alias: alias ?? this.alias,
        relation: relation ?? this.relation,
        connected: connected ?? this.connected,
        gossip: gossip ?? this.gossip);
  }

  Peer copyWithWrapped(
      {Wrapped<String>? id,
      Wrapped<List<String>>? multiAddresses,
      Wrapped<String?>? alias,
      Wrapped<enums.PeerRelation>? relation,
      Wrapped<bool>? connected,
      Wrapped<Gossip>? gossip}) {
    return Peer(
        id: (id != null ? id.value : this.id),
        multiAddresses: (multiAddresses != null
            ? multiAddresses.value
            : this.multiAddresses),
        alias: (alias != null ? alias.value : this.alias),
        relation: (relation != null ? relation.value : this.relation),
        connected: (connected != null ? connected.value : this.connected),
        gossip: (gossip != null ? gossip.value : this.gossip));
  }
}

@JsonSerializable(explicitToJson: true)
class Gossip {
  Gossip({
    this.heartbeat,
    this.metrics,
  });

  factory Gossip.fromJson(Map<String, dynamic> json) => _$GossipFromJson(json);

  static const toJsonFactory = _$GossipToJson;
  Map<String, dynamic> toJson() => _$GossipToJson(this);

  @JsonKey(name: 'heartbeat')
  final Heartbeat? heartbeat;
  @JsonKey(name: 'metrics')
  final Metrics? metrics;
  static const fromJsonFactory = _$GossipFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Gossip &&
            (identical(other.heartbeat, heartbeat) ||
                const DeepCollectionEquality()
                    .equals(other.heartbeat, heartbeat)) &&
            (identical(other.metrics, metrics) ||
                const DeepCollectionEquality().equals(other.metrics, metrics)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(heartbeat) ^
      const DeepCollectionEquality().hash(metrics) ^
      runtimeType.hashCode;
}

extension $GossipExtension on Gossip {
  Gossip copyWith({Heartbeat? heartbeat, Metrics? metrics}) {
    return Gossip(
        heartbeat: heartbeat ?? this.heartbeat,
        metrics: metrics ?? this.metrics);
  }

  Gossip copyWithWrapped(
      {Wrapped<Heartbeat?>? heartbeat, Wrapped<Metrics?>? metrics}) {
    return Gossip(
        heartbeat: (heartbeat != null ? heartbeat.value : this.heartbeat),
        metrics: (metrics != null ? metrics.value : this.metrics));
  }
}

@JsonSerializable(explicitToJson: true)
class Heartbeat {
  Heartbeat({
    this.solidMilestoneIndex,
    this.prunedMilestoneIndex,
    this.latestMilestoneIndex,
    this.connectedNeighbors,
    this.syncedNeighbors,
  });

  factory Heartbeat.fromJson(Map<String, dynamic> json) =>
      _$HeartbeatFromJson(json);

  static const toJsonFactory = _$HeartbeatToJson;
  Map<String, dynamic> toJson() => _$HeartbeatToJson(this);

  @JsonKey(name: 'solidMilestoneIndex')
  final int? solidMilestoneIndex;
  @JsonKey(name: 'prunedMilestoneIndex')
  final int? prunedMilestoneIndex;
  @JsonKey(name: 'latestMilestoneIndex')
  final int? latestMilestoneIndex;
  @JsonKey(name: 'connectedNeighbors')
  final int? connectedNeighbors;
  @JsonKey(name: 'syncedNeighbors')
  final int? syncedNeighbors;
  static const fromJsonFactory = _$HeartbeatFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Heartbeat &&
            (identical(other.solidMilestoneIndex, solidMilestoneIndex) ||
                const DeepCollectionEquality()
                    .equals(other.solidMilestoneIndex, solidMilestoneIndex)) &&
            (identical(other.prunedMilestoneIndex, prunedMilestoneIndex) ||
                const DeepCollectionEquality().equals(
                    other.prunedMilestoneIndex, prunedMilestoneIndex)) &&
            (identical(other.latestMilestoneIndex, latestMilestoneIndex) ||
                const DeepCollectionEquality().equals(
                    other.latestMilestoneIndex, latestMilestoneIndex)) &&
            (identical(other.connectedNeighbors, connectedNeighbors) ||
                const DeepCollectionEquality()
                    .equals(other.connectedNeighbors, connectedNeighbors)) &&
            (identical(other.syncedNeighbors, syncedNeighbors) ||
                const DeepCollectionEquality()
                    .equals(other.syncedNeighbors, syncedNeighbors)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(solidMilestoneIndex) ^
      const DeepCollectionEquality().hash(prunedMilestoneIndex) ^
      const DeepCollectionEquality().hash(latestMilestoneIndex) ^
      const DeepCollectionEquality().hash(connectedNeighbors) ^
      const DeepCollectionEquality().hash(syncedNeighbors) ^
      runtimeType.hashCode;
}

extension $HeartbeatExtension on Heartbeat {
  Heartbeat copyWith(
      {int? solidMilestoneIndex,
      int? prunedMilestoneIndex,
      int? latestMilestoneIndex,
      int? connectedNeighbors,
      int? syncedNeighbors}) {
    return Heartbeat(
        solidMilestoneIndex: solidMilestoneIndex ?? this.solidMilestoneIndex,
        prunedMilestoneIndex: prunedMilestoneIndex ?? this.prunedMilestoneIndex,
        latestMilestoneIndex: latestMilestoneIndex ?? this.latestMilestoneIndex,
        connectedNeighbors: connectedNeighbors ?? this.connectedNeighbors,
        syncedNeighbors: syncedNeighbors ?? this.syncedNeighbors);
  }

  Heartbeat copyWithWrapped(
      {Wrapped<int?>? solidMilestoneIndex,
      Wrapped<int?>? prunedMilestoneIndex,
      Wrapped<int?>? latestMilestoneIndex,
      Wrapped<int?>? connectedNeighbors,
      Wrapped<int?>? syncedNeighbors}) {
    return Heartbeat(
        solidMilestoneIndex: (solidMilestoneIndex != null
            ? solidMilestoneIndex.value
            : this.solidMilestoneIndex),
        prunedMilestoneIndex: (prunedMilestoneIndex != null
            ? prunedMilestoneIndex.value
            : this.prunedMilestoneIndex),
        latestMilestoneIndex: (latestMilestoneIndex != null
            ? latestMilestoneIndex.value
            : this.latestMilestoneIndex),
        connectedNeighbors: (connectedNeighbors != null
            ? connectedNeighbors.value
            : this.connectedNeighbors),
        syncedNeighbors: (syncedNeighbors != null
            ? syncedNeighbors.value
            : this.syncedNeighbors));
  }
}

@JsonSerializable(explicitToJson: true)
class Metrics {
  Metrics({
    required this.newMessages,
    required this.knownMessages,
    required this.receivedMessages,
    required this.receivedMessageRequests,
    required this.receivedMilestoneRequests,
    required this.receivedHeartbeats,
    required this.sentMessages,
    required this.sentMessageRequests,
    required this.sentMilestoneRequests,
    required this.sentHeartbeats,
    required this.droppedPackets,
  });

  factory Metrics.fromJson(Map<String, dynamic> json) =>
      _$MetricsFromJson(json);

  static const toJsonFactory = _$MetricsToJson;
  Map<String, dynamic> toJson() => _$MetricsToJson(this);

  @JsonKey(name: 'newMessages')
  final int newMessages;
  @JsonKey(name: 'knownMessages')
  final int knownMessages;
  @JsonKey(name: 'receivedMessages')
  final int receivedMessages;
  @JsonKey(name: 'receivedMessageRequests')
  final int receivedMessageRequests;
  @JsonKey(name: 'receivedMilestoneRequests')
  final int receivedMilestoneRequests;
  @JsonKey(name: 'receivedHeartbeats')
  final int receivedHeartbeats;
  @JsonKey(name: 'sentMessages')
  final int sentMessages;
  @JsonKey(name: 'sentMessageRequests')
  final int sentMessageRequests;
  @JsonKey(name: 'sentMilestoneRequests')
  final int sentMilestoneRequests;
  @JsonKey(name: 'sentHeartbeats')
  final int sentHeartbeats;
  @JsonKey(name: 'droppedPackets')
  final int droppedPackets;
  static const fromJsonFactory = _$MetricsFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Metrics &&
            (identical(other.newMessages, newMessages) ||
                const DeepCollectionEquality()
                    .equals(other.newMessages, newMessages)) &&
            (identical(other.knownMessages, knownMessages) ||
                const DeepCollectionEquality()
                    .equals(other.knownMessages, knownMessages)) &&
            (identical(other.receivedMessages, receivedMessages) ||
                const DeepCollectionEquality()
                    .equals(other.receivedMessages, receivedMessages)) &&
            (identical(
                    other.receivedMessageRequests, receivedMessageRequests) ||
                const DeepCollectionEquality().equals(
                    other.receivedMessageRequests, receivedMessageRequests)) &&
            (identical(other.receivedMilestoneRequests,
                    receivedMilestoneRequests) ||
                const DeepCollectionEquality().equals(
                    other.receivedMilestoneRequests,
                    receivedMilestoneRequests)) &&
            (identical(other.receivedHeartbeats, receivedHeartbeats) ||
                const DeepCollectionEquality()
                    .equals(other.receivedHeartbeats, receivedHeartbeats)) &&
            (identical(other.sentMessages, sentMessages) ||
                const DeepCollectionEquality()
                    .equals(other.sentMessages, sentMessages)) &&
            (identical(other.sentMessageRequests, sentMessageRequests) ||
                const DeepCollectionEquality()
                    .equals(other.sentMessageRequests, sentMessageRequests)) &&
            (identical(other.sentMilestoneRequests, sentMilestoneRequests) ||
                const DeepCollectionEquality().equals(
                    other.sentMilestoneRequests, sentMilestoneRequests)) &&
            (identical(other.sentHeartbeats, sentHeartbeats) ||
                const DeepCollectionEquality()
                    .equals(other.sentHeartbeats, sentHeartbeats)) &&
            (identical(other.droppedPackets, droppedPackets) ||
                const DeepCollectionEquality()
                    .equals(other.droppedPackets, droppedPackets)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(newMessages) ^
      const DeepCollectionEquality().hash(knownMessages) ^
      const DeepCollectionEquality().hash(receivedMessages) ^
      const DeepCollectionEquality().hash(receivedMessageRequests) ^
      const DeepCollectionEquality().hash(receivedMilestoneRequests) ^
      const DeepCollectionEquality().hash(receivedHeartbeats) ^
      const DeepCollectionEquality().hash(sentMessages) ^
      const DeepCollectionEquality().hash(sentMessageRequests) ^
      const DeepCollectionEquality().hash(sentMilestoneRequests) ^
      const DeepCollectionEquality().hash(sentHeartbeats) ^
      const DeepCollectionEquality().hash(droppedPackets) ^
      runtimeType.hashCode;
}

extension $MetricsExtension on Metrics {
  Metrics copyWith(
      {int? newMessages,
      int? knownMessages,
      int? receivedMessages,
      int? receivedMessageRequests,
      int? receivedMilestoneRequests,
      int? receivedHeartbeats,
      int? sentMessages,
      int? sentMessageRequests,
      int? sentMilestoneRequests,
      int? sentHeartbeats,
      int? droppedPackets}) {
    return Metrics(
        newMessages: newMessages ?? this.newMessages,
        knownMessages: knownMessages ?? this.knownMessages,
        receivedMessages: receivedMessages ?? this.receivedMessages,
        receivedMessageRequests:
            receivedMessageRequests ?? this.receivedMessageRequests,
        receivedMilestoneRequests:
            receivedMilestoneRequests ?? this.receivedMilestoneRequests,
        receivedHeartbeats: receivedHeartbeats ?? this.receivedHeartbeats,
        sentMessages: sentMessages ?? this.sentMessages,
        sentMessageRequests: sentMessageRequests ?? this.sentMessageRequests,
        sentMilestoneRequests:
            sentMilestoneRequests ?? this.sentMilestoneRequests,
        sentHeartbeats: sentHeartbeats ?? this.sentHeartbeats,
        droppedPackets: droppedPackets ?? this.droppedPackets);
  }

  Metrics copyWithWrapped(
      {Wrapped<int>? newMessages,
      Wrapped<int>? knownMessages,
      Wrapped<int>? receivedMessages,
      Wrapped<int>? receivedMessageRequests,
      Wrapped<int>? receivedMilestoneRequests,
      Wrapped<int>? receivedHeartbeats,
      Wrapped<int>? sentMessages,
      Wrapped<int>? sentMessageRequests,
      Wrapped<int>? sentMilestoneRequests,
      Wrapped<int>? sentHeartbeats,
      Wrapped<int>? droppedPackets}) {
    return Metrics(
        newMessages:
            (newMessages != null ? newMessages.value : this.newMessages),
        knownMessages:
            (knownMessages != null ? knownMessages.value : this.knownMessages),
        receivedMessages: (receivedMessages != null
            ? receivedMessages.value
            : this.receivedMessages),
        receivedMessageRequests: (receivedMessageRequests != null
            ? receivedMessageRequests.value
            : this.receivedMessageRequests),
        receivedMilestoneRequests: (receivedMilestoneRequests != null
            ? receivedMilestoneRequests.value
            : this.receivedMilestoneRequests),
        receivedHeartbeats: (receivedHeartbeats != null
            ? receivedHeartbeats.value
            : this.receivedHeartbeats),
        sentMessages:
            (sentMessages != null ? sentMessages.value : this.sentMessages),
        sentMessageRequests: (sentMessageRequests != null
            ? sentMessageRequests.value
            : this.sentMessageRequests),
        sentMilestoneRequests: (sentMilestoneRequests != null
            ? sentMilestoneRequests.value
            : this.sentMilestoneRequests),
        sentHeartbeats: (sentHeartbeats != null
            ? sentHeartbeats.value
            : this.sentHeartbeats),
        droppedPackets: (droppedPackets != null
            ? droppedPackets.value
            : this.droppedPackets));
  }
}

@JsonSerializable(explicitToJson: true)
class ReceiptTuple {
  ReceiptTuple({
    required this.receipt,
    required this.milestoneIndex,
  });

  factory ReceiptTuple.fromJson(Map<String, dynamic> json) =>
      _$ReceiptTupleFromJson(json);

  static const toJsonFactory = _$ReceiptTupleToJson;
  Map<String, dynamic> toJson() => _$ReceiptTupleToJson(this);

  @JsonKey(name: 'receipt')
  final ReceiptPayload receipt;
  @JsonKey(name: 'milestoneIndex')
  final int milestoneIndex;
  static const fromJsonFactory = _$ReceiptTupleFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ReceiptTuple &&
            (identical(other.receipt, receipt) ||
                const DeepCollectionEquality()
                    .equals(other.receipt, receipt)) &&
            (identical(other.milestoneIndex, milestoneIndex) ||
                const DeepCollectionEquality()
                    .equals(other.milestoneIndex, milestoneIndex)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(receipt) ^
      const DeepCollectionEquality().hash(milestoneIndex) ^
      runtimeType.hashCode;
}

extension $ReceiptTupleExtension on ReceiptTuple {
  ReceiptTuple copyWith({ReceiptPayload? receipt, int? milestoneIndex}) {
    return ReceiptTuple(
        receipt: receipt ?? this.receipt,
        milestoneIndex: milestoneIndex ?? this.milestoneIndex);
  }

  ReceiptTuple copyWithWrapped(
      {Wrapped<ReceiptPayload>? receipt, Wrapped<int>? milestoneIndex}) {
    return ReceiptTuple(
        receipt: (receipt != null ? receipt.value : this.receipt),
        milestoneIndex: (milestoneIndex != null
            ? milestoneIndex.value
            : this.milestoneIndex));
  }
}

@JsonSerializable(explicitToJson: true)
class ReceiptPayload {
  ReceiptPayload({
    required this.migratedAt,
    required this.$final,
    required this.funds,
    required this.transaction,
  });

  factory ReceiptPayload.fromJson(Map<String, dynamic> json) =>
      _$ReceiptPayloadFromJson(json);

  static const toJsonFactory = _$ReceiptPayloadToJson;
  Map<String, dynamic> toJson() => _$ReceiptPayloadToJson(this);

  @JsonKey(name: 'migratedAt')
  final int migratedAt;
  @JsonKey(name: 'final')
  final bool $final;
  @JsonKey(name: 'funds', defaultValue: <MigratedFundsEntry>[])
  final List<MigratedFundsEntry> funds;
  @JsonKey(name: 'transaction')
  final TreasuryTransactionPayload transaction;
  static const fromJsonFactory = _$ReceiptPayloadFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ReceiptPayload &&
            (identical(other.migratedAt, migratedAt) ||
                const DeepCollectionEquality()
                    .equals(other.migratedAt, migratedAt)) &&
            (identical(other.$final, $final) ||
                const DeepCollectionEquality().equals(other.$final, $final)) &&
            (identical(other.funds, funds) ||
                const DeepCollectionEquality().equals(other.funds, funds)) &&
            (identical(other.transaction, transaction) ||
                const DeepCollectionEquality()
                    .equals(other.transaction, transaction)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(migratedAt) ^
      const DeepCollectionEquality().hash($final) ^
      const DeepCollectionEquality().hash(funds) ^
      const DeepCollectionEquality().hash(transaction) ^
      runtimeType.hashCode;
}

extension $ReceiptPayloadExtension on ReceiptPayload {
  ReceiptPayload copyWith(
      {int? migratedAt,
      bool? $final,
      List<MigratedFundsEntry>? funds,
      TreasuryTransactionPayload? transaction}) {
    return ReceiptPayload(
        migratedAt: migratedAt ?? this.migratedAt,
        $final: $final ?? this.$final,
        funds: funds ?? this.funds,
        transaction: transaction ?? this.transaction);
  }

  ReceiptPayload copyWithWrapped(
      {Wrapped<int>? migratedAt,
      Wrapped<bool>? $final,
      Wrapped<List<MigratedFundsEntry>>? funds,
      Wrapped<TreasuryTransactionPayload>? transaction}) {
    return ReceiptPayload(
        migratedAt: (migratedAt != null ? migratedAt.value : this.migratedAt),
        $final: ($final != null ? $final.value : this.$final),
        funds: (funds != null ? funds.value : this.funds),
        transaction:
            (transaction != null ? transaction.value : this.transaction));
  }
}

@JsonSerializable(explicitToJson: true)
class MigratedFundsEntry {
  MigratedFundsEntry({
    required this.tailTransactionHash,
    required this.address,
    required this.deposit,
  });

  factory MigratedFundsEntry.fromJson(Map<String, dynamic> json) =>
      _$MigratedFundsEntryFromJson(json);

  static const toJsonFactory = _$MigratedFundsEntryToJson;
  Map<String, dynamic> toJson() => _$MigratedFundsEntryToJson(this);

  @JsonKey(name: 'tailTransactionHash')
  final String tailTransactionHash;
  @JsonKey(name: 'address')
  final dynamic address;
  @JsonKey(name: 'deposit')
  final int deposit;
  static const fromJsonFactory = _$MigratedFundsEntryFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is MigratedFundsEntry &&
            (identical(other.tailTransactionHash, tailTransactionHash) ||
                const DeepCollectionEquality()
                    .equals(other.tailTransactionHash, tailTransactionHash)) &&
            (identical(other.address, address) ||
                const DeepCollectionEquality()
                    .equals(other.address, address)) &&
            (identical(other.deposit, deposit) ||
                const DeepCollectionEquality().equals(other.deposit, deposit)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(tailTransactionHash) ^
      const DeepCollectionEquality().hash(address) ^
      const DeepCollectionEquality().hash(deposit) ^
      runtimeType.hashCode;
}

extension $MigratedFundsEntryExtension on MigratedFundsEntry {
  MigratedFundsEntry copyWith(
      {String? tailTransactionHash, dynamic address, int? deposit}) {
    return MigratedFundsEntry(
        tailTransactionHash: tailTransactionHash ?? this.tailTransactionHash,
        address: address ?? this.address,
        deposit: deposit ?? this.deposit);
  }

  MigratedFundsEntry copyWithWrapped(
      {Wrapped<String>? tailTransactionHash,
      Wrapped<dynamic>? address,
      Wrapped<int>? deposit}) {
    return MigratedFundsEntry(
        tailTransactionHash: (tailTransactionHash != null
            ? tailTransactionHash.value
            : this.tailTransactionHash),
        address: (address != null ? address.value : this.address),
        deposit: (deposit != null ? deposit.value : this.deposit));
  }
}

@JsonSerializable(explicitToJson: true)
class ErrorResponse {
  ErrorResponse({
    required this.error,
  });

  factory ErrorResponse.fromJson(Map<String, dynamic> json) =>
      _$ErrorResponseFromJson(json);

  static const toJsonFactory = _$ErrorResponseToJson;
  Map<String, dynamic> toJson() => _$ErrorResponseToJson(this);

  @JsonKey(name: 'error')
  final ErrorResponse$Error error;
  static const fromJsonFactory = _$ErrorResponseFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ErrorResponse &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(error) ^ runtimeType.hashCode;
}

extension $ErrorResponseExtension on ErrorResponse {
  ErrorResponse copyWith({ErrorResponse$Error? error}) {
    return ErrorResponse(error: error ?? this.error);
  }

  ErrorResponse copyWithWrapped({Wrapped<ErrorResponse$Error>? error}) {
    return ErrorResponse(error: (error != null ? error.value : this.error));
  }
}

@JsonSerializable(explicitToJson: true)
class ForbiddenResponse {
  ForbiddenResponse({
    required this.error,
  });

  factory ForbiddenResponse.fromJson(Map<String, dynamic> json) =>
      _$ForbiddenResponseFromJson(json);

  static const toJsonFactory = _$ForbiddenResponseToJson;
  Map<String, dynamic> toJson() => _$ForbiddenResponseToJson(this);

  @JsonKey(name: 'error')
  final ForbiddenResponse$Error error;
  static const fromJsonFactory = _$ForbiddenResponseFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ForbiddenResponse &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(error) ^ runtimeType.hashCode;
}

extension $ForbiddenResponseExtension on ForbiddenResponse {
  ForbiddenResponse copyWith({ForbiddenResponse$Error? error}) {
    return ForbiddenResponse(error: error ?? this.error);
  }

  ForbiddenResponse copyWithWrapped({Wrapped<ForbiddenResponse$Error>? error}) {
    return ForbiddenResponse(error: (error != null ? error.value : this.error));
  }
}

@JsonSerializable(explicitToJson: true)
class ServiceUnavailableResponse {
  ServiceUnavailableResponse({
    required this.error,
  });

  factory ServiceUnavailableResponse.fromJson(Map<String, dynamic> json) =>
      _$ServiceUnavailableResponseFromJson(json);

  static const toJsonFactory = _$ServiceUnavailableResponseToJson;
  Map<String, dynamic> toJson() => _$ServiceUnavailableResponseToJson(this);

  @JsonKey(name: 'error')
  final ServiceUnavailableResponse$Error error;
  static const fromJsonFactory = _$ServiceUnavailableResponseFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ServiceUnavailableResponse &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(error) ^ runtimeType.hashCode;
}

extension $ServiceUnavailableResponseExtension on ServiceUnavailableResponse {
  ServiceUnavailableResponse copyWith(
      {ServiceUnavailableResponse$Error? error}) {
    return ServiceUnavailableResponse(error: error ?? this.error);
  }

  ServiceUnavailableResponse copyWithWrapped(
      {Wrapped<ServiceUnavailableResponse$Error>? error}) {
    return ServiceUnavailableResponse(
        error: (error != null ? error.value : this.error));
  }
}

@JsonSerializable(explicitToJson: true)
class BadRequestResponse {
  BadRequestResponse({
    required this.error,
  });

  factory BadRequestResponse.fromJson(Map<String, dynamic> json) =>
      _$BadRequestResponseFromJson(json);

  static const toJsonFactory = _$BadRequestResponseToJson;
  Map<String, dynamic> toJson() => _$BadRequestResponseToJson(this);

  @JsonKey(name: 'error')
  final BadRequestResponse$Error error;
  static const fromJsonFactory = _$BadRequestResponseFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is BadRequestResponse &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(error) ^ runtimeType.hashCode;
}

extension $BadRequestResponseExtension on BadRequestResponse {
  BadRequestResponse copyWith({BadRequestResponse$Error? error}) {
    return BadRequestResponse(error: error ?? this.error);
  }

  BadRequestResponse copyWithWrapped(
      {Wrapped<BadRequestResponse$Error>? error}) {
    return BadRequestResponse(
        error: (error != null ? error.value : this.error));
  }
}

@JsonSerializable(explicitToJson: true)
class NotFoundResponse {
  NotFoundResponse({
    required this.error,
  });

  factory NotFoundResponse.fromJson(Map<String, dynamic> json) =>
      _$NotFoundResponseFromJson(json);

  static const toJsonFactory = _$NotFoundResponseToJson;
  Map<String, dynamic> toJson() => _$NotFoundResponseToJson(this);

  @JsonKey(name: 'error')
  final NotFoundResponse$Error error;
  static const fromJsonFactory = _$NotFoundResponseFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is NotFoundResponse &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(error) ^ runtimeType.hashCode;
}

extension $NotFoundResponseExtension on NotFoundResponse {
  NotFoundResponse copyWith({NotFoundResponse$Error? error}) {
    return NotFoundResponse(error: error ?? this.error);
  }

  NotFoundResponse copyWithWrapped({Wrapped<NotFoundResponse$Error>? error}) {
    return NotFoundResponse(error: (error != null ? error.value : this.error));
  }
}

@JsonSerializable(explicitToJson: true)
class InternalErrorResponse {
  InternalErrorResponse({
    required this.error,
  });

  factory InternalErrorResponse.fromJson(Map<String, dynamic> json) =>
      _$InternalErrorResponseFromJson(json);

  static const toJsonFactory = _$InternalErrorResponseToJson;
  Map<String, dynamic> toJson() => _$InternalErrorResponseToJson(this);

  @JsonKey(name: 'error')
  final InternalErrorResponse$Error error;
  static const fromJsonFactory = _$InternalErrorResponseFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is InternalErrorResponse &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(error) ^ runtimeType.hashCode;
}

extension $InternalErrorResponseExtension on InternalErrorResponse {
  InternalErrorResponse copyWith({InternalErrorResponse$Error? error}) {
    return InternalErrorResponse(error: error ?? this.error);
  }

  InternalErrorResponse copyWithWrapped(
      {Wrapped<InternalErrorResponse$Error>? error}) {
    return InternalErrorResponse(
        error: (error != null ? error.value : this.error));
  }
}

@JsonSerializable(explicitToJson: true)
class InfoResponse {
  InfoResponse({
    required this.data,
  });

  factory InfoResponse.fromJson(Map<String, dynamic> json) =>
      _$InfoResponseFromJson(json);

  static const toJsonFactory = _$InfoResponseToJson;
  Map<String, dynamic> toJson() => _$InfoResponseToJson(this);

  @JsonKey(name: 'data')
  final InfoResponse$Data data;
  static const fromJsonFactory = _$InfoResponseFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is InfoResponse &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(data) ^ runtimeType.hashCode;
}

extension $InfoResponseExtension on InfoResponse {
  InfoResponse copyWith({InfoResponse$Data? data}) {
    return InfoResponse(data: data ?? this.data);
  }

  InfoResponse copyWithWrapped({Wrapped<InfoResponse$Data>? data}) {
    return InfoResponse(data: (data != null ? data.value : this.data));
  }
}

@JsonSerializable(explicitToJson: true)
class TipsResponse {
  TipsResponse({
    required this.data,
  });

  factory TipsResponse.fromJson(Map<String, dynamic> json) =>
      _$TipsResponseFromJson(json);

  static const toJsonFactory = _$TipsResponseToJson;
  Map<String, dynamic> toJson() => _$TipsResponseToJson(this);

  @JsonKey(name: 'data')
  final TipsResponse$Data data;
  static const fromJsonFactory = _$TipsResponseFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is TipsResponse &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(data) ^ runtimeType.hashCode;
}

extension $TipsResponseExtension on TipsResponse {
  TipsResponse copyWith({TipsResponse$Data? data}) {
    return TipsResponse(data: data ?? this.data);
  }

  TipsResponse copyWithWrapped({Wrapped<TipsResponse$Data>? data}) {
    return TipsResponse(data: (data != null ? data.value : this.data));
  }
}

@JsonSerializable(explicitToJson: true)
class SubmitMessageRequest {
  SubmitMessageRequest({
    this.networkId,
    this.parentMessageIds,
    this.payload,
    this.nonce,
  });

  factory SubmitMessageRequest.fromJson(Map<String, dynamic> json) =>
      _$SubmitMessageRequestFromJson(json);

  static const toJsonFactory = _$SubmitMessageRequestToJson;
  Map<String, dynamic> toJson() => _$SubmitMessageRequestToJson(this);

  @JsonKey(name: 'networkId')
  final String? networkId;
  @JsonKey(name: 'parentMessageIds', defaultValue: <String>[])
  final List<String>? parentMessageIds;
  @JsonKey(name: 'payload')
  final dynamic payload;
  @JsonKey(name: 'nonce')
  final String? nonce;
  static const fromJsonFactory = _$SubmitMessageRequestFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SubmitMessageRequest &&
            (identical(other.networkId, networkId) ||
                const DeepCollectionEquality()
                    .equals(other.networkId, networkId)) &&
            (identical(other.parentMessageIds, parentMessageIds) ||
                const DeepCollectionEquality()
                    .equals(other.parentMessageIds, parentMessageIds)) &&
            (identical(other.payload, payload) ||
                const DeepCollectionEquality()
                    .equals(other.payload, payload)) &&
            (identical(other.nonce, nonce) ||
                const DeepCollectionEquality().equals(other.nonce, nonce)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(networkId) ^
      const DeepCollectionEquality().hash(parentMessageIds) ^
      const DeepCollectionEquality().hash(payload) ^
      const DeepCollectionEquality().hash(nonce) ^
      runtimeType.hashCode;
}

extension $SubmitMessageRequestExtension on SubmitMessageRequest {
  SubmitMessageRequest copyWith(
      {String? networkId,
      List<String>? parentMessageIds,
      dynamic payload,
      String? nonce}) {
    return SubmitMessageRequest(
        networkId: networkId ?? this.networkId,
        parentMessageIds: parentMessageIds ?? this.parentMessageIds,
        payload: payload ?? this.payload,
        nonce: nonce ?? this.nonce);
  }

  SubmitMessageRequest copyWithWrapped(
      {Wrapped<String?>? networkId,
      Wrapped<List<String>?>? parentMessageIds,
      Wrapped<dynamic>? payload,
      Wrapped<String?>? nonce}) {
    return SubmitMessageRequest(
        networkId: (networkId != null ? networkId.value : this.networkId),
        parentMessageIds: (parentMessageIds != null
            ? parentMessageIds.value
            : this.parentMessageIds),
        payload: (payload != null ? payload.value : this.payload),
        nonce: (nonce != null ? nonce.value : this.nonce));
  }
}

@JsonSerializable(explicitToJson: true)
class SubmitMessageResponse {
  SubmitMessageResponse({
    required this.data,
  });

  factory SubmitMessageResponse.fromJson(Map<String, dynamic> json) =>
      _$SubmitMessageResponseFromJson(json);

  static const toJsonFactory = _$SubmitMessageResponseToJson;
  Map<String, dynamic> toJson() => _$SubmitMessageResponseToJson(this);

  @JsonKey(name: 'data')
  final SubmitMessageResponse$Data data;
  static const fromJsonFactory = _$SubmitMessageResponseFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SubmitMessageResponse &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(data) ^ runtimeType.hashCode;
}

extension $SubmitMessageResponseExtension on SubmitMessageResponse {
  SubmitMessageResponse copyWith({SubmitMessageResponse$Data? data}) {
    return SubmitMessageResponse(data: data ?? this.data);
  }

  SubmitMessageResponse copyWithWrapped(
      {Wrapped<SubmitMessageResponse$Data>? data}) {
    return SubmitMessageResponse(data: (data != null ? data.value : this.data));
  }
}

@JsonSerializable(explicitToJson: true)
class MessagesFindResponse {
  MessagesFindResponse({
    required this.data,
  });

  factory MessagesFindResponse.fromJson(Map<String, dynamic> json) =>
      _$MessagesFindResponseFromJson(json);

  static const toJsonFactory = _$MessagesFindResponseToJson;
  Map<String, dynamic> toJson() => _$MessagesFindResponseToJson(this);

  @JsonKey(name: 'data')
  final MessagesFindResponse$Data data;
  static const fromJsonFactory = _$MessagesFindResponseFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is MessagesFindResponse &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(data) ^ runtimeType.hashCode;
}

extension $MessagesFindResponseExtension on MessagesFindResponse {
  MessagesFindResponse copyWith({MessagesFindResponse$Data? data}) {
    return MessagesFindResponse(data: data ?? this.data);
  }

  MessagesFindResponse copyWithWrapped(
      {Wrapped<MessagesFindResponse$Data>? data}) {
    return MessagesFindResponse(data: (data != null ? data.value : this.data));
  }
}

@JsonSerializable(explicitToJson: true)
class MessageMetadataResponse {
  MessageMetadataResponse({
    required this.data,
  });

  factory MessageMetadataResponse.fromJson(Map<String, dynamic> json) =>
      _$MessageMetadataResponseFromJson(json);

  static const toJsonFactory = _$MessageMetadataResponseToJson;
  Map<String, dynamic> toJson() => _$MessageMetadataResponseToJson(this);

  @JsonKey(name: 'data')
  final MessageMetadataResponse$Data data;
  static const fromJsonFactory = _$MessageMetadataResponseFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is MessageMetadataResponse &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(data) ^ runtimeType.hashCode;
}

extension $MessageMetadataResponseExtension on MessageMetadataResponse {
  MessageMetadataResponse copyWith({MessageMetadataResponse$Data? data}) {
    return MessageMetadataResponse(data: data ?? this.data);
  }

  MessageMetadataResponse copyWithWrapped(
      {Wrapped<MessageMetadataResponse$Data>? data}) {
    return MessageMetadataResponse(
        data: (data != null ? data.value : this.data));
  }
}

@JsonSerializable(explicitToJson: true)
class MessageResponse {
  MessageResponse({
    required this.data,
  });

  factory MessageResponse.fromJson(Map<String, dynamic> json) =>
      _$MessageResponseFromJson(json);

  static const toJsonFactory = _$MessageResponseToJson;
  Map<String, dynamic> toJson() => _$MessageResponseToJson(this);

  @JsonKey(name: 'data')
  final MessageResponse$Data data;
  static const fromJsonFactory = _$MessageResponseFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is MessageResponse &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(data) ^ runtimeType.hashCode;
}

extension $MessageResponseExtension on MessageResponse {
  MessageResponse copyWith({MessageResponse$Data? data}) {
    return MessageResponse(data: data ?? this.data);
  }

  MessageResponse copyWithWrapped({Wrapped<MessageResponse$Data>? data}) {
    return MessageResponse(data: (data != null ? data.value : this.data));
  }
}

@JsonSerializable(explicitToJson: true)
class MessageChildrenResponse {
  MessageChildrenResponse({
    required this.data,
  });

  factory MessageChildrenResponse.fromJson(Map<String, dynamic> json) =>
      _$MessageChildrenResponseFromJson(json);

  static const toJsonFactory = _$MessageChildrenResponseToJson;
  Map<String, dynamic> toJson() => _$MessageChildrenResponseToJson(this);

  @JsonKey(name: 'data')
  final MessageChildrenResponse$Data data;
  static const fromJsonFactory = _$MessageChildrenResponseFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is MessageChildrenResponse &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(data) ^ runtimeType.hashCode;
}

extension $MessageChildrenResponseExtension on MessageChildrenResponse {
  MessageChildrenResponse copyWith({MessageChildrenResponse$Data? data}) {
    return MessageChildrenResponse(data: data ?? this.data);
  }

  MessageChildrenResponse copyWithWrapped(
      {Wrapped<MessageChildrenResponse$Data>? data}) {
    return MessageChildrenResponse(
        data: (data != null ? data.value : this.data));
  }
}

@JsonSerializable(explicitToJson: true)
class OutputResponse {
  OutputResponse({
    required this.data,
  });

  factory OutputResponse.fromJson(Map<String, dynamic> json) =>
      _$OutputResponseFromJson(json);

  static const toJsonFactory = _$OutputResponseToJson;
  Map<String, dynamic> toJson() => _$OutputResponseToJson(this);

  @JsonKey(name: 'data')
  final OutputResponse$Data data;
  static const fromJsonFactory = _$OutputResponseFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is OutputResponse &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(data) ^ runtimeType.hashCode;
}

extension $OutputResponseExtension on OutputResponse {
  OutputResponse copyWith({OutputResponse$Data? data}) {
    return OutputResponse(data: data ?? this.data);
  }

  OutputResponse copyWithWrapped({Wrapped<OutputResponse$Data>? data}) {
    return OutputResponse(data: (data != null ? data.value : this.data));
  }
}

@JsonSerializable(explicitToJson: true)
class BalanceAddressResponse {
  BalanceAddressResponse({
    required this.data,
  });

  factory BalanceAddressResponse.fromJson(Map<String, dynamic> json) =>
      _$BalanceAddressResponseFromJson(json);

  static const toJsonFactory = _$BalanceAddressResponseToJson;
  Map<String, dynamic> toJson() => _$BalanceAddressResponseToJson(this);

  @JsonKey(name: 'data')
  final BalanceAddressResponse$Data data;
  static const fromJsonFactory = _$BalanceAddressResponseFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is BalanceAddressResponse &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(data) ^ runtimeType.hashCode;
}

extension $BalanceAddressResponseExtension on BalanceAddressResponse {
  BalanceAddressResponse copyWith({BalanceAddressResponse$Data? data}) {
    return BalanceAddressResponse(data: data ?? this.data);
  }

  BalanceAddressResponse copyWithWrapped(
      {Wrapped<BalanceAddressResponse$Data>? data}) {
    return BalanceAddressResponse(
        data: (data != null ? data.value : this.data));
  }
}

@JsonSerializable(explicitToJson: true)
class OutputsAddressResponse {
  OutputsAddressResponse({
    required this.data,
  });

  factory OutputsAddressResponse.fromJson(Map<String, dynamic> json) =>
      _$OutputsAddressResponseFromJson(json);

  static const toJsonFactory = _$OutputsAddressResponseToJson;
  Map<String, dynamic> toJson() => _$OutputsAddressResponseToJson(this);

  @JsonKey(name: 'data')
  final OutputsAddressResponse$Data data;
  static const fromJsonFactory = _$OutputsAddressResponseFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is OutputsAddressResponse &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(data) ^ runtimeType.hashCode;
}

extension $OutputsAddressResponseExtension on OutputsAddressResponse {
  OutputsAddressResponse copyWith({OutputsAddressResponse$Data? data}) {
    return OutputsAddressResponse(data: data ?? this.data);
  }

  OutputsAddressResponse copyWithWrapped(
      {Wrapped<OutputsAddressResponse$Data>? data}) {
    return OutputsAddressResponse(
        data: (data != null ? data.value : this.data));
  }
}

@JsonSerializable(explicitToJson: true)
class ReceiptsResponse {
  ReceiptsResponse({
    required this.data,
  });

  factory ReceiptsResponse.fromJson(Map<String, dynamic> json) =>
      _$ReceiptsResponseFromJson(json);

  static const toJsonFactory = _$ReceiptsResponseToJson;
  Map<String, dynamic> toJson() => _$ReceiptsResponseToJson(this);

  @JsonKey(name: 'data')
  final ReceiptsResponse$Data data;
  static const fromJsonFactory = _$ReceiptsResponseFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ReceiptsResponse &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(data) ^ runtimeType.hashCode;
}

extension $ReceiptsResponseExtension on ReceiptsResponse {
  ReceiptsResponse copyWith({ReceiptsResponse$Data? data}) {
    return ReceiptsResponse(data: data ?? this.data);
  }

  ReceiptsResponse copyWithWrapped({Wrapped<ReceiptsResponse$Data>? data}) {
    return ReceiptsResponse(data: (data != null ? data.value : this.data));
  }
}

@JsonSerializable(explicitToJson: true)
class TreasuryResponse {
  TreasuryResponse({
    required this.data,
  });

  factory TreasuryResponse.fromJson(Map<String, dynamic> json) =>
      _$TreasuryResponseFromJson(json);

  static const toJsonFactory = _$TreasuryResponseToJson;
  Map<String, dynamic> toJson() => _$TreasuryResponseToJson(this);

  @JsonKey(name: 'data')
  final TreasuryResponse$Data data;
  static const fromJsonFactory = _$TreasuryResponseFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is TreasuryResponse &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(data) ^ runtimeType.hashCode;
}

extension $TreasuryResponseExtension on TreasuryResponse {
  TreasuryResponse copyWith({TreasuryResponse$Data? data}) {
    return TreasuryResponse(data: data ?? this.data);
  }

  TreasuryResponse copyWithWrapped({Wrapped<TreasuryResponse$Data>? data}) {
    return TreasuryResponse(data: (data != null ? data.value : this.data));
  }
}

@JsonSerializable(explicitToJson: true)
class MilestoneResponse {
  MilestoneResponse({
    required this.data,
  });

  factory MilestoneResponse.fromJson(Map<String, dynamic> json) =>
      _$MilestoneResponseFromJson(json);

  static const toJsonFactory = _$MilestoneResponseToJson;
  Map<String, dynamic> toJson() => _$MilestoneResponseToJson(this);

  @JsonKey(name: 'data')
  final MilestoneResponse$Data data;
  static const fromJsonFactory = _$MilestoneResponseFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is MilestoneResponse &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(data) ^ runtimeType.hashCode;
}

extension $MilestoneResponseExtension on MilestoneResponse {
  MilestoneResponse copyWith({MilestoneResponse$Data? data}) {
    return MilestoneResponse(data: data ?? this.data);
  }

  MilestoneResponse copyWithWrapped({Wrapped<MilestoneResponse$Data>? data}) {
    return MilestoneResponse(data: (data != null ? data.value : this.data));
  }
}

@JsonSerializable(explicitToJson: true)
class UTXOChangesResponse {
  UTXOChangesResponse({
    required this.data,
  });

  factory UTXOChangesResponse.fromJson(Map<String, dynamic> json) =>
      _$UTXOChangesResponseFromJson(json);

  static const toJsonFactory = _$UTXOChangesResponseToJson;
  Map<String, dynamic> toJson() => _$UTXOChangesResponseToJson(this);

  @JsonKey(name: 'data')
  final UTXOChangesResponse$Data data;
  static const fromJsonFactory = _$UTXOChangesResponseFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UTXOChangesResponse &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(data) ^ runtimeType.hashCode;
}

extension $UTXOChangesResponseExtension on UTXOChangesResponse {
  UTXOChangesResponse copyWith({UTXOChangesResponse$Data? data}) {
    return UTXOChangesResponse(data: data ?? this.data);
  }

  UTXOChangesResponse copyWithWrapped(
      {Wrapped<UTXOChangesResponse$Data>? data}) {
    return UTXOChangesResponse(data: (data != null ? data.value : this.data));
  }
}

@JsonSerializable(explicitToJson: true)
class PeersResponse {
  PeersResponse({
    required this.data,
  });

  factory PeersResponse.fromJson(Map<String, dynamic> json) =>
      _$PeersResponseFromJson(json);

  static const toJsonFactory = _$PeersResponseToJson;
  Map<String, dynamic> toJson() => _$PeersResponseToJson(this);

  @JsonKey(name: 'data', defaultValue: <Peer>[])
  final List<Peer> data;
  static const fromJsonFactory = _$PeersResponseFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PeersResponse &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(data) ^ runtimeType.hashCode;
}

extension $PeersResponseExtension on PeersResponse {
  PeersResponse copyWith({List<Peer>? data}) {
    return PeersResponse(data: data ?? this.data);
  }

  PeersResponse copyWithWrapped({Wrapped<List<Peer>>? data}) {
    return PeersResponse(data: (data != null ? data.value : this.data));
  }
}

@JsonSerializable(explicitToJson: true)
class PeerResponse {
  PeerResponse({
    required this.data,
  });

  factory PeerResponse.fromJson(Map<String, dynamic> json) =>
      _$PeerResponseFromJson(json);

  static const toJsonFactory = _$PeerResponseToJson;
  Map<String, dynamic> toJson() => _$PeerResponseToJson(this);

  @JsonKey(name: 'data')
  final Peer data;
  static const fromJsonFactory = _$PeerResponseFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PeerResponse &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(data) ^ runtimeType.hashCode;
}

extension $PeerResponseExtension on PeerResponse {
  PeerResponse copyWith({Peer? data}) {
    return PeerResponse(data: data ?? this.data);
  }

  PeerResponse copyWithWrapped({Wrapped<Peer>? data}) {
    return PeerResponse(data: (data != null ? data.value : this.data));
  }
}

@JsonSerializable(explicitToJson: true)
class AddPeerRequest {
  AddPeerRequest({
    required this.multiAddress,
    this.alias,
  });

  factory AddPeerRequest.fromJson(Map<String, dynamic> json) =>
      _$AddPeerRequestFromJson(json);

  static const toJsonFactory = _$AddPeerRequestToJson;
  Map<String, dynamic> toJson() => _$AddPeerRequestToJson(this);

  @JsonKey(name: 'multiAddress')
  final String multiAddress;
  @JsonKey(name: 'alias')
  final String? alias;
  static const fromJsonFactory = _$AddPeerRequestFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is AddPeerRequest &&
            (identical(other.multiAddress, multiAddress) ||
                const DeepCollectionEquality()
                    .equals(other.multiAddress, multiAddress)) &&
            (identical(other.alias, alias) ||
                const DeepCollectionEquality().equals(other.alias, alias)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(multiAddress) ^
      const DeepCollectionEquality().hash(alias) ^
      runtimeType.hashCode;
}

extension $AddPeerRequestExtension on AddPeerRequest {
  AddPeerRequest copyWith({String? multiAddress, String? alias}) {
    return AddPeerRequest(
        multiAddress: multiAddress ?? this.multiAddress,
        alias: alias ?? this.alias);
  }

  AddPeerRequest copyWithWrapped(
      {Wrapped<String>? multiAddress, Wrapped<String?>? alias}) {
    return AddPeerRequest(
        multiAddress:
            (multiAddress != null ? multiAddress.value : this.multiAddress),
        alias: (alias != null ? alias.value : this.alias));
  }
}

@JsonSerializable(explicitToJson: true)
class AddPeerResponse {
  AddPeerResponse({
    required this.data,
  });

  factory AddPeerResponse.fromJson(Map<String, dynamic> json) =>
      _$AddPeerResponseFromJson(json);

  static const toJsonFactory = _$AddPeerResponseToJson;
  Map<String, dynamic> toJson() => _$AddPeerResponseToJson(this);

  @JsonKey(name: 'data')
  final Peer data;
  static const fromJsonFactory = _$AddPeerResponseFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is AddPeerResponse &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(data) ^ runtimeType.hashCode;
}

extension $AddPeerResponseExtension on AddPeerResponse {
  AddPeerResponse copyWith({Peer? data}) {
    return AddPeerResponse(data: data ?? this.data);
  }

  AddPeerResponse copyWithWrapped({Wrapped<Peer>? data}) {
    return AddPeerResponse(data: (data != null ? data.value : this.data));
  }
}

@JsonSerializable(explicitToJson: true)
class ErrorResponse$Error {
  ErrorResponse$Error({
    required this.code,
    required this.message,
  });

  factory ErrorResponse$Error.fromJson(Map<String, dynamic> json) =>
      _$ErrorResponse$ErrorFromJson(json);

  static const toJsonFactory = _$ErrorResponse$ErrorToJson;
  Map<String, dynamic> toJson() => _$ErrorResponse$ErrorToJson(this);

  @JsonKey(name: 'code')
  final String code;
  @JsonKey(name: 'message')
  final String message;
  static const fromJsonFactory = _$ErrorResponse$ErrorFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ErrorResponse$Error &&
            (identical(other.code, code) ||
                const DeepCollectionEquality().equals(other.code, code)) &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(code) ^
      const DeepCollectionEquality().hash(message) ^
      runtimeType.hashCode;
}

extension $ErrorResponse$ErrorExtension on ErrorResponse$Error {
  ErrorResponse$Error copyWith({String? code, String? message}) {
    return ErrorResponse$Error(
        code: code ?? this.code, message: message ?? this.message);
  }

  ErrorResponse$Error copyWithWrapped(
      {Wrapped<String>? code, Wrapped<String>? message}) {
    return ErrorResponse$Error(
        code: (code != null ? code.value : this.code),
        message: (message != null ? message.value : this.message));
  }
}

@JsonSerializable(explicitToJson: true)
class ForbiddenResponse$Error {
  ForbiddenResponse$Error({
    required this.code,
    required this.message,
  });

  factory ForbiddenResponse$Error.fromJson(Map<String, dynamic> json) =>
      _$ForbiddenResponse$ErrorFromJson(json);

  static const toJsonFactory = _$ForbiddenResponse$ErrorToJson;
  Map<String, dynamic> toJson() => _$ForbiddenResponse$ErrorToJson(this);

  @JsonKey(name: 'code')
  final String code;
  @JsonKey(name: 'message')
  final String message;
  static const fromJsonFactory = _$ForbiddenResponse$ErrorFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ForbiddenResponse$Error &&
            (identical(other.code, code) ||
                const DeepCollectionEquality().equals(other.code, code)) &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(code) ^
      const DeepCollectionEquality().hash(message) ^
      runtimeType.hashCode;
}

extension $ForbiddenResponse$ErrorExtension on ForbiddenResponse$Error {
  ForbiddenResponse$Error copyWith({String? code, String? message}) {
    return ForbiddenResponse$Error(
        code: code ?? this.code, message: message ?? this.message);
  }

  ForbiddenResponse$Error copyWithWrapped(
      {Wrapped<String>? code, Wrapped<String>? message}) {
    return ForbiddenResponse$Error(
        code: (code != null ? code.value : this.code),
        message: (message != null ? message.value : this.message));
  }
}

@JsonSerializable(explicitToJson: true)
class ServiceUnavailableResponse$Error {
  ServiceUnavailableResponse$Error({
    required this.code,
    required this.message,
  });

  factory ServiceUnavailableResponse$Error.fromJson(
          Map<String, dynamic> json) =>
      _$ServiceUnavailableResponse$ErrorFromJson(json);

  static const toJsonFactory = _$ServiceUnavailableResponse$ErrorToJson;
  Map<String, dynamic> toJson() =>
      _$ServiceUnavailableResponse$ErrorToJson(this);

  @JsonKey(name: 'code')
  final String code;
  @JsonKey(name: 'message')
  final String message;
  static const fromJsonFactory = _$ServiceUnavailableResponse$ErrorFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ServiceUnavailableResponse$Error &&
            (identical(other.code, code) ||
                const DeepCollectionEquality().equals(other.code, code)) &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(code) ^
      const DeepCollectionEquality().hash(message) ^
      runtimeType.hashCode;
}

extension $ServiceUnavailableResponse$ErrorExtension
    on ServiceUnavailableResponse$Error {
  ServiceUnavailableResponse$Error copyWith({String? code, String? message}) {
    return ServiceUnavailableResponse$Error(
        code: code ?? this.code, message: message ?? this.message);
  }

  ServiceUnavailableResponse$Error copyWithWrapped(
      {Wrapped<String>? code, Wrapped<String>? message}) {
    return ServiceUnavailableResponse$Error(
        code: (code != null ? code.value : this.code),
        message: (message != null ? message.value : this.message));
  }
}

@JsonSerializable(explicitToJson: true)
class BadRequestResponse$Error {
  BadRequestResponse$Error({
    required this.code,
    required this.message,
  });

  factory BadRequestResponse$Error.fromJson(Map<String, dynamic> json) =>
      _$BadRequestResponse$ErrorFromJson(json);

  static const toJsonFactory = _$BadRequestResponse$ErrorToJson;
  Map<String, dynamic> toJson() => _$BadRequestResponse$ErrorToJson(this);

  @JsonKey(name: 'code')
  final String code;
  @JsonKey(name: 'message')
  final String message;
  static const fromJsonFactory = _$BadRequestResponse$ErrorFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is BadRequestResponse$Error &&
            (identical(other.code, code) ||
                const DeepCollectionEquality().equals(other.code, code)) &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(code) ^
      const DeepCollectionEquality().hash(message) ^
      runtimeType.hashCode;
}

extension $BadRequestResponse$ErrorExtension on BadRequestResponse$Error {
  BadRequestResponse$Error copyWith({String? code, String? message}) {
    return BadRequestResponse$Error(
        code: code ?? this.code, message: message ?? this.message);
  }

  BadRequestResponse$Error copyWithWrapped(
      {Wrapped<String>? code, Wrapped<String>? message}) {
    return BadRequestResponse$Error(
        code: (code != null ? code.value : this.code),
        message: (message != null ? message.value : this.message));
  }
}

@JsonSerializable(explicitToJson: true)
class NotFoundResponse$Error {
  NotFoundResponse$Error({
    required this.code,
    required this.message,
  });

  factory NotFoundResponse$Error.fromJson(Map<String, dynamic> json) =>
      _$NotFoundResponse$ErrorFromJson(json);

  static const toJsonFactory = _$NotFoundResponse$ErrorToJson;
  Map<String, dynamic> toJson() => _$NotFoundResponse$ErrorToJson(this);

  @JsonKey(name: 'code')
  final String code;
  @JsonKey(name: 'message')
  final String message;
  static const fromJsonFactory = _$NotFoundResponse$ErrorFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is NotFoundResponse$Error &&
            (identical(other.code, code) ||
                const DeepCollectionEquality().equals(other.code, code)) &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(code) ^
      const DeepCollectionEquality().hash(message) ^
      runtimeType.hashCode;
}

extension $NotFoundResponse$ErrorExtension on NotFoundResponse$Error {
  NotFoundResponse$Error copyWith({String? code, String? message}) {
    return NotFoundResponse$Error(
        code: code ?? this.code, message: message ?? this.message);
  }

  NotFoundResponse$Error copyWithWrapped(
      {Wrapped<String>? code, Wrapped<String>? message}) {
    return NotFoundResponse$Error(
        code: (code != null ? code.value : this.code),
        message: (message != null ? message.value : this.message));
  }
}

@JsonSerializable(explicitToJson: true)
class InternalErrorResponse$Error {
  InternalErrorResponse$Error({
    required this.code,
    required this.message,
  });

  factory InternalErrorResponse$Error.fromJson(Map<String, dynamic> json) =>
      _$InternalErrorResponse$ErrorFromJson(json);

  static const toJsonFactory = _$InternalErrorResponse$ErrorToJson;
  Map<String, dynamic> toJson() => _$InternalErrorResponse$ErrorToJson(this);

  @JsonKey(name: 'code')
  final String code;
  @JsonKey(name: 'message')
  final String message;
  static const fromJsonFactory = _$InternalErrorResponse$ErrorFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is InternalErrorResponse$Error &&
            (identical(other.code, code) ||
                const DeepCollectionEquality().equals(other.code, code)) &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(code) ^
      const DeepCollectionEquality().hash(message) ^
      runtimeType.hashCode;
}

extension $InternalErrorResponse$ErrorExtension on InternalErrorResponse$Error {
  InternalErrorResponse$Error copyWith({String? code, String? message}) {
    return InternalErrorResponse$Error(
        code: code ?? this.code, message: message ?? this.message);
  }

  InternalErrorResponse$Error copyWithWrapped(
      {Wrapped<String>? code, Wrapped<String>? message}) {
    return InternalErrorResponse$Error(
        code: (code != null ? code.value : this.code),
        message: (message != null ? message.value : this.message));
  }
}

@JsonSerializable(explicitToJson: true)
class InfoResponse$Data {
  InfoResponse$Data({
    required this.name,
    required this.version,
    required this.isHealthy,
    required this.networkId,
    required this.bech32HRP,
    required this.minPoWScore,
    required this.messagesPerSecond,
    required this.referencedMessagesPerSecond,
    required this.referencedRate,
    required this.latestMilestoneTimestamp,
    required this.latestMilestoneIndex,
    required this.confirmedMilestoneIndex,
    required this.pruningIndex,
    required this.features,
  });

  factory InfoResponse$Data.fromJson(Map<String, dynamic> json) =>
      _$InfoResponse$DataFromJson(json);

  static const toJsonFactory = _$InfoResponse$DataToJson;
  Map<String, dynamic> toJson() => _$InfoResponse$DataToJson(this);

  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'version')
  final String version;
  @JsonKey(name: 'isHealthy')
  final bool isHealthy;
  @JsonKey(name: 'networkId')
  final String networkId;
  @JsonKey(name: 'bech32HRP')
  final String bech32HRP;
  @JsonKey(name: 'minPoWScore')
  final double minPoWScore;
  @JsonKey(name: 'messagesPerSecond')
  final double messagesPerSecond;
  @JsonKey(name: 'referencedMessagesPerSecond')
  final double referencedMessagesPerSecond;
  @JsonKey(name: 'referencedRate')
  final double referencedRate;
  @JsonKey(name: 'latestMilestoneTimestamp')
  final int latestMilestoneTimestamp;
  @JsonKey(name: 'latestMilestoneIndex')
  final int latestMilestoneIndex;
  @JsonKey(name: 'confirmedMilestoneIndex')
  final int confirmedMilestoneIndex;
  @JsonKey(name: 'pruningIndex')
  final int pruningIndex;
  @JsonKey(name: 'features', defaultValue: <String>[])
  final List<String> features;
  static const fromJsonFactory = _$InfoResponse$DataFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is InfoResponse$Data &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.version, version) ||
                const DeepCollectionEquality()
                    .equals(other.version, version)) &&
            (identical(other.isHealthy, isHealthy) ||
                const DeepCollectionEquality()
                    .equals(other.isHealthy, isHealthy)) &&
            (identical(other.networkId, networkId) ||
                const DeepCollectionEquality()
                    .equals(other.networkId, networkId)) &&
            (identical(other.bech32HRP, bech32HRP) ||
                const DeepCollectionEquality()
                    .equals(other.bech32HRP, bech32HRP)) &&
            (identical(other.minPoWScore, minPoWScore) ||
                const DeepCollectionEquality()
                    .equals(other.minPoWScore, minPoWScore)) &&
            (identical(other.messagesPerSecond, messagesPerSecond) ||
                const DeepCollectionEquality()
                    .equals(other.messagesPerSecond, messagesPerSecond)) &&
            (identical(other.referencedMessagesPerSecond,
                    referencedMessagesPerSecond) ||
                const DeepCollectionEquality().equals(
                    other.referencedMessagesPerSecond,
                    referencedMessagesPerSecond)) &&
            (identical(other.referencedRate, referencedRate) ||
                const DeepCollectionEquality()
                    .equals(other.referencedRate, referencedRate)) &&
            (identical(
                    other.latestMilestoneTimestamp, latestMilestoneTimestamp) ||
                const DeepCollectionEquality().equals(
                    other.latestMilestoneTimestamp,
                    latestMilestoneTimestamp)) &&
            (identical(other.latestMilestoneIndex, latestMilestoneIndex) ||
                const DeepCollectionEquality().equals(
                    other.latestMilestoneIndex, latestMilestoneIndex)) &&
            (identical(other.confirmedMilestoneIndex, confirmedMilestoneIndex) ||
                const DeepCollectionEquality().equals(
                    other.confirmedMilestoneIndex, confirmedMilestoneIndex)) &&
            (identical(other.pruningIndex, pruningIndex) ||
                const DeepCollectionEquality()
                    .equals(other.pruningIndex, pruningIndex)) &&
            (identical(other.features, features) ||
                const DeepCollectionEquality()
                    .equals(other.features, features)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(version) ^
      const DeepCollectionEquality().hash(isHealthy) ^
      const DeepCollectionEquality().hash(networkId) ^
      const DeepCollectionEquality().hash(bech32HRP) ^
      const DeepCollectionEquality().hash(minPoWScore) ^
      const DeepCollectionEquality().hash(messagesPerSecond) ^
      const DeepCollectionEquality().hash(referencedMessagesPerSecond) ^
      const DeepCollectionEquality().hash(referencedRate) ^
      const DeepCollectionEquality().hash(latestMilestoneTimestamp) ^
      const DeepCollectionEquality().hash(latestMilestoneIndex) ^
      const DeepCollectionEquality().hash(confirmedMilestoneIndex) ^
      const DeepCollectionEquality().hash(pruningIndex) ^
      const DeepCollectionEquality().hash(features) ^
      runtimeType.hashCode;
}

extension $InfoResponse$DataExtension on InfoResponse$Data {
  InfoResponse$Data copyWith(
      {String? name,
      String? version,
      bool? isHealthy,
      String? networkId,
      String? bech32HRP,
      double? minPoWScore,
      double? messagesPerSecond,
      double? referencedMessagesPerSecond,
      double? referencedRate,
      int? latestMilestoneTimestamp,
      int? latestMilestoneIndex,
      int? confirmedMilestoneIndex,
      int? pruningIndex,
      List<String>? features}) {
    return InfoResponse$Data(
        name: name ?? this.name,
        version: version ?? this.version,
        isHealthy: isHealthy ?? this.isHealthy,
        networkId: networkId ?? this.networkId,
        bech32HRP: bech32HRP ?? this.bech32HRP,
        minPoWScore: minPoWScore ?? this.minPoWScore,
        messagesPerSecond: messagesPerSecond ?? this.messagesPerSecond,
        referencedMessagesPerSecond:
            referencedMessagesPerSecond ?? this.referencedMessagesPerSecond,
        referencedRate: referencedRate ?? this.referencedRate,
        latestMilestoneTimestamp:
            latestMilestoneTimestamp ?? this.latestMilestoneTimestamp,
        latestMilestoneIndex: latestMilestoneIndex ?? this.latestMilestoneIndex,
        confirmedMilestoneIndex:
            confirmedMilestoneIndex ?? this.confirmedMilestoneIndex,
        pruningIndex: pruningIndex ?? this.pruningIndex,
        features: features ?? this.features);
  }

  InfoResponse$Data copyWithWrapped(
      {Wrapped<String>? name,
      Wrapped<String>? version,
      Wrapped<bool>? isHealthy,
      Wrapped<String>? networkId,
      Wrapped<String>? bech32HRP,
      Wrapped<double>? minPoWScore,
      Wrapped<double>? messagesPerSecond,
      Wrapped<double>? referencedMessagesPerSecond,
      Wrapped<double>? referencedRate,
      Wrapped<int>? latestMilestoneTimestamp,
      Wrapped<int>? latestMilestoneIndex,
      Wrapped<int>? confirmedMilestoneIndex,
      Wrapped<int>? pruningIndex,
      Wrapped<List<String>>? features}) {
    return InfoResponse$Data(
        name: (name != null ? name.value : this.name),
        version: (version != null ? version.value : this.version),
        isHealthy: (isHealthy != null ? isHealthy.value : this.isHealthy),
        networkId: (networkId != null ? networkId.value : this.networkId),
        bech32HRP: (bech32HRP != null ? bech32HRP.value : this.bech32HRP),
        minPoWScore:
            (minPoWScore != null ? minPoWScore.value : this.minPoWScore),
        messagesPerSecond: (messagesPerSecond != null
            ? messagesPerSecond.value
            : this.messagesPerSecond),
        referencedMessagesPerSecond: (referencedMessagesPerSecond != null
            ? referencedMessagesPerSecond.value
            : this.referencedMessagesPerSecond),
        referencedRate: (referencedRate != null
            ? referencedRate.value
            : this.referencedRate),
        latestMilestoneTimestamp: (latestMilestoneTimestamp != null
            ? latestMilestoneTimestamp.value
            : this.latestMilestoneTimestamp),
        latestMilestoneIndex: (latestMilestoneIndex != null
            ? latestMilestoneIndex.value
            : this.latestMilestoneIndex),
        confirmedMilestoneIndex: (confirmedMilestoneIndex != null
            ? confirmedMilestoneIndex.value
            : this.confirmedMilestoneIndex),
        pruningIndex:
            (pruningIndex != null ? pruningIndex.value : this.pruningIndex),
        features: (features != null ? features.value : this.features));
  }
}

@JsonSerializable(explicitToJson: true)
class TipsResponse$Data {
  TipsResponse$Data({
    required this.tipMessageIds,
  });

  factory TipsResponse$Data.fromJson(Map<String, dynamic> json) =>
      _$TipsResponse$DataFromJson(json);

  static const toJsonFactory = _$TipsResponse$DataToJson;
  Map<String, dynamic> toJson() => _$TipsResponse$DataToJson(this);

  @JsonKey(name: 'tipMessageIds', defaultValue: <String>[])
  final List<String> tipMessageIds;
  static const fromJsonFactory = _$TipsResponse$DataFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is TipsResponse$Data &&
            (identical(other.tipMessageIds, tipMessageIds) ||
                const DeepCollectionEquality()
                    .equals(other.tipMessageIds, tipMessageIds)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(tipMessageIds) ^ runtimeType.hashCode;
}

extension $TipsResponse$DataExtension on TipsResponse$Data {
  TipsResponse$Data copyWith({List<String>? tipMessageIds}) {
    return TipsResponse$Data(
        tipMessageIds: tipMessageIds ?? this.tipMessageIds);
  }

  TipsResponse$Data copyWithWrapped({Wrapped<List<String>>? tipMessageIds}) {
    return TipsResponse$Data(
        tipMessageIds:
            (tipMessageIds != null ? tipMessageIds.value : this.tipMessageIds));
  }
}

@JsonSerializable(explicitToJson: true)
class SubmitMessageResponse$Data {
  SubmitMessageResponse$Data({
    required this.messageId,
  });

  factory SubmitMessageResponse$Data.fromJson(Map<String, dynamic> json) =>
      _$SubmitMessageResponse$DataFromJson(json);

  static const toJsonFactory = _$SubmitMessageResponse$DataToJson;
  Map<String, dynamic> toJson() => _$SubmitMessageResponse$DataToJson(this);

  @JsonKey(name: 'messageId')
  final String messageId;
  static const fromJsonFactory = _$SubmitMessageResponse$DataFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SubmitMessageResponse$Data &&
            (identical(other.messageId, messageId) ||
                const DeepCollectionEquality()
                    .equals(other.messageId, messageId)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(messageId) ^ runtimeType.hashCode;
}

extension $SubmitMessageResponse$DataExtension on SubmitMessageResponse$Data {
  SubmitMessageResponse$Data copyWith({String? messageId}) {
    return SubmitMessageResponse$Data(messageId: messageId ?? this.messageId);
  }

  SubmitMessageResponse$Data copyWithWrapped({Wrapped<String>? messageId}) {
    return SubmitMessageResponse$Data(
        messageId: (messageId != null ? messageId.value : this.messageId));
  }
}

@JsonSerializable(explicitToJson: true)
class MessagesFindResponse$Data {
  MessagesFindResponse$Data({
    required this.index,
    required this.maxResults,
    required this.count,
    required this.messageIds,
  });

  factory MessagesFindResponse$Data.fromJson(Map<String, dynamic> json) =>
      _$MessagesFindResponse$DataFromJson(json);

  static const toJsonFactory = _$MessagesFindResponse$DataToJson;
  Map<String, dynamic> toJson() => _$MessagesFindResponse$DataToJson(this);

  @JsonKey(name: 'index')
  final String index;
  @JsonKey(name: 'maxResults')
  final int maxResults;
  @JsonKey(name: 'count')
  final int count;
  @JsonKey(name: 'messageIds', defaultValue: <String>[])
  final List<String> messageIds;
  static const fromJsonFactory = _$MessagesFindResponse$DataFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is MessagesFindResponse$Data &&
            (identical(other.index, index) ||
                const DeepCollectionEquality().equals(other.index, index)) &&
            (identical(other.maxResults, maxResults) ||
                const DeepCollectionEquality()
                    .equals(other.maxResults, maxResults)) &&
            (identical(other.count, count) ||
                const DeepCollectionEquality().equals(other.count, count)) &&
            (identical(other.messageIds, messageIds) ||
                const DeepCollectionEquality()
                    .equals(other.messageIds, messageIds)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(index) ^
      const DeepCollectionEquality().hash(maxResults) ^
      const DeepCollectionEquality().hash(count) ^
      const DeepCollectionEquality().hash(messageIds) ^
      runtimeType.hashCode;
}

extension $MessagesFindResponse$DataExtension on MessagesFindResponse$Data {
  MessagesFindResponse$Data copyWith(
      {String? index, int? maxResults, int? count, List<String>? messageIds}) {
    return MessagesFindResponse$Data(
        index: index ?? this.index,
        maxResults: maxResults ?? this.maxResults,
        count: count ?? this.count,
        messageIds: messageIds ?? this.messageIds);
  }

  MessagesFindResponse$Data copyWithWrapped(
      {Wrapped<String>? index,
      Wrapped<int>? maxResults,
      Wrapped<int>? count,
      Wrapped<List<String>>? messageIds}) {
    return MessagesFindResponse$Data(
        index: (index != null ? index.value : this.index),
        maxResults: (maxResults != null ? maxResults.value : this.maxResults),
        count: (count != null ? count.value : this.count),
        messageIds: (messageIds != null ? messageIds.value : this.messageIds));
  }
}

@JsonSerializable(explicitToJson: true)
class MessageMetadataResponse$Data {
  MessageMetadataResponse$Data({
    required this.messageId,
    required this.parentMessageIds,
    required this.isSolid,
    this.referencedByMilestoneIndex,
    this.milestoneIndex,
    this.ledgerInclusionState,
    this.conflictReason,
    this.shouldPromote,
    this.shouldReattach,
  });

  factory MessageMetadataResponse$Data.fromJson(Map<String, dynamic> json) =>
      _$MessageMetadataResponse$DataFromJson(json);

  static const toJsonFactory = _$MessageMetadataResponse$DataToJson;
  Map<String, dynamic> toJson() => _$MessageMetadataResponse$DataToJson(this);

  @JsonKey(name: 'messageId')
  final String messageId;
  @JsonKey(name: 'parentMessageIds', defaultValue: <String>[])
  final List<String> parentMessageIds;
  @JsonKey(name: 'isSolid')
  final bool isSolid;
  @JsonKey(name: 'referencedByMilestoneIndex')
  final int? referencedByMilestoneIndex;
  @JsonKey(name: 'milestoneIndex')
  final int? milestoneIndex;
  @JsonKey(
    name: 'ledgerInclusionState',
    toJson: messageMetadataResponse$DataLedgerInclusionStateToJson,
    fromJson: messageMetadataResponse$DataLedgerInclusionStateFromJson,
  )
  final enums.MessageMetadataResponse$DataLedgerInclusionState?
      ledgerInclusionState;
  @JsonKey(name: 'conflictReason')
  final int? conflictReason;
  @JsonKey(name: 'shouldPromote')
  final bool? shouldPromote;
  @JsonKey(name: 'shouldReattach')
  final bool? shouldReattach;
  static const fromJsonFactory = _$MessageMetadataResponse$DataFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is MessageMetadataResponse$Data &&
            (identical(other.messageId, messageId) ||
                const DeepCollectionEquality()
                    .equals(other.messageId, messageId)) &&
            (identical(other.parentMessageIds, parentMessageIds) ||
                const DeepCollectionEquality()
                    .equals(other.parentMessageIds, parentMessageIds)) &&
            (identical(other.isSolid, isSolid) ||
                const DeepCollectionEquality()
                    .equals(other.isSolid, isSolid)) &&
            (identical(other.referencedByMilestoneIndex,
                    referencedByMilestoneIndex) ||
                const DeepCollectionEquality().equals(
                    other.referencedByMilestoneIndex,
                    referencedByMilestoneIndex)) &&
            (identical(other.milestoneIndex, milestoneIndex) ||
                const DeepCollectionEquality()
                    .equals(other.milestoneIndex, milestoneIndex)) &&
            (identical(other.ledgerInclusionState, ledgerInclusionState) ||
                const DeepCollectionEquality().equals(
                    other.ledgerInclusionState, ledgerInclusionState)) &&
            (identical(other.conflictReason, conflictReason) ||
                const DeepCollectionEquality()
                    .equals(other.conflictReason, conflictReason)) &&
            (identical(other.shouldPromote, shouldPromote) ||
                const DeepCollectionEquality()
                    .equals(other.shouldPromote, shouldPromote)) &&
            (identical(other.shouldReattach, shouldReattach) ||
                const DeepCollectionEquality()
                    .equals(other.shouldReattach, shouldReattach)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(messageId) ^
      const DeepCollectionEquality().hash(parentMessageIds) ^
      const DeepCollectionEquality().hash(isSolid) ^
      const DeepCollectionEquality().hash(referencedByMilestoneIndex) ^
      const DeepCollectionEquality().hash(milestoneIndex) ^
      const DeepCollectionEquality().hash(ledgerInclusionState) ^
      const DeepCollectionEquality().hash(conflictReason) ^
      const DeepCollectionEquality().hash(shouldPromote) ^
      const DeepCollectionEquality().hash(shouldReattach) ^
      runtimeType.hashCode;
}

extension $MessageMetadataResponse$DataExtension
    on MessageMetadataResponse$Data {
  MessageMetadataResponse$Data copyWith(
      {String? messageId,
      List<String>? parentMessageIds,
      bool? isSolid,
      int? referencedByMilestoneIndex,
      int? milestoneIndex,
      enums.MessageMetadataResponse$DataLedgerInclusionState?
          ledgerInclusionState,
      int? conflictReason,
      bool? shouldPromote,
      bool? shouldReattach}) {
    return MessageMetadataResponse$Data(
        messageId: messageId ?? this.messageId,
        parentMessageIds: parentMessageIds ?? this.parentMessageIds,
        isSolid: isSolid ?? this.isSolid,
        referencedByMilestoneIndex:
            referencedByMilestoneIndex ?? this.referencedByMilestoneIndex,
        milestoneIndex: milestoneIndex ?? this.milestoneIndex,
        ledgerInclusionState: ledgerInclusionState ?? this.ledgerInclusionState,
        conflictReason: conflictReason ?? this.conflictReason,
        shouldPromote: shouldPromote ?? this.shouldPromote,
        shouldReattach: shouldReattach ?? this.shouldReattach);
  }

  MessageMetadataResponse$Data copyWithWrapped(
      {Wrapped<String>? messageId,
      Wrapped<List<String>>? parentMessageIds,
      Wrapped<bool>? isSolid,
      Wrapped<int?>? referencedByMilestoneIndex,
      Wrapped<int?>? milestoneIndex,
      Wrapped<enums.MessageMetadataResponse$DataLedgerInclusionState?>?
          ledgerInclusionState,
      Wrapped<int?>? conflictReason,
      Wrapped<bool?>? shouldPromote,
      Wrapped<bool?>? shouldReattach}) {
    return MessageMetadataResponse$Data(
        messageId: (messageId != null ? messageId.value : this.messageId),
        parentMessageIds: (parentMessageIds != null
            ? parentMessageIds.value
            : this.parentMessageIds),
        isSolid: (isSolid != null ? isSolid.value : this.isSolid),
        referencedByMilestoneIndex: (referencedByMilestoneIndex != null
            ? referencedByMilestoneIndex.value
            : this.referencedByMilestoneIndex),
        milestoneIndex: (milestoneIndex != null
            ? milestoneIndex.value
            : this.milestoneIndex),
        ledgerInclusionState: (ledgerInclusionState != null
            ? ledgerInclusionState.value
            : this.ledgerInclusionState),
        conflictReason: (conflictReason != null
            ? conflictReason.value
            : this.conflictReason),
        shouldPromote:
            (shouldPromote != null ? shouldPromote.value : this.shouldPromote),
        shouldReattach: (shouldReattach != null
            ? shouldReattach.value
            : this.shouldReattach));
  }
}

@JsonSerializable(explicitToJson: true)
class MessageResponse$Data {
  MessageResponse$Data({
    this.allOf,
  });

  factory MessageResponse$Data.fromJson(Map<String, dynamic> json) =>
      _$MessageResponse$DataFromJson(json);

  static const toJsonFactory = _$MessageResponse$DataToJson;
  Map<String, dynamic> toJson() => _$MessageResponse$DataToJson(this);

  @JsonKey(name: 'allOf')
  final Message? allOf;
  static const fromJsonFactory = _$MessageResponse$DataFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is MessageResponse$Data &&
            (identical(other.allOf, allOf) ||
                const DeepCollectionEquality().equals(other.allOf, allOf)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(allOf) ^ runtimeType.hashCode;
}

extension $MessageResponse$DataExtension on MessageResponse$Data {
  MessageResponse$Data copyWith({Message? allOf}) {
    return MessageResponse$Data(allOf: allOf ?? this.allOf);
  }

  MessageResponse$Data copyWithWrapped({Wrapped<Message?>? allOf}) {
    return MessageResponse$Data(
        allOf: (allOf != null ? allOf.value : this.allOf));
  }
}

@JsonSerializable(explicitToJson: true)
class MessageChildrenResponse$Data {
  MessageChildrenResponse$Data({
    required this.messageId,
    required this.maxResults,
    required this.count,
    required this.childrenMessageIds,
  });

  factory MessageChildrenResponse$Data.fromJson(Map<String, dynamic> json) =>
      _$MessageChildrenResponse$DataFromJson(json);

  static const toJsonFactory = _$MessageChildrenResponse$DataToJson;
  Map<String, dynamic> toJson() => _$MessageChildrenResponse$DataToJson(this);

  @JsonKey(name: 'messageId')
  final String messageId;
  @JsonKey(name: 'maxResults')
  final int maxResults;
  @JsonKey(name: 'count')
  final int count;
  @JsonKey(name: 'childrenMessageIds', defaultValue: <String>[])
  final List<String> childrenMessageIds;
  static const fromJsonFactory = _$MessageChildrenResponse$DataFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is MessageChildrenResponse$Data &&
            (identical(other.messageId, messageId) ||
                const DeepCollectionEquality()
                    .equals(other.messageId, messageId)) &&
            (identical(other.maxResults, maxResults) ||
                const DeepCollectionEquality()
                    .equals(other.maxResults, maxResults)) &&
            (identical(other.count, count) ||
                const DeepCollectionEquality().equals(other.count, count)) &&
            (identical(other.childrenMessageIds, childrenMessageIds) ||
                const DeepCollectionEquality()
                    .equals(other.childrenMessageIds, childrenMessageIds)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(messageId) ^
      const DeepCollectionEquality().hash(maxResults) ^
      const DeepCollectionEquality().hash(count) ^
      const DeepCollectionEquality().hash(childrenMessageIds) ^
      runtimeType.hashCode;
}

extension $MessageChildrenResponse$DataExtension
    on MessageChildrenResponse$Data {
  MessageChildrenResponse$Data copyWith(
      {String? messageId,
      int? maxResults,
      int? count,
      List<String>? childrenMessageIds}) {
    return MessageChildrenResponse$Data(
        messageId: messageId ?? this.messageId,
        maxResults: maxResults ?? this.maxResults,
        count: count ?? this.count,
        childrenMessageIds: childrenMessageIds ?? this.childrenMessageIds);
  }

  MessageChildrenResponse$Data copyWithWrapped(
      {Wrapped<String>? messageId,
      Wrapped<int>? maxResults,
      Wrapped<int>? count,
      Wrapped<List<String>>? childrenMessageIds}) {
    return MessageChildrenResponse$Data(
        messageId: (messageId != null ? messageId.value : this.messageId),
        maxResults: (maxResults != null ? maxResults.value : this.maxResults),
        count: (count != null ? count.value : this.count),
        childrenMessageIds: (childrenMessageIds != null
            ? childrenMessageIds.value
            : this.childrenMessageIds));
  }
}

@JsonSerializable(explicitToJson: true)
class OutputResponse$Data {
  OutputResponse$Data({
    required this.messageId,
    required this.transactionId,
    required this.outputIndex,
    required this.isSpent,
    required this.output,
    required this.ledgerIndex,
  });

  factory OutputResponse$Data.fromJson(Map<String, dynamic> json) =>
      _$OutputResponse$DataFromJson(json);

  static const toJsonFactory = _$OutputResponse$DataToJson;
  Map<String, dynamic> toJson() => _$OutputResponse$DataToJson(this);

  @JsonKey(name: 'messageId')
  final String messageId;
  @JsonKey(name: 'transactionId')
  final String transactionId;
  @JsonKey(name: 'outputIndex')
  final int outputIndex;
  @JsonKey(name: 'isSpent')
  final bool isSpent;
  @JsonKey(name: 'output')
  final dynamic output;
  @JsonKey(name: 'ledgerIndex')
  final int ledgerIndex;
  static const fromJsonFactory = _$OutputResponse$DataFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is OutputResponse$Data &&
            (identical(other.messageId, messageId) ||
                const DeepCollectionEquality()
                    .equals(other.messageId, messageId)) &&
            (identical(other.transactionId, transactionId) ||
                const DeepCollectionEquality()
                    .equals(other.transactionId, transactionId)) &&
            (identical(other.outputIndex, outputIndex) ||
                const DeepCollectionEquality()
                    .equals(other.outputIndex, outputIndex)) &&
            (identical(other.isSpent, isSpent) ||
                const DeepCollectionEquality()
                    .equals(other.isSpent, isSpent)) &&
            (identical(other.output, output) ||
                const DeepCollectionEquality().equals(other.output, output)) &&
            (identical(other.ledgerIndex, ledgerIndex) ||
                const DeepCollectionEquality()
                    .equals(other.ledgerIndex, ledgerIndex)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(messageId) ^
      const DeepCollectionEquality().hash(transactionId) ^
      const DeepCollectionEquality().hash(outputIndex) ^
      const DeepCollectionEquality().hash(isSpent) ^
      const DeepCollectionEquality().hash(output) ^
      const DeepCollectionEquality().hash(ledgerIndex) ^
      runtimeType.hashCode;
}

extension $OutputResponse$DataExtension on OutputResponse$Data {
  OutputResponse$Data copyWith(
      {String? messageId,
      String? transactionId,
      int? outputIndex,
      bool? isSpent,
      dynamic output,
      int? ledgerIndex}) {
    return OutputResponse$Data(
        messageId: messageId ?? this.messageId,
        transactionId: transactionId ?? this.transactionId,
        outputIndex: outputIndex ?? this.outputIndex,
        isSpent: isSpent ?? this.isSpent,
        output: output ?? this.output,
        ledgerIndex: ledgerIndex ?? this.ledgerIndex);
  }

  OutputResponse$Data copyWithWrapped(
      {Wrapped<String>? messageId,
      Wrapped<String>? transactionId,
      Wrapped<int>? outputIndex,
      Wrapped<bool>? isSpent,
      Wrapped<dynamic>? output,
      Wrapped<int>? ledgerIndex}) {
    return OutputResponse$Data(
        messageId: (messageId != null ? messageId.value : this.messageId),
        transactionId:
            (transactionId != null ? transactionId.value : this.transactionId),
        outputIndex:
            (outputIndex != null ? outputIndex.value : this.outputIndex),
        isSpent: (isSpent != null ? isSpent.value : this.isSpent),
        output: (output != null ? output.value : this.output),
        ledgerIndex:
            (ledgerIndex != null ? ledgerIndex.value : this.ledgerIndex));
  }
}

@JsonSerializable(explicitToJson: true)
class BalanceAddressResponse$Data {
  BalanceAddressResponse$Data({
    required this.addressType,
    required this.address,
    required this.balance,
    required this.dustAllowed,
    required this.ledgerIndex,
  });

  factory BalanceAddressResponse$Data.fromJson(Map<String, dynamic> json) =>
      _$BalanceAddressResponse$DataFromJson(json);

  static const toJsonFactory = _$BalanceAddressResponse$DataToJson;
  Map<String, dynamic> toJson() => _$BalanceAddressResponse$DataToJson(this);

  @JsonKey(name: 'addressType')
  final int addressType;
  @JsonKey(name: 'address')
  final String address;
  @JsonKey(name: 'balance')
  final int balance;
  @JsonKey(name: 'dustAllowed')
  final bool dustAllowed;
  @JsonKey(name: 'ledgerIndex')
  final int ledgerIndex;
  static const fromJsonFactory = _$BalanceAddressResponse$DataFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is BalanceAddressResponse$Data &&
            (identical(other.addressType, addressType) ||
                const DeepCollectionEquality()
                    .equals(other.addressType, addressType)) &&
            (identical(other.address, address) ||
                const DeepCollectionEquality()
                    .equals(other.address, address)) &&
            (identical(other.balance, balance) ||
                const DeepCollectionEquality()
                    .equals(other.balance, balance)) &&
            (identical(other.dustAllowed, dustAllowed) ||
                const DeepCollectionEquality()
                    .equals(other.dustAllowed, dustAllowed)) &&
            (identical(other.ledgerIndex, ledgerIndex) ||
                const DeepCollectionEquality()
                    .equals(other.ledgerIndex, ledgerIndex)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(addressType) ^
      const DeepCollectionEquality().hash(address) ^
      const DeepCollectionEquality().hash(balance) ^
      const DeepCollectionEquality().hash(dustAllowed) ^
      const DeepCollectionEquality().hash(ledgerIndex) ^
      runtimeType.hashCode;
}

extension $BalanceAddressResponse$DataExtension on BalanceAddressResponse$Data {
  BalanceAddressResponse$Data copyWith(
      {int? addressType,
      String? address,
      int? balance,
      bool? dustAllowed,
      int? ledgerIndex}) {
    return BalanceAddressResponse$Data(
        addressType: addressType ?? this.addressType,
        address: address ?? this.address,
        balance: balance ?? this.balance,
        dustAllowed: dustAllowed ?? this.dustAllowed,
        ledgerIndex: ledgerIndex ?? this.ledgerIndex);
  }

  BalanceAddressResponse$Data copyWithWrapped(
      {Wrapped<int>? addressType,
      Wrapped<String>? address,
      Wrapped<int>? balance,
      Wrapped<bool>? dustAllowed,
      Wrapped<int>? ledgerIndex}) {
    return BalanceAddressResponse$Data(
        addressType:
            (addressType != null ? addressType.value : this.addressType),
        address: (address != null ? address.value : this.address),
        balance: (balance != null ? balance.value : this.balance),
        dustAllowed:
            (dustAllowed != null ? dustAllowed.value : this.dustAllowed),
        ledgerIndex:
            (ledgerIndex != null ? ledgerIndex.value : this.ledgerIndex));
  }
}

@JsonSerializable(explicitToJson: true)
class OutputsAddressResponse$Data {
  OutputsAddressResponse$Data({
    required this.addressType,
    required this.address,
    required this.maxResults,
    required this.count,
    required this.outputIds,
    required this.ledgerIndex,
  });

  factory OutputsAddressResponse$Data.fromJson(Map<String, dynamic> json) =>
      _$OutputsAddressResponse$DataFromJson(json);

  static const toJsonFactory = _$OutputsAddressResponse$DataToJson;
  Map<String, dynamic> toJson() => _$OutputsAddressResponse$DataToJson(this);

  @JsonKey(name: 'addressType')
  final int addressType;
  @JsonKey(name: 'address')
  final String address;
  @JsonKey(name: 'maxResults')
  final int maxResults;
  @JsonKey(name: 'count')
  final int count;
  @JsonKey(name: 'outputIds', defaultValue: <String>[])
  final List<String> outputIds;
  @JsonKey(name: 'ledgerIndex')
  final int ledgerIndex;
  static const fromJsonFactory = _$OutputsAddressResponse$DataFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is OutputsAddressResponse$Data &&
            (identical(other.addressType, addressType) ||
                const DeepCollectionEquality()
                    .equals(other.addressType, addressType)) &&
            (identical(other.address, address) ||
                const DeepCollectionEquality()
                    .equals(other.address, address)) &&
            (identical(other.maxResults, maxResults) ||
                const DeepCollectionEquality()
                    .equals(other.maxResults, maxResults)) &&
            (identical(other.count, count) ||
                const DeepCollectionEquality().equals(other.count, count)) &&
            (identical(other.outputIds, outputIds) ||
                const DeepCollectionEquality()
                    .equals(other.outputIds, outputIds)) &&
            (identical(other.ledgerIndex, ledgerIndex) ||
                const DeepCollectionEquality()
                    .equals(other.ledgerIndex, ledgerIndex)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(addressType) ^
      const DeepCollectionEquality().hash(address) ^
      const DeepCollectionEquality().hash(maxResults) ^
      const DeepCollectionEquality().hash(count) ^
      const DeepCollectionEquality().hash(outputIds) ^
      const DeepCollectionEquality().hash(ledgerIndex) ^
      runtimeType.hashCode;
}

extension $OutputsAddressResponse$DataExtension on OutputsAddressResponse$Data {
  OutputsAddressResponse$Data copyWith(
      {int? addressType,
      String? address,
      int? maxResults,
      int? count,
      List<String>? outputIds,
      int? ledgerIndex}) {
    return OutputsAddressResponse$Data(
        addressType: addressType ?? this.addressType,
        address: address ?? this.address,
        maxResults: maxResults ?? this.maxResults,
        count: count ?? this.count,
        outputIds: outputIds ?? this.outputIds,
        ledgerIndex: ledgerIndex ?? this.ledgerIndex);
  }

  OutputsAddressResponse$Data copyWithWrapped(
      {Wrapped<int>? addressType,
      Wrapped<String>? address,
      Wrapped<int>? maxResults,
      Wrapped<int>? count,
      Wrapped<List<String>>? outputIds,
      Wrapped<int>? ledgerIndex}) {
    return OutputsAddressResponse$Data(
        addressType:
            (addressType != null ? addressType.value : this.addressType),
        address: (address != null ? address.value : this.address),
        maxResults: (maxResults != null ? maxResults.value : this.maxResults),
        count: (count != null ? count.value : this.count),
        outputIds: (outputIds != null ? outputIds.value : this.outputIds),
        ledgerIndex:
            (ledgerIndex != null ? ledgerIndex.value : this.ledgerIndex));
  }
}

@JsonSerializable(explicitToJson: true)
class ReceiptsResponse$Data {
  ReceiptsResponse$Data({
    required this.receipts,
  });

  factory ReceiptsResponse$Data.fromJson(Map<String, dynamic> json) =>
      _$ReceiptsResponse$DataFromJson(json);

  static const toJsonFactory = _$ReceiptsResponse$DataToJson;
  Map<String, dynamic> toJson() => _$ReceiptsResponse$DataToJson(this);

  @JsonKey(name: 'receipts', defaultValue: <ReceiptTuple>[])
  final List<ReceiptTuple> receipts;
  static const fromJsonFactory = _$ReceiptsResponse$DataFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ReceiptsResponse$Data &&
            (identical(other.receipts, receipts) ||
                const DeepCollectionEquality()
                    .equals(other.receipts, receipts)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(receipts) ^ runtimeType.hashCode;
}

extension $ReceiptsResponse$DataExtension on ReceiptsResponse$Data {
  ReceiptsResponse$Data copyWith({List<ReceiptTuple>? receipts}) {
    return ReceiptsResponse$Data(receipts: receipts ?? this.receipts);
  }

  ReceiptsResponse$Data copyWithWrapped(
      {Wrapped<List<ReceiptTuple>>? receipts}) {
    return ReceiptsResponse$Data(
        receipts: (receipts != null ? receipts.value : this.receipts));
  }
}

@JsonSerializable(explicitToJson: true)
class TreasuryResponse$Data {
  TreasuryResponse$Data({
    required this.milestoneId,
    required this.amount,
  });

  factory TreasuryResponse$Data.fromJson(Map<String, dynamic> json) =>
      _$TreasuryResponse$DataFromJson(json);

  static const toJsonFactory = _$TreasuryResponse$DataToJson;
  Map<String, dynamic> toJson() => _$TreasuryResponse$DataToJson(this);

  @JsonKey(name: 'milestoneId')
  final String milestoneId;
  @JsonKey(name: 'amount')
  final int amount;
  static const fromJsonFactory = _$TreasuryResponse$DataFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is TreasuryResponse$Data &&
            (identical(other.milestoneId, milestoneId) ||
                const DeepCollectionEquality()
                    .equals(other.milestoneId, milestoneId)) &&
            (identical(other.amount, amount) ||
                const DeepCollectionEquality().equals(other.amount, amount)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(milestoneId) ^
      const DeepCollectionEquality().hash(amount) ^
      runtimeType.hashCode;
}

extension $TreasuryResponse$DataExtension on TreasuryResponse$Data {
  TreasuryResponse$Data copyWith({String? milestoneId, int? amount}) {
    return TreasuryResponse$Data(
        milestoneId: milestoneId ?? this.milestoneId,
        amount: amount ?? this.amount);
  }

  TreasuryResponse$Data copyWithWrapped(
      {Wrapped<String>? milestoneId, Wrapped<int>? amount}) {
    return TreasuryResponse$Data(
        milestoneId:
            (milestoneId != null ? milestoneId.value : this.milestoneId),
        amount: (amount != null ? amount.value : this.amount));
  }
}

@JsonSerializable(explicitToJson: true)
class MilestoneResponse$Data {
  MilestoneResponse$Data({
    required this.index,
    required this.messageId,
    required this.timestamp,
  });

  factory MilestoneResponse$Data.fromJson(Map<String, dynamic> json) =>
      _$MilestoneResponse$DataFromJson(json);

  static const toJsonFactory = _$MilestoneResponse$DataToJson;
  Map<String, dynamic> toJson() => _$MilestoneResponse$DataToJson(this);

  @JsonKey(name: 'index')
  final int index;
  @JsonKey(name: 'messageId')
  final String messageId;
  @JsonKey(name: 'timestamp')
  final int timestamp;
  static const fromJsonFactory = _$MilestoneResponse$DataFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is MilestoneResponse$Data &&
            (identical(other.index, index) ||
                const DeepCollectionEquality().equals(other.index, index)) &&
            (identical(other.messageId, messageId) ||
                const DeepCollectionEquality()
                    .equals(other.messageId, messageId)) &&
            (identical(other.timestamp, timestamp) ||
                const DeepCollectionEquality()
                    .equals(other.timestamp, timestamp)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(index) ^
      const DeepCollectionEquality().hash(messageId) ^
      const DeepCollectionEquality().hash(timestamp) ^
      runtimeType.hashCode;
}

extension $MilestoneResponse$DataExtension on MilestoneResponse$Data {
  MilestoneResponse$Data copyWith(
      {int? index, String? messageId, int? timestamp}) {
    return MilestoneResponse$Data(
        index: index ?? this.index,
        messageId: messageId ?? this.messageId,
        timestamp: timestamp ?? this.timestamp);
  }

  MilestoneResponse$Data copyWithWrapped(
      {Wrapped<int>? index,
      Wrapped<String>? messageId,
      Wrapped<int>? timestamp}) {
    return MilestoneResponse$Data(
        index: (index != null ? index.value : this.index),
        messageId: (messageId != null ? messageId.value : this.messageId),
        timestamp: (timestamp != null ? timestamp.value : this.timestamp));
  }
}

@JsonSerializable(explicitToJson: true)
class UTXOChangesResponse$Data {
  UTXOChangesResponse$Data({
    required this.index,
    required this.createdOutputs,
    required this.consumedOutputs,
  });

  factory UTXOChangesResponse$Data.fromJson(Map<String, dynamic> json) =>
      _$UTXOChangesResponse$DataFromJson(json);

  static const toJsonFactory = _$UTXOChangesResponse$DataToJson;
  Map<String, dynamic> toJson() => _$UTXOChangesResponse$DataToJson(this);

  @JsonKey(name: 'index')
  final int index;
  @JsonKey(name: 'createdOutputs', defaultValue: <String>[])
  final List<String> createdOutputs;
  @JsonKey(name: 'consumedOutputs', defaultValue: <String>[])
  final List<String> consumedOutputs;
  static const fromJsonFactory = _$UTXOChangesResponse$DataFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UTXOChangesResponse$Data &&
            (identical(other.index, index) ||
                const DeepCollectionEquality().equals(other.index, index)) &&
            (identical(other.createdOutputs, createdOutputs) ||
                const DeepCollectionEquality()
                    .equals(other.createdOutputs, createdOutputs)) &&
            (identical(other.consumedOutputs, consumedOutputs) ||
                const DeepCollectionEquality()
                    .equals(other.consumedOutputs, consumedOutputs)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(index) ^
      const DeepCollectionEquality().hash(createdOutputs) ^
      const DeepCollectionEquality().hash(consumedOutputs) ^
      runtimeType.hashCode;
}

extension $UTXOChangesResponse$DataExtension on UTXOChangesResponse$Data {
  UTXOChangesResponse$Data copyWith(
      {int? index,
      List<String>? createdOutputs,
      List<String>? consumedOutputs}) {
    return UTXOChangesResponse$Data(
        index: index ?? this.index,
        createdOutputs: createdOutputs ?? this.createdOutputs,
        consumedOutputs: consumedOutputs ?? this.consumedOutputs);
  }

  UTXOChangesResponse$Data copyWithWrapped(
      {Wrapped<int>? index,
      Wrapped<List<String>>? createdOutputs,
      Wrapped<List<String>>? consumedOutputs}) {
    return UTXOChangesResponse$Data(
        index: (index != null ? index.value : this.index),
        createdOutputs: (createdOutputs != null
            ? createdOutputs.value
            : this.createdOutputs),
        consumedOutputs: (consumedOutputs != null
            ? consumedOutputs.value
            : this.consumedOutputs));
  }
}

String? peerRelationToJson(enums.PeerRelation? peerRelation) {
  return peerRelation?.value;
}

enums.PeerRelation peerRelationFromJson(
  Object? peerRelation, [
  enums.PeerRelation? defaultValue,
]) {
  return enums.PeerRelation.values
          .firstWhereOrNull((e) => e.value == peerRelation) ??
      defaultValue ??
      enums.PeerRelation.swaggerGeneratedUnknown;
}

List<String> peerRelationListToJson(List<enums.PeerRelation>? peerRelation) {
  if (peerRelation == null) {
    return [];
  }

  return peerRelation.map((e) => e.value!).toList();
}

List<enums.PeerRelation> peerRelationListFromJson(
  List? peerRelation, [
  List<enums.PeerRelation>? defaultValue,
]) {
  if (peerRelation == null) {
    return defaultValue ?? [];
  }

  return peerRelation.map((e) => peerRelationFromJson(e.toString())).toList();
}

List<enums.PeerRelation>? peerRelationNullableListFromJson(
  List? peerRelation, [
  List<enums.PeerRelation>? defaultValue,
]) {
  if (peerRelation == null) {
    return defaultValue;
  }

  return peerRelation.map((e) => peerRelationFromJson(e.toString())).toList();
}

String? messageMetadataResponse$DataLedgerInclusionStateToJson(
    enums.MessageMetadataResponse$DataLedgerInclusionState?
        messageMetadataResponse$DataLedgerInclusionState) {
  return messageMetadataResponse$DataLedgerInclusionState?.value;
}

enums.MessageMetadataResponse$DataLedgerInclusionState
    messageMetadataResponse$DataLedgerInclusionStateFromJson(
  Object? messageMetadataResponse$DataLedgerInclusionState, [
  enums.MessageMetadataResponse$DataLedgerInclusionState? defaultValue,
]) {
  return enums.MessageMetadataResponse$DataLedgerInclusionState.values
          .firstWhereOrNull((e) =>
              e.value == messageMetadataResponse$DataLedgerInclusionState) ??
      defaultValue ??
      enums.MessageMetadataResponse$DataLedgerInclusionState
          .swaggerGeneratedUnknown;
}

List<String> messageMetadataResponse$DataLedgerInclusionStateListToJson(
    List<enums.MessageMetadataResponse$DataLedgerInclusionState>?
        messageMetadataResponse$DataLedgerInclusionState) {
  if (messageMetadataResponse$DataLedgerInclusionState == null) {
    return [];
  }

  return messageMetadataResponse$DataLedgerInclusionState
      .map((e) => e.value!)
      .toList();
}

List<enums.MessageMetadataResponse$DataLedgerInclusionState>
    messageMetadataResponse$DataLedgerInclusionStateListFromJson(
  List? messageMetadataResponse$DataLedgerInclusionState, [
  List<enums.MessageMetadataResponse$DataLedgerInclusionState>? defaultValue,
]) {
  if (messageMetadataResponse$DataLedgerInclusionState == null) {
    return defaultValue ?? [];
  }

  return messageMetadataResponse$DataLedgerInclusionState
      .map((e) => messageMetadataResponse$DataLedgerInclusionStateFromJson(
          e.toString()))
      .toList();
}

List<enums.MessageMetadataResponse$DataLedgerInclusionState>?
    messageMetadataResponse$DataLedgerInclusionStateNullableListFromJson(
  List? messageMetadataResponse$DataLedgerInclusionState, [
  List<enums.MessageMetadataResponse$DataLedgerInclusionState>? defaultValue,
]) {
  if (messageMetadataResponse$DataLedgerInclusionState == null) {
    return defaultValue;
  }

  return messageMetadataResponse$DataLedgerInclusionState
      .map((e) => messageMetadataResponse$DataLedgerInclusionStateFromJson(
          e.toString()))
      .toList();
}

typedef $JsonFactory<T> = T Function(Map<String, dynamic> json);

class $CustomJsonDecoder {
  $CustomJsonDecoder(this.factories);

  final Map<Type, $JsonFactory> factories;

  dynamic decode<T>(dynamic entity) {
    if (entity is Iterable) {
      return _decodeList<T>(entity);
    }

    if (entity is T) {
      return entity;
    }

    if (isTypeOf<T, Map>()) {
      return entity;
    }

    if (isTypeOf<T, Iterable>()) {
      return entity;
    }

    if (entity is Map<String, dynamic>) {
      return _decodeMap<T>(entity);
    }

    return entity;
  }

  T _decodeMap<T>(Map<String, dynamic> values) {
    final jsonFactory = factories[T];
    if (jsonFactory == null || jsonFactory is! $JsonFactory<T>) {
      return throw "Could not find factory for type $T. Is '$T: $T.fromJsonFactory' included in the CustomJsonDecoder instance creation in bootstrapper.dart?";
    }

    return jsonFactory(values);
  }

  List<T> _decodeList<T>(Iterable values) =>
      values.where((v) => v != null).map<T>((v) => decode<T>(v) as T).toList();
}

class $JsonSerializableConverter extends chopper.JsonConverter {
  @override
  FutureOr<chopper.Response<ResultType>> convertResponse<ResultType, Item>(
      chopper.Response response) async {
    if (response.bodyString.isEmpty) {
      // In rare cases, when let's say 204 (no content) is returned -
      // we cannot decode the missing json with the result type specified
      return chopper.Response(response.base, null, error: response.error);
    }

    final jsonRes = await super.convertResponse(response);
    return jsonRes.copyWith<ResultType>(
        body: $jsonDecoder.decode<Item>(jsonRes.body) as ResultType);
  }
}

final $jsonDecoder = $CustomJsonDecoder(generatedMapping);

// ignore: unused_element
String? _dateToJson(DateTime? date) {
  if (date == null) {
    return null;
  }

  final year = date.year.toString();
  final month = date.month < 10 ? '0${date.month}' : date.month.toString();
  final day = date.day < 10 ? '0${date.day}' : date.day.toString();

  return '$year-$month-$day';
}

class Wrapped<T> {
  final T value;
  const Wrapped.value(this.value);
}
