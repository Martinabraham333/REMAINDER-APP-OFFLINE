import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:remainder_app_offline/controllers/remainder_controllers.dart';
import 'package:remainder_app_offline/data/services/remainder_service.dart';

class RemainderBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RemainderServices>(() => RemainderServices(),fenix: true);
    Get.lazyPut<RemainderControllers>(() => RemainderControllers(Get.find()));
  }
}
