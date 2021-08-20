import 'dart:convert';

import 'package:bytebank_app/models/transaction.dart';
import 'package:bytebank_app/network/webclient.dart';
import 'package:http/http.dart';

class TransactionWebClient {
  static const String baseUrl = 'http://192.168.15.46:8080/';
  static const String transactionEndpoint = 'transactions';
  Webclient _webclient = Webclient();

  Future<List<Transaction>> findAll() async {
    Response response =
        await _webclient.client.get(Uri.parse(baseUrl + transactionEndpoint));

    List<Transaction> transactionList = decodeJsonToTransactionsList(response);
    return transactionList;
  }

  Future<Transaction> save(Transaction transaction) async {
    final String transactionJson = jsonEncode(transaction.toJson());

    final Response response = await _webclient.client.post(
        Uri.parse(baseUrl + transactionEndpoint),
        headers: {'Content-type': 'application/json', 'password': '1000'},
        body: transactionJson);

    return decodeJsonToTransaction(response);
  }

  Transaction decodeJsonToTransaction(Response jsonResponse) {
    final Map<String, dynamic> jsonDecoded = jsonDecode(jsonResponse.body);
    return Transaction.fromJson(jsonDecoded);
  }

  List<Transaction> decodeJsonToTransactionsList(Response jsonResponse) {
    final List<dynamic> jsonDecoded = jsonDecode(jsonResponse.body);
    final List<Transaction> transactionList =
        jsonDecoded.map((json) => Transaction.fromJson(json)).toList();

    return transactionList;
  }
}
