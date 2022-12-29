import 'package:floor/floor.dart';
import 'package:floor_database_demo_sqlite/models/party_model.dart';

@dao
abstract class PartyDao {
  @Query('SELECT * FROM PartyMaster')
  Future<List<PartyMaster>> findAllPersons();

  @Query('SELECT * FROM PartyMaster WHERE id = :id')
  Stream<PartyMaster?> findPartyById(int id);

  @insert
  Future<void> insertParty(PartyMaster partyMaster);

  @update
  Future<void> updateParty(PartyMaster partyMaster);
}
