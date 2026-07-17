import 'package:file_picker/file_picker.dart';

class ProjectAddItem {
  final int index;
  final String name;
  final int type;
  final String description;
  final String link;
  final String company;
  final List<String> technology;
  final List<PlatformFile> files;
  ProjectAddItem({
    required this.index,
    required this.name,
    required this.type,
    required this.description,
    required this.link,
    required this.company,
    required this.technology,
    required this.files,
  });
}
