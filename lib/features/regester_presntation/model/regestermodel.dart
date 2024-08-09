import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';

part 'regestermodel.g.dart';

@HiveType(typeId: 1)
class RegisterLogin extends HiveObject {
  @HiveField(0)
  final XFile?  pic;

  @HiveField(1)
  final String? name;

  RegisterLogin({
    required this.pic,
    required this.name,
  });
}