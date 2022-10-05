import 'package:flutter/cupertino.dart';
import 'package:quiz_flutter/base/route.dart';

class OnBoardingProvider extends ChangeNotifier {
  final PageController controller = PageController();

  int currentIndex = 0;

  onChangeIndex(val) {
    currentIndex = val;
    notifyListeners();
  }

  onChangePage(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.homepage);
  }
}
