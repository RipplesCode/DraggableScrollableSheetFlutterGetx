import 'package:get/get.dart';

class HomeController extends GetxController {
  List<bool> selected = List.generate(40, (i) => false).obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
