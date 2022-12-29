import 'package:floor/floor.dart';

@entity
class ProjectMaster {
  @PrimaryKey(autoGenerate: true)
  int? id;

  // String projectName, address, contactNumber, email;
  String projectName, address;

  // ProjectMaster({
  //   required this.id,
  //   required this.projectName,
  //   required this.contactNumber,
  //   required this.address,
  //   required this.email,
  // });
  ProjectMaster({
    this.id,
    required this.projectName,
    required this.address,
  });
}
