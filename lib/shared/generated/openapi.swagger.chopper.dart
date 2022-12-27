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
    final String $url = '/health';
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<InfoResponse>> _apiV1InfoGet() {
    final String $url = '/api/v1/info';
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<InfoResponse, InfoResponse>($request);
  }

  @override
  Future<Response<TipsResponse>> _apiV1TipsGet() {
    final String $url = '/api/v1/tips';
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<TipsResponse, TipsResponse>($request);
  }

  @override
  Future<Response<SubmitMessageResponse>> _apiV1MessagesPost(
      {required SubmitMessageRequest? body}) {
    final String $url = '/api/v1/messages';
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<SubmitMessageResponse, SubmitMessageResponse>($request);
  }

  @override
  Future<Response<MessagesFindResponse>> _apiV1MessagesGet(
      {required String? index}) {
    final String $url = '/api/v1/messages';
    final Map<String, dynamic> $params = <String, dynamic>{'index': index};
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<MessagesFindResponse, MessagesFindResponse>($request);
  }

  @override
  Future<Response<MessageResponse>> _apiV1MessagesMessageIdGet(
      {required String? messageId}) {
    final String $url = '/api/v1/messages/${messageId}';
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<MessageResponse, MessageResponse>($request);
  }

  @override
  Future<Response<MessageMetadataResponse>> _apiV1MessagesMessageIdMetadataGet(
      {required String? messageId}) {
    final String $url = '/api/v1/messages/${messageId}/metadata';
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client
        .send<MessageMetadataResponse, MessageMetadataResponse>($request);
  }

  @override
  Future<Response<String>> _apiV1MessagesMessageIdRawGet(
      {required String? messageId}) {
    final String $url = '/api/v1/messages/${messageId}/raw';
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<String, String>($request);
  }

  @override
  Future<Response<MessageChildrenResponse>> _apiV1MessagesMessageIdChildrenGet(
      {required String? messageId}) {
    final String $url = '/api/v1/messages/${messageId}/children';
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client
        .send<MessageChildrenResponse, MessageChildrenResponse>($request);
  }

  @override
  Future<Response<OutputResponse>> _apiV1OutputsOutputIdGet(
      {required String? outputId}) {
    final String $url = '/api/v1/outputs/${outputId}';
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<OutputResponse, OutputResponse>($request);
  }

  @override
  Future<Response<BalanceAddressResponse>> _apiV1AddressesAddressGet(
      {required String? address}) {
    final String $url = '/api/v1/addresses/${address}';
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client
        .send<BalanceAddressResponse, BalanceAddressResponse>($request);
  }

  @override
  Future<Response<BalanceAddressResponse>> _apiV1AddressesEd25519AddressGet(
      {required String? address}) {
    final String $url = '/api/v1/addresses/ed25519/${address}';
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client
        .send<BalanceAddressResponse, BalanceAddressResponse>($request);
  }

  @override
  Future<Response<OutputsAddressResponse>> _apiV1AddressesAddressOutputsGet({
    required String? address,
    bool? includeSpent,
    int? type,
  }) {
    final String $url = '/api/v1/addresses/${address}/outputs';
    final Map<String, dynamic> $params = <String, dynamic>{
      'include-spent': includeSpent,
      'type': type,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client
        .send<OutputsAddressResponse, OutputsAddressResponse>($request);
  }

  @override
  Future<Response<OutputsAddressResponse>>
      _apiV1AddressesEd25519AddressOutputsGet({
    required String? address,
    bool? includeSpent,
    int? type,
  }) {
    final String $url = '/api/v1/addresses/ed25519/${address}/outputs';
    final Map<String, dynamic> $params = <String, dynamic>{
      'include-spent': includeSpent,
      'type': type,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client
        .send<OutputsAddressResponse, OutputsAddressResponse>($request);
  }

  @override
  Future<Response<ReceiptsResponse>> _apiV1ReceiptsGet() {
    final String $url = '/api/v1/receipts';
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<ReceiptsResponse, ReceiptsResponse>($request);
  }

  @override
  Future<Response<ReceiptsResponse>> _apiV1ReceiptsMigratedAtGet(
      {required num? migratedAt}) {
    final String $url = '/api/v1/receipts/${migratedAt}';
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<ReceiptsResponse, ReceiptsResponse>($request);
  }

  @override
  Future<Response<TreasuryResponse>> _apiV1TreasuryGet() {
    final String $url = '/api/v1/treasury';
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<TreasuryResponse, TreasuryResponse>($request);
  }

  @override
  Future<Response<MessageResponse>>
      _apiV1TransactionsTransactionIdIncludedMessageGet(
          {required String? transactionId}) {
    final String $url =
        '/api/v1/transactions/${transactionId}/included-message';
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<MessageResponse, MessageResponse>($request);
  }

  @override
  Future<Response<MilestoneResponse>> _apiV1MilestonesIndexGet(
      {required num? index}) {
    final String $url = '/api/v1/milestones/${index}';
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<MilestoneResponse, MilestoneResponse>($request);
  }

  @override
  Future<Response<UTXOChangesResponse>> _apiV1MilestonesIndexUtxoChangesGet(
      {required num? index}) {
    final String $url = '/api/v1/milestones/${index}/utxo-changes';
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<UTXOChangesResponse, UTXOChangesResponse>($request);
  }

  @override
  Future<Response<PeersResponse>> _apiV1PeersGet() {
    final String $url = '/api/v1/peers';
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<PeersResponse, PeersResponse>($request);
  }

  @override
  Future<Response<AddPeerResponse>> _apiV1PeersPost(
      {required AddPeerRequest? body}) {
    final String $url = '/api/v1/peers';
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<AddPeerResponse, AddPeerResponse>($request);
  }

  @override
  Future<Response<PeerResponse>> _apiV1PeersPeerIdGet(
      {required String? peerId}) {
    final String $url = '/api/v1/peers/${peerId}';
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<PeerResponse, PeerResponse>($request);
  }

  @override
  Future<Response<dynamic>> _apiV1PeersPeerIdDelete({required String? peerId}) {
    final String $url = '/api/v1/peers/${peerId}';
    final Request $request = Request(
      'DELETE',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }
}
