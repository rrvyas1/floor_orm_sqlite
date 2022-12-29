import 'package:floor/floor.dart';
import 'package:floor_database_demo_sqlite/models/project_model.dart';

@Entity(
  tableName: 'PartyMaster',
  foreignKeys: [
    ForeignKey(
      childColumns: ['projectId'],
      parentColumns: ['id'],
      entity: ProjectMaster,
    )
  ],
)
class PartyMaster {
  @PrimaryKey(autoGenerate: true)
  int? id;
  int projectId;
  String partyName, partyAddress, partyContact, partyEmail;

  PartyMaster({
    this.id,
    required this.projectId,
    required this.partyName,
    required this.partyContact,
    required this.partyEmail,
    required this.partyAddress,
  });
}
