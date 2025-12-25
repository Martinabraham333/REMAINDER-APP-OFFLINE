import 'package:hive/hive.dart';
import 'package:remainder_app_offline/data/models/remainder_model.dart';

class RemainderService {
  static const String boxName='remainders';



  Future<void> addRemainder(RemainderModel remainder)async{
 final box =Hive.box<RemainderModel>(boxName);
 await box.add(remainder);
  }

List<RemainderModel> getRemainders(){
  final box=Hive.box<RemainderModel>(boxName);
  return box.values.toList();
}

 Future<void> deleteReminder(int index) async {
    final box = Hive.box<RemainderModel>(boxName);
    await box.deleteAt(index);
  }

}