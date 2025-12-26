import 'package:get/get.dart';
import 'package:remainder_app_offline/data/models/remainder_model.dart';
import 'package:remainder_app_offline/data/services/remainder_service.dart';

class RemainderControllers extends GetxController {
  final RemainderServices service;
  RemainderControllers(this.service);
  final remainders = <RemainderModel>[].obs;

  void loadRemainders() {
    remainders.value = service.getRemainders();
  }

  Future<void> addRemainders(RemainderModel remainder) async {
    await service.addRemainder(remainder);
    loadRemainders();
  }
  Future<void> updateRemainders(int index, RemainderModel remainder) async {
    await service.updateRemainders(index,remainder);
    loadRemainders();
  }
  Future<void> deleteRemainders(int index) async {
    await service.deleteReminder(index);
    loadRemainders();
  }


}
