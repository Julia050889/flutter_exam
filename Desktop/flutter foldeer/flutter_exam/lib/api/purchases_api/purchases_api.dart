import 'package:dio/dio.dart';
import 'package:flutter_exam/models/puchases/purchases_model.dart';

class PurchasesApi {
  final Dio appDioClient;

  PurchasesApi(
    this.appDioClient,
  );

  Future<List<PurchasesModel>> getPurchasesData() async {
    List<PurchasesModel> purchases = [];

    final result = await appDioClient.get(
      'https://my-json-server.typicode.com/narekpog/my-json/purchases',
    );

    if (result.data is List) {
      purchases = result.data.first
          .map<PurchasesModel>(
            (e) => PurchasesModel.fromJson(e),
          )
          .toList();
    }
    return purchases;
  }
}
