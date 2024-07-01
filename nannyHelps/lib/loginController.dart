import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class LoginController extends GetxController {
  RxBool visible = false.obs;
  isChange() {
    visible.value = !visible.value;
  }
}