import 'package:hive/hive.dart';
import 'package:remainder_app_offline/data/models/remainder_model.dart';

class RemainderServices {
  static const String boxName = 'remainders';

  Future<void> addRemainder(RemainderModel remainder) async {
    final box = Hive.box<RemainderModel>(boxName);
    await box.add(remainder);
    print(box.values.toList()[0].title);
  }

  List<RemainderModel> getRemainders() {
    final box = Hive.box<RemainderModel>(boxName);
    return box.values.toList();
  }

  Future<void> updateRemainders(
    int index,
    RemainderModel updatedRemainder,
  ) async {
    final box = Hive.box<RemainderModel>(boxName);
    await box.putAt(index, updatedRemainder);
  }

  Future<void> deleteReminder(int index) async {
    final box = Hive.box<RemainderModel>(boxName);
    await box.deleteAt(index);
  }
}
