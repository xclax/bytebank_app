import 'dart:convert';

import 'package:bytebank_app/models/contact.dart';
import 'package:bytebank_app/models/transaction.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';

class Webclient {
  Client client = InterceptedClient.build(interceptors: [
    LoggingInterceptor(),
  ]);

  Future<List<Transaction>> findAll() async {
    Response response =
        await client.get(Uri.parse('http://192.168.15.46:8080/transactions'));

    final List<Transaction> transactionList = [];
    final List<dynamic> jsonDecoded = jsonDecode(response.body);

    for (Map<String, dynamic> element in jsonDecoded) {
      final Transaction transaction = Transaction(
          value: element['value'],
          contact: Contact(
              name: element['contact']['name'],
              accountNumber: element['contact']['accountNumber']));
      transactionList.add(transaction);
    }
    return transactionList;
  }
}

class LoggingInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    print(data);
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async {
    print(data);
    return data;
  }
}
