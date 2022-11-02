import 'package:flutter/cupertino.dart';
import 'package:flutter_exam/api/app_api.dart';

class PurchasesPageProvider extends ChangeNotifier {
  PurchasesPageProvider() {
    getData();
  }

  List purchases = [];
  bool isLoading = false;

  getData() async {
    isLoading = true;
    final result = await AppApi().purchases.getPurchasesData();

    purchases = result;
    isLoading = false;
    notifyListeners();

    return purchases;
  }
}
