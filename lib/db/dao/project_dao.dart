import 'package:floor/floor.dart';
import 'package:floor_database_demo_sqlite/models/project_model.dart';

@dao
abstract class ProjectDao {
  @Query('SELECT * FROM ProjectMaster')
  Future<List<ProjectMaster>> findAllPersons();

  @Query('SELECT * FROM ProjectMaster WHERE id = :id')
  Stream<ProjectMaster?> findProjectById(int id);

  @insert
  Future<void> insertProject(ProjectMaster projectMaster);

  @update
  Future<void> updateProject(ProjectMaster partyMaster);
}
