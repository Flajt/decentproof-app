// ignore_for_file: type=lint

import 'package:json_annotation/json_annotation.dart';
import 'package:collection/collection.dart';
import 'dart:convert';

import 'package:chopper/chopper.dart';

import 'client_mapping.dart';
import 'package:chopper/chopper.dart' as chopper;
import 'openapi.enums.swagger.dart' as enums;
import 'openapi.enums.swagger.dart';
export 'openapi.enums.swagger.dart';

part 'openapi.swagger.chopper.dart';
part 'openapi.swagger.g.dart';

// **************************************************************************
// SwaggerChopperGenerator
// **************************************************************************

@ChopperApi()
abstract class Openapi extends ChopperService {
  static Openapi create(
      {ChopperClient? client,
      Authenticator? authenticator,
      String? baseUrl,
      Iterable<dynamic>? interceptors}) {
    if (client != null) {
      return _$Openapi(client);
    }

    final newClient = ChopperClient(
        services: [_$Openapi()],
        converter: $JsonSerializableConverter(),
        interceptors: interceptors ?? [],
        authenticator: authenticator,
        baseUrl: baseUrl ?? 'http://');
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
  @Post(path: '/api/v1/messages')
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
      apiV1AddressesAddressOutputsGet(
          {required String? address, bool? includeSpent, int? type}) {
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
      _apiV1AddressesAddressOutputsGet(
          {@Path('address') required String? address,
          @Query('include-spent') bool? includeSpent,
          @Query('type') int? type});

  ///Get all outputs that use a given hex-encoded Ed25519 address.
  ///@param address hex-encoded Ed25519 address that is referenced by the outputs.
  ///@param include-spent Set to true to also include the known spent outputs for the given address.
  ///@param type Allows to filter the results by output type. Set to value `0` to filter outputs of type `SigLockedSingleOutput`. Set to value `1` to filter outputs of type `SigLockedDustAllowanceOutput`.
  Future<chopper.Response<OutputsAddressResponse>>
      apiV1AddressesEd25519AddressOutputsGet(
          {required String? address, bool? includeSpent, int? type}) {
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
      _apiV1AddressesEd25519AddressOutputsGet(
          {@Path('address') required String? address,
          @Query('include-spent') bool? includeSpent,
          @Query('type') int? type});

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
  @Post(path: '/api/v1/peers')
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

  @JsonKey(name: 'networkId')
  final String networkId;
  @JsonKey(name: 'parentMessageIds', defaultValue: <String>[])
  final List<String> parentMessageIds;
  @JsonKey(name: 'payload')
  final dynamic payload;
  @JsonKey(name: 'nonce')
  final String nonce;
  static const fromJsonFactory = _$MessageFromJson;
  static const toJsonFactory = _$MessageToJson;
  Map<String, dynamic> toJson() => _$MessageToJson(this);

  @override
  String toString() => jsonEncode(this);

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

  @JsonKey(name: 'type')
  final int type;
  @JsonKey(name: 'essence')
  final Object essence;
  @JsonKey(name: 'unlockBlocks', defaultValue: <Object>[])
  final List<Object> unlockBlocks;
  static const fromJsonFactory = _$TransactionPayloadFromJson;
  static const toJsonFactory = _$TransactionPayloadToJson;
  Map<String, dynamic> toJson() => _$TransactionPayloadToJson(this);

  @override
  String toString() => jsonEncode(this);

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

  @JsonKey(name: 'type')
  final int type;
  @JsonKey(name: 'inputs', defaultValue: <Object>[])
  final List<Object> inputs;
  @JsonKey(name: 'outputs', defaultValue: <Object>[])
  final List<Object> outputs;
  @JsonKey(name: 'payload')
  final dynamic payload;
  static const fromJsonFactory = _$TransactionEssenceFromJson;
  static const toJsonFactory = _$TransactionEssenceToJson;
  Map<String, dynamic> toJson() => _$TransactionEssenceToJson(this);

  @override
  String toString() => jsonEncode(this);

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

  @JsonKey(name: 'type')
  final int type;
  @JsonKey(name: 'transactionId')
  final String transactionId;
  @JsonKey(name: 'transactionOutputIndex')
  final int transactionOutputIndex;
  static const fromJsonFactory = _$UTXOInputFromJson;
  static const toJsonFactory = _$UTXOInputToJson;
  Map<String, dynamic> toJson() => _$UTXOInputToJson(this);

  @override
  String toString() => jsonEncode(this);

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

  @JsonKey(name: 'type')
  final int type;
  @JsonKey(name: 'address')
  final dynamic address;
  @JsonKey(name: 'amount')
  final int amount;
  static const fromJsonFactory = _$SigLockedSingleOutputFromJson;
  static const toJsonFactory = _$SigLockedSingleOutputToJson;
  Map<String, dynamic> toJson() => _$SigLockedSingleOutputToJson(this);

  @override
  String toString() => jsonEncode(this);

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

  @JsonKey(name: 'type')
  final int type;
  @JsonKey(name: 'address')
  final dynamic address;
  @JsonKey(name: 'amount')
  final int amount;
  static const fromJsonFactory = _$SigLockedDustAllowanceOutputFromJson;
  static const toJsonFactory = _$SigLockedDustAllowanceOutputToJson;
  Map<String, dynamic> toJson() => _$SigLockedDustAllowanceOutputToJson(this);

  @override
  String toString() => jsonEncode(this);

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
}

@JsonSerializable(explicitToJson: true)
class Ed25519Address {
  Ed25519Address({
    required this.type,
    required this.address,
  });

  factory Ed25519Address.fromJson(Map<String, dynamic> json) =>
      _$Ed25519AddressFromJson(json);

  @JsonKey(name: 'type')
  final int type;
  @JsonKey(name: 'address')
  final String address;
  static const fromJsonFactory = _$Ed25519AddressFromJson;
  static const toJsonFactory = _$Ed25519AddressToJson;
  Map<String, dynamic> toJson() => _$Ed25519AddressToJson(this);

  @override
  String toString() => jsonEncode(this);

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
}

@JsonSerializable(explicitToJson: true)
class SignatureUnlockBlock {
  SignatureUnlockBlock({
    required this.type,
    required this.signature,
  });

  factory SignatureUnlockBlock.fromJson(Map<String, dynamic> json) =>
      _$SignatureUnlockBlockFromJson(json);

  @JsonKey(name: 'type')
  final int type;
  @JsonKey(name: 'signature')
  final Object signature;
  static const fromJsonFactory = _$SignatureUnlockBlockFromJson;
  static const toJsonFactory = _$SignatureUnlockBlockToJson;
  Map<String, dynamic> toJson() => _$SignatureUnlockBlockToJson(this);

  @override
  String toString() => jsonEncode(this);

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

  @JsonKey(name: 'type')
  final int type;
  @JsonKey(name: 'publicKey')
  final String publicKey;
  @JsonKey(name: 'signature')
  final String signature;
  static const fromJsonFactory = _$Ed25519SignatureFromJson;
  static const toJsonFactory = _$Ed25519SignatureToJson;
  Map<String, dynamic> toJson() => _$Ed25519SignatureToJson(this);

  @override
  String toString() => jsonEncode(this);

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
}

@JsonSerializable(explicitToJson: true)
class ReferenceUnlockBlock {
  ReferenceUnlockBlock({
    required this.type,
    required this.reference,
  });

  factory ReferenceUnlockBlock.fromJson(Map<String, dynamic> json) =>
      _$ReferenceUnlockBlockFromJson(json);

  @JsonKey(name: 'type')
  final int type;
  @JsonKey(name: 'reference')
  final int reference;
  static const fromJsonFactory = _$ReferenceUnlockBlockFromJson;
  static const toJsonFactory = _$ReferenceUnlockBlockToJson;
  Map<String, dynamic> toJson() => _$ReferenceUnlockBlockToJson(this);

  @override
  String toString() => jsonEncode(this);

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
  static const toJsonFactory = _$MilestonePayloadToJson;
  Map<String, dynamic> toJson() => _$MilestonePayloadToJson(this);

  @override
  String toString() => jsonEncode(this);

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

  @JsonKey(name: 'type')
  final int type;
  @JsonKey(name: 'index')
  final String index;
  @JsonKey(name: 'data')
  final String data;
  static const fromJsonFactory = _$IndexationPayloadFromJson;
  static const toJsonFactory = _$IndexationPayloadToJson;
  Map<String, dynamic> toJson() => _$IndexationPayloadToJson(this);

  @override
  String toString() => jsonEncode(this);

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

  @JsonKey(name: 'type')
  final int type;
  @JsonKey(name: 'input')
  final TreasuryInput input;
  @JsonKey(name: 'output')
  final TreasuryOutput output;
  static const fromJsonFactory = _$TreasuryTransactionPayloadFromJson;
  static const toJsonFactory = _$TreasuryTransactionPayloadToJson;
  Map<String, dynamic> toJson() => _$TreasuryTransactionPayloadToJson(this);

  @override
  String toString() => jsonEncode(this);

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
}

@JsonSerializable(explicitToJson: true)
class TreasuryInput {
  TreasuryInput({
    required this.type,
    required this.milestoneId,
  });

  factory TreasuryInput.fromJson(Map<String, dynamic> json) =>
      _$TreasuryInputFromJson(json);

  @JsonKey(name: 'type')
  final int type;
  @JsonKey(name: 'milestoneId')
  final String milestoneId;
  static const fromJsonFactory = _$TreasuryInputFromJson;
  static const toJsonFactory = _$TreasuryInputToJson;
  Map<String, dynamic> toJson() => _$TreasuryInputToJson(this);

  @override
  String toString() => jsonEncode(this);

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
}

@JsonSerializable(explicitToJson: true)
class TreasuryOutput {
  TreasuryOutput({
    required this.type,
    required this.amount,
  });

  factory TreasuryOutput.fromJson(Map<String, dynamic> json) =>
      _$TreasuryOutputFromJson(json);

  @JsonKey(name: 'type')
  final int type;
  @JsonKey(name: 'amount')
  final int amount;
  static const fromJsonFactory = _$TreasuryOutputFromJson;
  static const toJsonFactory = _$TreasuryOutputToJson;
  Map<String, dynamic> toJson() => _$TreasuryOutputToJson(this);

  @override
  String toString() => jsonEncode(this);

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

  @JsonKey(name: 'id')
  final String id;
  @JsonKey(name: 'multiAddresses', defaultValue: <String>[])
  final List<String> multiAddresses;
  @JsonKey(name: 'alias')
  final String? alias;
  @JsonKey(
      name: 'relation',
      toJson: peerRelationToJson,
      fromJson: peerRelationFromJson)
  final enums.PeerRelation relation;
  @JsonKey(name: 'connected')
  final bool connected;
  @JsonKey(name: 'gossip')
  final Gossip gossip;
  static const fromJsonFactory = _$PeerFromJson;
  static const toJsonFactory = _$PeerToJson;
  Map<String, dynamic> toJson() => _$PeerToJson(this);

  @override
  String toString() => jsonEncode(this);

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
}

@JsonSerializable(explicitToJson: true)
class Gossip {
  Gossip({
    this.heartbeat,
    this.metrics,
  });

  factory Gossip.fromJson(Map<String, dynamic> json) => _$GossipFromJson(json);

  @JsonKey(name: 'heartbeat')
  final Heartbeat? heartbeat;
  @JsonKey(name: 'metrics')
  final Metrics? metrics;
  static const fromJsonFactory = _$GossipFromJson;
  static const toJsonFactory = _$GossipToJson;
  Map<String, dynamic> toJson() => _$GossipToJson(this);

  @override
  String toString() => jsonEncode(this);

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
  static const toJsonFactory = _$HeartbeatToJson;
  Map<String, dynamic> toJson() => _$HeartbeatToJson(this);

  @override
  String toString() => jsonEncode(this);

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
  static const toJsonFactory = _$MetricsToJson;
  Map<String, dynamic> toJson() => _$MetricsToJson(this);

  @override
  String toString() => jsonEncode(this);

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
}

@JsonSerializable(explicitToJson: true)
class ReceiptTuple {
  ReceiptTuple({
    required this.receipt,
    required this.milestoneIndex,
  });

  factory ReceiptTuple.fromJson(Map<String, dynamic> json) =>
      _$ReceiptTupleFromJson(json);

  @JsonKey(name: 'receipt')
  final ReceiptPayload receipt;
  @JsonKey(name: 'milestoneIndex')
  final int milestoneIndex;
  static const fromJsonFactory = _$ReceiptTupleFromJson;
  static const toJsonFactory = _$ReceiptTupleToJson;
  Map<String, dynamic> toJson() => _$ReceiptTupleToJson(this);

  @override
  String toString() => jsonEncode(this);

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

  @JsonKey(name: 'migratedAt')
  final int migratedAt;
  @JsonKey(name: 'final')
  final bool $final;
  @JsonKey(name: 'funds', defaultValue: <MigratedFundsEntry>[])
  final List<MigratedFundsEntry> funds;
  @JsonKey(name: 'transaction')
  final TreasuryTransactionPayload transaction;
  static const fromJsonFactory = _$ReceiptPayloadFromJson;
  static const toJsonFactory = _$ReceiptPayloadToJson;
  Map<String, dynamic> toJson() => _$ReceiptPayloadToJson(this);

  @override
  String toString() => jsonEncode(this);

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

  @JsonKey(name: 'tailTransactionHash')
  final String tailTransactionHash;
  @JsonKey(name: 'address')
  final dynamic address;
  @JsonKey(name: 'deposit')
  final int deposit;
  static const fromJsonFactory = _$MigratedFundsEntryFromJson;
  static const toJsonFactory = _$MigratedFundsEntryToJson;
  Map<String, dynamic> toJson() => _$MigratedFundsEntryToJson(this);

  @override
  String toString() => jsonEncode(this);

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
}

@JsonSerializable(explicitToJson: true)
class ErrorResponse {
  ErrorResponse({
    required this.error,
  });

  factory ErrorResponse.fromJson(Map<String, dynamic> json) =>
      _$ErrorResponseFromJson(json);

  @JsonKey(name: 'error')
  final ErrorResponse$Error error;
  static const fromJsonFactory = _$ErrorResponseFromJson;
  static const toJsonFactory = _$ErrorResponseToJson;
  Map<String, dynamic> toJson() => _$ErrorResponseToJson(this);

  @override
  String toString() => jsonEncode(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ErrorResponse &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(error) ^ runtimeType.hashCode;
}

extension $ErrorResponseExtension on ErrorResponse {
  ErrorResponse copyWith({ErrorResponse$Error? error}) {
    return ErrorResponse(error: error ?? this.error);
  }
}

@JsonSerializable(explicitToJson: true)
class ForbiddenResponse {
  ForbiddenResponse();

  factory ForbiddenResponse.fromJson(Map<String, dynamic> json) =>
      _$ForbiddenResponseFromJson(json);

  static const fromJsonFactory = _$ForbiddenResponseFromJson;
  static const toJsonFactory = _$ForbiddenResponseToJson;
  Map<String, dynamic> toJson() => _$ForbiddenResponseToJson(this);

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode => runtimeType.hashCode;
}

@JsonSerializable(explicitToJson: true)
class ServiceUnavailableResponse {
  ServiceUnavailableResponse();

  factory ServiceUnavailableResponse.fromJson(Map<String, dynamic> json) =>
      _$ServiceUnavailableResponseFromJson(json);

  static const fromJsonFactory = _$ServiceUnavailableResponseFromJson;
  static const toJsonFactory = _$ServiceUnavailableResponseToJson;
  Map<String, dynamic> toJson() => _$ServiceUnavailableResponseToJson(this);

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode => runtimeType.hashCode;
}

@JsonSerializable(explicitToJson: true)
class BadRequestResponse {
  BadRequestResponse();

  factory BadRequestResponse.fromJson(Map<String, dynamic> json) =>
      _$BadRequestResponseFromJson(json);

  static const fromJsonFactory = _$BadRequestResponseFromJson;
  static const toJsonFactory = _$BadRequestResponseToJson;
  Map<String, dynamic> toJson() => _$BadRequestResponseToJson(this);

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode => runtimeType.hashCode;
}

@JsonSerializable(explicitToJson: true)
class NotFoundResponse {
  NotFoundResponse();

  factory NotFoundResponse.fromJson(Map<String, dynamic> json) =>
      _$NotFoundResponseFromJson(json);

  static const fromJsonFactory = _$NotFoundResponseFromJson;
  static const toJsonFactory = _$NotFoundResponseToJson;
  Map<String, dynamic> toJson() => _$NotFoundResponseToJson(this);

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode => runtimeType.hashCode;
}

@JsonSerializable(explicitToJson: true)
class InternalErrorResponse {
  InternalErrorResponse();

  factory InternalErrorResponse.fromJson(Map<String, dynamic> json) =>
      _$InternalErrorResponseFromJson(json);

  static const fromJsonFactory = _$InternalErrorResponseFromJson;
  static const toJsonFactory = _$InternalErrorResponseToJson;
  Map<String, dynamic> toJson() => _$InternalErrorResponseToJson(this);

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode => runtimeType.hashCode;
}

@JsonSerializable(explicitToJson: true)
class InfoResponse {
  InfoResponse({
    required this.data,
  });

  factory InfoResponse.fromJson(Map<String, dynamic> json) =>
      _$InfoResponseFromJson(json);

  @JsonKey(name: 'data')
  final InfoResponse$Data data;
  static const fromJsonFactory = _$InfoResponseFromJson;
  static const toJsonFactory = _$InfoResponseToJson;
  Map<String, dynamic> toJson() => _$InfoResponseToJson(this);

  @override
  String toString() => jsonEncode(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is InfoResponse &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(data) ^ runtimeType.hashCode;
}

extension $InfoResponseExtension on InfoResponse {
  InfoResponse copyWith({InfoResponse$Data? data}) {
    return InfoResponse(data: data ?? this.data);
  }
}

@JsonSerializable(explicitToJson: true)
class TipsResponse {
  TipsResponse({
    required this.data,
  });

  factory TipsResponse.fromJson(Map<String, dynamic> json) =>
      _$TipsResponseFromJson(json);

  @JsonKey(name: 'data')
  final TipsResponse$Data data;
  static const fromJsonFactory = _$TipsResponseFromJson;
  static const toJsonFactory = _$TipsResponseToJson;
  Map<String, dynamic> toJson() => _$TipsResponseToJson(this);

  @override
  String toString() => jsonEncode(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is TipsResponse &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(data) ^ runtimeType.hashCode;
}

extension $TipsResponseExtension on TipsResponse {
  TipsResponse copyWith({TipsResponse$Data? data}) {
    return TipsResponse(data: data ?? this.data);
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

  @JsonKey(name: 'networkId')
  final String? networkId;
  @JsonKey(name: 'parentMessageIds', defaultValue: <String>[])
  final List<String>? parentMessageIds;
  @JsonKey(name: 'payload')
  final dynamic payload;
  @JsonKey(name: 'nonce')
  final String? nonce;
  static const fromJsonFactory = _$SubmitMessageRequestFromJson;
  static const toJsonFactory = _$SubmitMessageRequestToJson;
  Map<String, dynamic> toJson() => _$SubmitMessageRequestToJson(this);

  @override
  String toString() => jsonEncode(this);

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
}

@JsonSerializable(explicitToJson: true)
class SubmitMessageResponse {
  SubmitMessageResponse({
    required this.data,
  });

  factory SubmitMessageResponse.fromJson(Map<String, dynamic> json) =>
      _$SubmitMessageResponseFromJson(json);

  @JsonKey(name: 'data')
  final SubmitMessageResponse$Data data;
  static const fromJsonFactory = _$SubmitMessageResponseFromJson;
  static const toJsonFactory = _$SubmitMessageResponseToJson;
  Map<String, dynamic> toJson() => _$SubmitMessageResponseToJson(this);

  @override
  String toString() => jsonEncode(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SubmitMessageResponse &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(data) ^ runtimeType.hashCode;
}

extension $SubmitMessageResponseExtension on SubmitMessageResponse {
  SubmitMessageResponse copyWith({SubmitMessageResponse$Data? data}) {
    return SubmitMessageResponse(data: data ?? this.data);
  }
}

@JsonSerializable(explicitToJson: true)
class MessagesFindResponse {
  MessagesFindResponse({
    required this.data,
  });

  factory MessagesFindResponse.fromJson(Map<String, dynamic> json) =>
      _$MessagesFindResponseFromJson(json);

  @JsonKey(name: 'data')
  final MessagesFindResponse$Data data;
  static const fromJsonFactory = _$MessagesFindResponseFromJson;
  static const toJsonFactory = _$MessagesFindResponseToJson;
  Map<String, dynamic> toJson() => _$MessagesFindResponseToJson(this);

  @override
  String toString() => jsonEncode(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is MessagesFindResponse &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(data) ^ runtimeType.hashCode;
}

extension $MessagesFindResponseExtension on MessagesFindResponse {
  MessagesFindResponse copyWith({MessagesFindResponse$Data? data}) {
    return MessagesFindResponse(data: data ?? this.data);
  }
}

@JsonSerializable(explicitToJson: true)
class MessageMetadataResponse {
  MessageMetadataResponse({
    required this.data,
  });

  factory MessageMetadataResponse.fromJson(Map<String, dynamic> json) =>
      _$MessageMetadataResponseFromJson(json);

  @JsonKey(name: 'data')
  final MessageMetadataResponse$Data data;
  static const fromJsonFactory = _$MessageMetadataResponseFromJson;
  static const toJsonFactory = _$MessageMetadataResponseToJson;
  Map<String, dynamic> toJson() => _$MessageMetadataResponseToJson(this);

  @override
  String toString() => jsonEncode(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is MessageMetadataResponse &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(data) ^ runtimeType.hashCode;
}

extension $MessageMetadataResponseExtension on MessageMetadataResponse {
  MessageMetadataResponse copyWith({MessageMetadataResponse$Data? data}) {
    return MessageMetadataResponse(data: data ?? this.data);
  }
}

@JsonSerializable(explicitToJson: true)
class MessageResponse {
  MessageResponse({
    required this.data,
  });

  factory MessageResponse.fromJson(Map<String, dynamic> json) =>
      _$MessageResponseFromJson(json);

  @JsonKey(name: 'data')
  final MessageResponse$Data data;
  static const fromJsonFactory = _$MessageResponseFromJson;
  static const toJsonFactory = _$MessageResponseToJson;
  Map<String, dynamic> toJson() => _$MessageResponseToJson(this);

  @override
  String toString() => jsonEncode(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is MessageResponse &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(data) ^ runtimeType.hashCode;
}

extension $MessageResponseExtension on MessageResponse {
  MessageResponse copyWith({MessageResponse$Data? data}) {
    return MessageResponse(data: data ?? this.data);
  }
}

@JsonSerializable(explicitToJson: true)
class MessageChildrenResponse {
  MessageChildrenResponse({
    required this.data,
  });

  factory MessageChildrenResponse.fromJson(Map<String, dynamic> json) =>
      _$MessageChildrenResponseFromJson(json);

  @JsonKey(name: 'data')
  final MessageChildrenResponse$Data data;
  static const fromJsonFactory = _$MessageChildrenResponseFromJson;
  static const toJsonFactory = _$MessageChildrenResponseToJson;
  Map<String, dynamic> toJson() => _$MessageChildrenResponseToJson(this);

  @override
  String toString() => jsonEncode(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is MessageChildrenResponse &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(data) ^ runtimeType.hashCode;
}

extension $MessageChildrenResponseExtension on MessageChildrenResponse {
  MessageChildrenResponse copyWith({MessageChildrenResponse$Data? data}) {
    return MessageChildrenResponse(data: data ?? this.data);
  }
}

@JsonSerializable(explicitToJson: true)
class OutputResponse {
  OutputResponse({
    required this.data,
  });

  factory OutputResponse.fromJson(Map<String, dynamic> json) =>
      _$OutputResponseFromJson(json);

  @JsonKey(name: 'data')
  final OutputResponse$Data data;
  static const fromJsonFactory = _$OutputResponseFromJson;
  static const toJsonFactory = _$OutputResponseToJson;
  Map<String, dynamic> toJson() => _$OutputResponseToJson(this);

  @override
  String toString() => jsonEncode(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is OutputResponse &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(data) ^ runtimeType.hashCode;
}

extension $OutputResponseExtension on OutputResponse {
  OutputResponse copyWith({OutputResponse$Data? data}) {
    return OutputResponse(data: data ?? this.data);
  }
}

@JsonSerializable(explicitToJson: true)
class BalanceAddressResponse {
  BalanceAddressResponse({
    required this.data,
  });

  factory BalanceAddressResponse.fromJson(Map<String, dynamic> json) =>
      _$BalanceAddressResponseFromJson(json);

  @JsonKey(name: 'data')
  final BalanceAddressResponse$Data data;
  static const fromJsonFactory = _$BalanceAddressResponseFromJson;
  static const toJsonFactory = _$BalanceAddressResponseToJson;
  Map<String, dynamic> toJson() => _$BalanceAddressResponseToJson(this);

  @override
  String toString() => jsonEncode(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is BalanceAddressResponse &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(data) ^ runtimeType.hashCode;
}

extension $BalanceAddressResponseExtension on BalanceAddressResponse {
  BalanceAddressResponse copyWith({BalanceAddressResponse$Data? data}) {
    return BalanceAddressResponse(data: data ?? this.data);
  }
}

@JsonSerializable(explicitToJson: true)
class OutputsAddressResponse {
  OutputsAddressResponse({
    required this.data,
  });

  factory OutputsAddressResponse.fromJson(Map<String, dynamic> json) =>
      _$OutputsAddressResponseFromJson(json);

  @JsonKey(name: 'data')
  final OutputsAddressResponse$Data data;
  static const fromJsonFactory = _$OutputsAddressResponseFromJson;
  static const toJsonFactory = _$OutputsAddressResponseToJson;
  Map<String, dynamic> toJson() => _$OutputsAddressResponseToJson(this);

  @override
  String toString() => jsonEncode(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is OutputsAddressResponse &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(data) ^ runtimeType.hashCode;
}

extension $OutputsAddressResponseExtension on OutputsAddressResponse {
  OutputsAddressResponse copyWith({OutputsAddressResponse$Data? data}) {
    return OutputsAddressResponse(data: data ?? this.data);
  }
}

@JsonSerializable(explicitToJson: true)
class ReceiptsResponse {
  ReceiptsResponse({
    required this.data,
  });

  factory ReceiptsResponse.fromJson(Map<String, dynamic> json) =>
      _$ReceiptsResponseFromJson(json);

  @JsonKey(name: 'data')
  final ReceiptsResponse$Data data;
  static const fromJsonFactory = _$ReceiptsResponseFromJson;
  static const toJsonFactory = _$ReceiptsResponseToJson;
  Map<String, dynamic> toJson() => _$ReceiptsResponseToJson(this);

  @override
  String toString() => jsonEncode(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ReceiptsResponse &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(data) ^ runtimeType.hashCode;
}

extension $ReceiptsResponseExtension on ReceiptsResponse {
  ReceiptsResponse copyWith({ReceiptsResponse$Data? data}) {
    return ReceiptsResponse(data: data ?? this.data);
  }
}

@JsonSerializable(explicitToJson: true)
class TreasuryResponse {
  TreasuryResponse({
    required this.data,
  });

  factory TreasuryResponse.fromJson(Map<String, dynamic> json) =>
      _$TreasuryResponseFromJson(json);

  @JsonKey(name: 'data')
  final TreasuryResponse$Data data;
  static const fromJsonFactory = _$TreasuryResponseFromJson;
  static const toJsonFactory = _$TreasuryResponseToJson;
  Map<String, dynamic> toJson() => _$TreasuryResponseToJson(this);

  @override
  String toString() => jsonEncode(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is TreasuryResponse &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(data) ^ runtimeType.hashCode;
}

extension $TreasuryResponseExtension on TreasuryResponse {
  TreasuryResponse copyWith({TreasuryResponse$Data? data}) {
    return TreasuryResponse(data: data ?? this.data);
  }
}

@JsonSerializable(explicitToJson: true)
class MilestoneResponse {
  MilestoneResponse({
    required this.data,
  });

  factory MilestoneResponse.fromJson(Map<String, dynamic> json) =>
      _$MilestoneResponseFromJson(json);

  @JsonKey(name: 'data')
  final MilestoneResponse$Data data;
  static const fromJsonFactory = _$MilestoneResponseFromJson;
  static const toJsonFactory = _$MilestoneResponseToJson;
  Map<String, dynamic> toJson() => _$MilestoneResponseToJson(this);

  @override
  String toString() => jsonEncode(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is MilestoneResponse &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(data) ^ runtimeType.hashCode;
}

extension $MilestoneResponseExtension on MilestoneResponse {
  MilestoneResponse copyWith({MilestoneResponse$Data? data}) {
    return MilestoneResponse(data: data ?? this.data);
  }
}

@JsonSerializable(explicitToJson: true)
class UTXOChangesResponse {
  UTXOChangesResponse({
    required this.data,
  });

  factory UTXOChangesResponse.fromJson(Map<String, dynamic> json) =>
      _$UTXOChangesResponseFromJson(json);

  @JsonKey(name: 'data')
  final UTXOChangesResponse$Data data;
  static const fromJsonFactory = _$UTXOChangesResponseFromJson;
  static const toJsonFactory = _$UTXOChangesResponseToJson;
  Map<String, dynamic> toJson() => _$UTXOChangesResponseToJson(this);

  @override
  String toString() => jsonEncode(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UTXOChangesResponse &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(data) ^ runtimeType.hashCode;
}

extension $UTXOChangesResponseExtension on UTXOChangesResponse {
  UTXOChangesResponse copyWith({UTXOChangesResponse$Data? data}) {
    return UTXOChangesResponse(data: data ?? this.data);
  }
}

@JsonSerializable(explicitToJson: true)
class PeersResponse {
  PeersResponse({
    required this.data,
  });

  factory PeersResponse.fromJson(Map<String, dynamic> json) =>
      _$PeersResponseFromJson(json);

  @JsonKey(name: 'data', defaultValue: <Peer>[])
  final List<Peer> data;
  static const fromJsonFactory = _$PeersResponseFromJson;
  static const toJsonFactory = _$PeersResponseToJson;
  Map<String, dynamic> toJson() => _$PeersResponseToJson(this);

  @override
  String toString() => jsonEncode(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PeersResponse &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(data) ^ runtimeType.hashCode;
}

extension $PeersResponseExtension on PeersResponse {
  PeersResponse copyWith({List<Peer>? data}) {
    return PeersResponse(data: data ?? this.data);
  }
}

@JsonSerializable(explicitToJson: true)
class PeerResponse {
  PeerResponse({
    required this.data,
  });

  factory PeerResponse.fromJson(Map<String, dynamic> json) =>
      _$PeerResponseFromJson(json);

  @JsonKey(name: 'data')
  final Peer data;
  static const fromJsonFactory = _$PeerResponseFromJson;
  static const toJsonFactory = _$PeerResponseToJson;
  Map<String, dynamic> toJson() => _$PeerResponseToJson(this);

  @override
  String toString() => jsonEncode(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PeerResponse &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(data) ^ runtimeType.hashCode;
}

extension $PeerResponseExtension on PeerResponse {
  PeerResponse copyWith({Peer? data}) {
    return PeerResponse(data: data ?? this.data);
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

  @JsonKey(name: 'multiAddress')
  final String multiAddress;
  @JsonKey(name: 'alias')
  final String? alias;
  static const fromJsonFactory = _$AddPeerRequestFromJson;
  static const toJsonFactory = _$AddPeerRequestToJson;
  Map<String, dynamic> toJson() => _$AddPeerRequestToJson(this);

  @override
  String toString() => jsonEncode(this);

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
}

@JsonSerializable(explicitToJson: true)
class AddPeerResponse {
  AddPeerResponse({
    required this.data,
  });

  factory AddPeerResponse.fromJson(Map<String, dynamic> json) =>
      _$AddPeerResponseFromJson(json);

  @JsonKey(name: 'data')
  final Peer data;
  static const fromJsonFactory = _$AddPeerResponseFromJson;
  static const toJsonFactory = _$AddPeerResponseToJson;
  Map<String, dynamic> toJson() => _$AddPeerResponseToJson(this);

  @override
  String toString() => jsonEncode(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is AddPeerResponse &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(data) ^ runtimeType.hashCode;
}

extension $AddPeerResponseExtension on AddPeerResponse {
  AddPeerResponse copyWith({Peer? data}) {
    return AddPeerResponse(data: data ?? this.data);
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

  @JsonKey(name: 'code')
  final String code;
  @JsonKey(name: 'message')
  final String message;
  static const fromJsonFactory = _$ErrorResponse$ErrorFromJson;
  static const toJsonFactory = _$ErrorResponse$ErrorToJson;
  Map<String, dynamic> toJson() => _$ErrorResponse$ErrorToJson(this);

  @override
  String toString() => jsonEncode(this);

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
}

@JsonSerializable(explicitToJson: true)
class ForbiddenResponse$Error {
  ForbiddenResponse$Error({
    required this.code,
    required this.message,
  });

  factory ForbiddenResponse$Error.fromJson(Map<String, dynamic> json) =>
      _$ForbiddenResponse$ErrorFromJson(json);

  @JsonKey(name: 'code')
  final String code;
  @JsonKey(name: 'message')
  final String message;
  static const fromJsonFactory = _$ForbiddenResponse$ErrorFromJson;
  static const toJsonFactory = _$ForbiddenResponse$ErrorToJson;
  Map<String, dynamic> toJson() => _$ForbiddenResponse$ErrorToJson(this);

  @override
  String toString() => jsonEncode(this);

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

  @JsonKey(name: 'code')
  final String code;
  @JsonKey(name: 'message')
  final String message;
  static const fromJsonFactory = _$ServiceUnavailableResponse$ErrorFromJson;
  static const toJsonFactory = _$ServiceUnavailableResponse$ErrorToJson;
  Map<String, dynamic> toJson() =>
      _$ServiceUnavailableResponse$ErrorToJson(this);

  @override
  String toString() => jsonEncode(this);

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
}

@JsonSerializable(explicitToJson: true)
class BadRequestResponse$Error {
  BadRequestResponse$Error({
    required this.code,
    required this.message,
  });

  factory BadRequestResponse$Error.fromJson(Map<String, dynamic> json) =>
      _$BadRequestResponse$ErrorFromJson(json);

  @JsonKey(name: 'code')
  final String code;
  @JsonKey(name: 'message')
  final String message;
  static const fromJsonFactory = _$BadRequestResponse$ErrorFromJson;
  static const toJsonFactory = _$BadRequestResponse$ErrorToJson;
  Map<String, dynamic> toJson() => _$BadRequestResponse$ErrorToJson(this);

  @override
  String toString() => jsonEncode(this);

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
}

@JsonSerializable(explicitToJson: true)
class NotFoundResponse$Error {
  NotFoundResponse$Error({
    required this.code,
    required this.message,
  });

  factory NotFoundResponse$Error.fromJson(Map<String, dynamic> json) =>
      _$NotFoundResponse$ErrorFromJson(json);

  @JsonKey(name: 'code')
  final String code;
  @JsonKey(name: 'message')
  final String message;
  static const fromJsonFactory = _$NotFoundResponse$ErrorFromJson;
  static const toJsonFactory = _$NotFoundResponse$ErrorToJson;
  Map<String, dynamic> toJson() => _$NotFoundResponse$ErrorToJson(this);

  @override
  String toString() => jsonEncode(this);

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
}

@JsonSerializable(explicitToJson: true)
class InternalErrorResponse$Error {
  InternalErrorResponse$Error({
    required this.code,
    required this.message,
  });

  factory InternalErrorResponse$Error.fromJson(Map<String, dynamic> json) =>
      _$InternalErrorResponse$ErrorFromJson(json);

  @JsonKey(name: 'code')
  final String code;
  @JsonKey(name: 'message')
  final String message;
  static const fromJsonFactory = _$InternalErrorResponse$ErrorFromJson;
  static const toJsonFactory = _$InternalErrorResponse$ErrorToJson;
  Map<String, dynamic> toJson() => _$InternalErrorResponse$ErrorToJson(this);

  @override
  String toString() => jsonEncode(this);

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
  static const toJsonFactory = _$InfoResponse$DataToJson;
  Map<String, dynamic> toJson() => _$InfoResponse$DataToJson(this);

  @override
  String toString() => jsonEncode(this);

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
}

@JsonSerializable(explicitToJson: true)
class TipsResponse$Data {
  TipsResponse$Data({
    required this.tipMessageIds,
  });

  factory TipsResponse$Data.fromJson(Map<String, dynamic> json) =>
      _$TipsResponse$DataFromJson(json);

  @JsonKey(name: 'tipMessageIds', defaultValue: <String>[])
  final List<String> tipMessageIds;
  static const fromJsonFactory = _$TipsResponse$DataFromJson;
  static const toJsonFactory = _$TipsResponse$DataToJson;
  Map<String, dynamic> toJson() => _$TipsResponse$DataToJson(this);

  @override
  String toString() => jsonEncode(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is TipsResponse$Data &&
            (identical(other.tipMessageIds, tipMessageIds) ||
                const DeepCollectionEquality()
                    .equals(other.tipMessageIds, tipMessageIds)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(tipMessageIds) ^ runtimeType.hashCode;
}

extension $TipsResponse$DataExtension on TipsResponse$Data {
  TipsResponse$Data copyWith({List<String>? tipMessageIds}) {
    return TipsResponse$Data(
        tipMessageIds: tipMessageIds ?? this.tipMessageIds);
  }
}

@JsonSerializable(explicitToJson: true)
class SubmitMessageResponse$Data {
  SubmitMessageResponse$Data({
    required this.messageId,
  });

  factory SubmitMessageResponse$Data.fromJson(Map<String, dynamic> json) =>
      _$SubmitMessageResponse$DataFromJson(json);

  @JsonKey(name: 'messageId')
  final String messageId;
  static const fromJsonFactory = _$SubmitMessageResponse$DataFromJson;
  static const toJsonFactory = _$SubmitMessageResponse$DataToJson;
  Map<String, dynamic> toJson() => _$SubmitMessageResponse$DataToJson(this);

  @override
  String toString() => jsonEncode(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SubmitMessageResponse$Data &&
            (identical(other.messageId, messageId) ||
                const DeepCollectionEquality()
                    .equals(other.messageId, messageId)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(messageId) ^ runtimeType.hashCode;
}

extension $SubmitMessageResponse$DataExtension on SubmitMessageResponse$Data {
  SubmitMessageResponse$Data copyWith({String? messageId}) {
    return SubmitMessageResponse$Data(messageId: messageId ?? this.messageId);
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

  @JsonKey(name: 'index')
  final String index;
  @JsonKey(name: 'maxResults')
  final int maxResults;
  @JsonKey(name: 'count')
  final int count;
  @JsonKey(name: 'messageIds', defaultValue: <String>[])
  final List<String> messageIds;
  static const fromJsonFactory = _$MessagesFindResponse$DataFromJson;
  static const toJsonFactory = _$MessagesFindResponse$DataToJson;
  Map<String, dynamic> toJson() => _$MessagesFindResponse$DataToJson(this);

  @override
  String toString() => jsonEncode(this);

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
  @JsonKey(name: 'ledgerInclusionState')
  final enums.MessageMetadataResponse$DataLedgerInclusionState?
      ledgerInclusionState;
  @JsonKey(name: 'conflictReason')
  final int? conflictReason;
  @JsonKey(name: 'shouldPromote')
  final bool? shouldPromote;
  @JsonKey(name: 'shouldReattach')
  final bool? shouldReattach;
  static const fromJsonFactory = _$MessageMetadataResponse$DataFromJson;
  static const toJsonFactory = _$MessageMetadataResponse$DataToJson;
  Map<String, dynamic> toJson() => _$MessageMetadataResponse$DataToJson(this);

  @override
  String toString() => jsonEncode(this);

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
}

@JsonSerializable(explicitToJson: true)
class MessageResponse$Data {
  MessageResponse$Data({
    this.allOf,
  });

  factory MessageResponse$Data.fromJson(Map<String, dynamic> json) =>
      _$MessageResponse$DataFromJson(json);

  @JsonKey(name: 'allOf')
  final Message? allOf;
  static const fromJsonFactory = _$MessageResponse$DataFromJson;
  static const toJsonFactory = _$MessageResponse$DataToJson;
  Map<String, dynamic> toJson() => _$MessageResponse$DataToJson(this);

  @override
  String toString() => jsonEncode(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is MessageResponse$Data &&
            (identical(other.allOf, allOf) ||
                const DeepCollectionEquality().equals(other.allOf, allOf)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(allOf) ^ runtimeType.hashCode;
}

extension $MessageResponse$DataExtension on MessageResponse$Data {
  MessageResponse$Data copyWith({Message? allOf}) {
    return MessageResponse$Data(allOf: allOf ?? this.allOf);
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

  @JsonKey(name: 'messageId')
  final String messageId;
  @JsonKey(name: 'maxResults')
  final int maxResults;
  @JsonKey(name: 'count')
  final int count;
  @JsonKey(name: 'childrenMessageIds', defaultValue: <String>[])
  final List<String> childrenMessageIds;
  static const fromJsonFactory = _$MessageChildrenResponse$DataFromJson;
  static const toJsonFactory = _$MessageChildrenResponse$DataToJson;
  Map<String, dynamic> toJson() => _$MessageChildrenResponse$DataToJson(this);

  @override
  String toString() => jsonEncode(this);

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
  static const toJsonFactory = _$OutputResponse$DataToJson;
  Map<String, dynamic> toJson() => _$OutputResponse$DataToJson(this);

  @override
  String toString() => jsonEncode(this);

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
  static const toJsonFactory = _$BalanceAddressResponse$DataToJson;
  Map<String, dynamic> toJson() => _$BalanceAddressResponse$DataToJson(this);

  @override
  String toString() => jsonEncode(this);

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
  static const toJsonFactory = _$OutputsAddressResponse$DataToJson;
  Map<String, dynamic> toJson() => _$OutputsAddressResponse$DataToJson(this);

  @override
  String toString() => jsonEncode(this);

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
}

@JsonSerializable(explicitToJson: true)
class ReceiptsResponse$Data {
  ReceiptsResponse$Data({
    required this.receipts,
  });

  factory ReceiptsResponse$Data.fromJson(Map<String, dynamic> json) =>
      _$ReceiptsResponse$DataFromJson(json);

  @JsonKey(name: 'receipts', defaultValue: <ReceiptTuple>[])
  final List<ReceiptTuple> receipts;
  static const fromJsonFactory = _$ReceiptsResponse$DataFromJson;
  static const toJsonFactory = _$ReceiptsResponse$DataToJson;
  Map<String, dynamic> toJson() => _$ReceiptsResponse$DataToJson(this);

  @override
  String toString() => jsonEncode(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ReceiptsResponse$Data &&
            (identical(other.receipts, receipts) ||
                const DeepCollectionEquality()
                    .equals(other.receipts, receipts)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(receipts) ^ runtimeType.hashCode;
}

extension $ReceiptsResponse$DataExtension on ReceiptsResponse$Data {
  ReceiptsResponse$Data copyWith({List<ReceiptTuple>? receipts}) {
    return ReceiptsResponse$Data(receipts: receipts ?? this.receipts);
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

  @JsonKey(name: 'milestoneId')
  final String milestoneId;
  @JsonKey(name: 'amount')
  final int amount;
  static const fromJsonFactory = _$TreasuryResponse$DataFromJson;
  static const toJsonFactory = _$TreasuryResponse$DataToJson;
  Map<String, dynamic> toJson() => _$TreasuryResponse$DataToJson(this);

  @override
  String toString() => jsonEncode(this);

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

  @JsonKey(name: 'index')
  final int index;
  @JsonKey(name: 'messageId')
  final String messageId;
  @JsonKey(name: 'timestamp')
  final int timestamp;
  static const fromJsonFactory = _$MilestoneResponse$DataFromJson;
  static const toJsonFactory = _$MilestoneResponse$DataToJson;
  Map<String, dynamic> toJson() => _$MilestoneResponse$DataToJson(this);

  @override
  String toString() => jsonEncode(this);

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

  @JsonKey(name: 'index')
  final int index;
  @JsonKey(name: 'createdOutputs', defaultValue: <String>[])
  final List<String> createdOutputs;
  @JsonKey(name: 'consumedOutputs', defaultValue: <String>[])
  final List<String> consumedOutputs;
  static const fromJsonFactory = _$UTXOChangesResponse$DataFromJson;
  static const toJsonFactory = _$UTXOChangesResponse$DataToJson;
  Map<String, dynamic> toJson() => _$UTXOChangesResponse$DataToJson(this);

  @override
  String toString() => jsonEncode(this);

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
}

String? peerRelationToJson(enums.PeerRelation? peerRelation) {
  return enums.$PeerRelationMap[peerRelation];
}

enums.PeerRelation peerRelationFromJson(
  Object? peerRelation, [
  enums.PeerRelation? defaultValue,
]) {
  if (peerRelation is String) {
    return enums.$PeerRelationMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() == peerRelation.toLowerCase(),
            orElse: () =>
                const MapEntry(enums.PeerRelation.swaggerGeneratedUnknown, ''))
        .key;
  }

  final parsedResult = defaultValue == null
      ? null
      : enums.$PeerRelationMap.entries
          .firstWhereOrNull((element) => element.value == defaultValue)
          ?.key;

  return parsedResult ??
      defaultValue ??
      enums.PeerRelation.swaggerGeneratedUnknown;
}

List<String> peerRelationListToJson(List<enums.PeerRelation>? peerRelation) {
  if (peerRelation == null) {
    return [];
  }

  return peerRelation.map((e) => enums.$PeerRelationMap[e]!).toList();
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
  chopper.Response<ResultType> convertResponse<ResultType, Item>(
      chopper.Response response) {
    if (response.bodyString.isEmpty) {
      // In rare cases, when let's say 204 (no content) is returned -
      // we cannot decode the missing json with the result type specified
      return chopper.Response(response.base, null, error: response.error);
    }

    final jsonRes = super.convertResponse(response);
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
