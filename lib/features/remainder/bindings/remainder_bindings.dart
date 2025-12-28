import 'package:get/get.dart';

import 'package:remainder_app_offline/features/remainder/controller/remainder_controllers.dart';


class RemainderBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RemainderControllers>(() => RemainderControllers());
  }
}
