import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:remainder_app_offline/features/remainder/model/remainder_model.dart';

class RemainderControllers extends GetxController {
  late Box<RemainderModel> _box;
  static const String boxName = 'remainders';
  final remainders = <RemainderModel>[].obs;
  
  @override
  void onInit() {
    _box = Hive.box<RemainderModel>(boxName);
    loadRemainders();
    super.onInit();
  }

  void loadRemainders() {
    remainders.value = _box.values.toList();
  }

  Future<void> addRemainders(RemainderModel remainder) async {
    final box = Hive.box<RemainderModel>(boxName);
    await box.add(remainder);
    loadRemainders();
  }

  Future<void> updateRemainders(
    int key,
    RemainderModel updatedRemainder,
  ) async {
    final box = Hive.box<RemainderModel>(boxName);
    await box.put(key, updatedRemainder);
    loadRemainders();
  }

  Future<void> deleteRemainders(int key) async {
    final box = Hive.box<RemainderModel>(boxName);
    await box.delete(key);
    loadRemainders();
  }
}
