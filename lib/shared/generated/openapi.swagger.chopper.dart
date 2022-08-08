//Generated code

part of 'openapi.swagger.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$Openapi extends Openapi {
  _$Openapi([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = Openapi;

  @override
  Future<Response<dynamic>> _healthGet() {
    final $url = '/health';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<InfoResponse>> _apiV1InfoGet() {
    final $url = '/api/v1/info';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<InfoResponse, InfoResponse>($request);
  }

  @override
  Future<Response<TipsResponse>> _apiV1TipsGet() {
    final $url = '/api/v1/tips';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<TipsResponse, TipsResponse>($request);
  }

  @override
  Future<Response<SubmitMessageResponse>> _apiV1MessagesPost(
      {required SubmitMessageRequest? body}) {
    final $url = '/api/v1/messages';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<SubmitMessageResponse, SubmitMessageResponse>($request);
  }

  @override
  Future<Response<MessagesFindResponse>> _apiV1MessagesGet(
      {required String? index}) {
    final $url = '/api/v1/messages';
    final $params = <String, dynamic>{'index': index};
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<MessagesFindResponse, MessagesFindResponse>($request);
  }

  @override
  Future<Response<MessageResponse>> _apiV1MessagesMessageIdGet(
      {required String? messageId}) {
    final $url = '/api/v1/messages/${messageId}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<MessageResponse, MessageResponse>($request);
  }

  @override
  Future<Response<MessageMetadataResponse>> _apiV1MessagesMessageIdMetadataGet(
      {required String? messageId}) {
    final $url = '/api/v1/messages/${messageId}/metadata';
    final $request = Request('GET', $url, client.baseUrl);
    return client
        .send<MessageMetadataResponse, MessageMetadataResponse>($request);
  }

  @override
  Future<Response<String>> _apiV1MessagesMessageIdRawGet(
      {required String? messageId}) {
    final $url = '/api/v1/messages/${messageId}/raw';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<String, String>($request);
  }

  @override
  Future<Response<MessageChildrenResponse>> _apiV1MessagesMessageIdChildrenGet(
      {required String? messageId}) {
    final $url = '/api/v1/messages/${messageId}/children';
    final $request = Request('GET', $url, client.baseUrl);
    return client
        .send<MessageChildrenResponse, MessageChildrenResponse>($request);
  }

  @override
  Future<Response<OutputResponse>> _apiV1OutputsOutputIdGet(
      {required String? outputId}) {
    final $url = '/api/v1/outputs/${outputId}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<OutputResponse, OutputResponse>($request);
  }

  @override
  Future<Response<BalanceAddressResponse>> _apiV1AddressesAddressGet(
      {required String? address}) {
    final $url = '/api/v1/addresses/${address}';
    final $request = Request('GET', $url, client.baseUrl);
    return client
        .send<BalanceAddressResponse, BalanceAddressResponse>($request);
  }

  @override
  Future<Response<BalanceAddressResponse>> _apiV1AddressesEd25519AddressGet(
      {required String? address}) {
    final $url = '/api/v1/addresses/ed25519/${address}';
    final $request = Request('GET', $url, client.baseUrl);
    return client
        .send<BalanceAddressResponse, BalanceAddressResponse>($request);
  }

  @override
  Future<Response<OutputsAddressResponse>> _apiV1AddressesAddressOutputsGet(
      {required String? address, bool? includeSpent, int? type}) {
    final $url = '/api/v1/addresses/${address}/outputs';
    final $params = <String, dynamic>{
      'include-spent': includeSpent,
      'type': type
    };
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client
        .send<OutputsAddressResponse, OutputsAddressResponse>($request);
  }

  @override
  Future<Response<OutputsAddressResponse>>
      _apiV1AddressesEd25519AddressOutputsGet(
          {required String? address, bool? includeSpent, int? type}) {
    final $url = '/api/v1/addresses/ed25519/${address}/outputs';
    final $params = <String, dynamic>{
      'include-spent': includeSpent,
      'type': type
    };
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client
        .send<OutputsAddressResponse, OutputsAddressResponse>($request);
  }

  @override
  Future<Response<ReceiptsResponse>> _apiV1ReceiptsGet() {
    final $url = '/api/v1/receipts';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<ReceiptsResponse, ReceiptsResponse>($request);
  }

  @override
  Future<Response<ReceiptsResponse>> _apiV1ReceiptsMigratedAtGet(
      {required num? migratedAt}) {
    final $url = '/api/v1/receipts/${migratedAt}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<ReceiptsResponse, ReceiptsResponse>($request);
  }

  @override
  Future<Response<TreasuryResponse>> _apiV1TreasuryGet() {
    final $url = '/api/v1/treasury';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<TreasuryResponse, TreasuryResponse>($request);
  }

  @override
  Future<Response<MessageResponse>>
      _apiV1TransactionsTransactionIdIncludedMessageGet(
          {required String? transactionId}) {
    final $url = '/api/v1/transactions/${transactionId}/included-message';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<MessageResponse, MessageResponse>($request);
  }

  @override
  Future<Response<MilestoneResponse>> _apiV1MilestonesIndexGet(
      {required num? index}) {
    final $url = '/api/v1/milestones/${index}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<MilestoneResponse, MilestoneResponse>($request);
  }

  @override
  Future<Response<UTXOChangesResponse>> _apiV1MilestonesIndexUtxoChangesGet(
      {required num? index}) {
    final $url = '/api/v1/milestones/${index}/utxo-changes';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<UTXOChangesResponse, UTXOChangesResponse>($request);
  }

  @override
  Future<Response<PeersResponse>> _apiV1PeersGet() {
    final $url = '/api/v1/peers';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<PeersResponse, PeersResponse>($request);
  }

  @override
  Future<Response<AddPeerResponse>> _apiV1PeersPost(
      {required AddPeerRequest? body}) {
    final $url = '/api/v1/peers';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<AddPeerResponse, AddPeerResponse>($request);
  }

  @override
  Future<Response<PeerResponse>> _apiV1PeersPeerIdGet(
      {required String? peerId}) {
    final $url = '/api/v1/peers/${peerId}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<PeerResponse, PeerResponse>($request);
  }

  @override
  Future<Response<dynamic>> _apiV1PeersPeerIdDelete({required String? peerId}) {
    final $url = '/api/v1/peers/${peerId}';
    final $request = Request('DELETE', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }
}
