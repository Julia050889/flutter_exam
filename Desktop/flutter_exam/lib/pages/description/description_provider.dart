import 'package:flutter/cupertino.dart';
import 'package:flutter_exam/base/route.dart';

class DescriptionPageProvider extends ChangeNotifier {
  PageController controller = PageController();
  int currentIndex = 0;

  onChangeIndex(index) {
    currentIndex = index;
    notifyListeners();
  }

  onChangePage(index) {
    controller.animateToPage(index,
        duration: const Duration(milliseconds: 800), curve: Curves.easeIn);
  }

  onLogin(context) {
    Navigator.pushNamed(context, AppRoutes.homepage);
  }
}
