import 'package:hive/hive.dart';

part 'remainder_model.g.dart';

@HiveType(typeId: 0)
class RemainderModel extends HiveObject {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String description;
  @HiveField(2)
  final String datetime;

  RemainderModel({
    required this.title,
    required this.description,
    required this.datetime,
  });
}
