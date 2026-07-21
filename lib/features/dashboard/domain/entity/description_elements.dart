import 'package:file_picker/file_picker.dart';

class DescriptionItem {
  int type;
  String? text;
  PlatformFile? file;
  double? width, height;
  DescriptionItem({
    required this.type,
    this.text,
    this.file,
    this.width,
    this.height,
  });
}
