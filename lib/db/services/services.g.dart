// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'services.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  PartyDao? _partyDaoInstance;

  ProjectDao? _projectDaoInstance;

  WhatsAppDao? _whatsAppDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `PartyMaster` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `projectId` INTEGER NOT NULL, `partyName` TEXT NOT NULL, `partyAddress` TEXT NOT NULL, `partyContact` TEXT NOT NULL, `partyEmail` TEXT NOT NULL, FOREIGN KEY (`projectId`) REFERENCES `ProjectMaster` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `ProjectMaster` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `projectName` TEXT NOT NULL, `address` TEXT NOT NULL)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `WhatsApp` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `contactName` TEXT NOT NULL, `message` TEXT NOT NULL)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  PartyDao get partyDao {
    return _partyDaoInstance ??= _$PartyDao(database, changeListener);
  }

  @override
  ProjectDao get projectDao {
    return _projectDaoInstance ??= _$ProjectDao(database, changeListener);
  }

  @override
  WhatsAppDao get whatsAppDao {
    return _whatsAppDaoInstance ??= _$WhatsAppDao(database, changeListener);
  }
}

class _$PartyDao extends PartyDao {
  _$PartyDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database, changeListener),
        _partyMasterInsertionAdapter = InsertionAdapter(
            database,
            'PartyMaster',
            (PartyMaster item) => <String, Object?>{
                  'id': item.id,
                  'projectId': item.projectId,
                  'partyName': item.partyName,
                  'partyAddress': item.partyAddress,
                  'partyContact': item.partyContact,
                  'partyEmail': item.partyEmail
                },
            changeListener),
        _partyMasterUpdateAdapter = UpdateAdapter(
            database,
            'PartyMaster',
            ['id'],
            (PartyMaster item) => <String, Object?>{
                  'id': item.id,
                  'projectId': item.projectId,
                  'partyName': item.partyName,
                  'partyAddress': item.partyAddress,
                  'partyContact': item.partyContact,
                  'partyEmail': item.partyEmail
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<PartyMaster> _partyMasterInsertionAdapter;

  final UpdateAdapter<PartyMaster> _partyMasterUpdateAdapter;

  @override
  Future<List<PartyMaster>> findAllPersons() async {
    return _queryAdapter.queryList('SELECT * FROM PartyMaster',
        mapper: (Map<String, Object?> row) => PartyMaster(
            id: row['id'] as int?,
            projectId: row['projectId'] as int,
            partyName: row['partyName'] as String,
            partyContact: row['partyContact'] as String,
            partyEmail: row['partyEmail'] as String,
            partyAddress: row['partyAddress'] as String));
  }

  @override
  Stream<PartyMaster?> findPartyById(int id) {
    return _queryAdapter.queryStream('SELECT * FROM PartyMaster WHERE id = ?1',
        mapper: (Map<String, Object?> row) => PartyMaster(
            id: row['id'] as int?,
            projectId: row['projectId'] as int,
            partyName: row['partyName'] as String,
            partyContact: row['partyContact'] as String,
            partyEmail: row['partyEmail'] as String,
            partyAddress: row['partyAddress'] as String),
        arguments: [id],
        queryableName: 'PartyMaster',
        isView: false);
  }

  @override
  Future<void> insertParty(PartyMaster partyMaster) async {
    await _partyMasterInsertionAdapter.insert(
        partyMaster, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateParty(PartyMaster partyMaster) async {
    await _partyMasterUpdateAdapter.update(
        partyMaster, OnConflictStrategy.abort);
  }
}

class _$ProjectDao extends ProjectDao {
  _$ProjectDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database, changeListener),
        _projectMasterInsertionAdapter = InsertionAdapter(
            database,
            'ProjectMaster',
            (ProjectMaster item) => <String, Object?>{
                  'id': item.id,
                  'projectName': item.projectName,
                  'address': item.address
                },
            changeListener),
        _projectMasterUpdateAdapter = UpdateAdapter(
            database,
            'ProjectMaster',
            ['id'],
            (ProjectMaster item) => <String, Object?>{
                  'id': item.id,
                  'projectName': item.projectName,
                  'address': item.address
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<ProjectMaster> _projectMasterInsertionAdapter;

  final UpdateAdapter<ProjectMaster> _projectMasterUpdateAdapter;

  @override
  Future<List<ProjectMaster>> findAllPersons() async {
    return _queryAdapter.queryList('SELECT * FROM ProjectMaster',
        mapper: (Map<String, Object?> row) => ProjectMaster(
            id: row['id'] as int?,
            projectName: row['projectName'] as String,
            address: row['address'] as String));
  }

  @override
  Stream<ProjectMaster?> findProjectById(int id) {
    return _queryAdapter.queryStream(
        'SELECT * FROM ProjectMaster WHERE id = ?1',
        mapper: (Map<String, Object?> row) => ProjectMaster(
            id: row['id'] as int?,
            projectName: row['projectName'] as String,
            address: row['address'] as String),
        arguments: [id],
        queryableName: 'ProjectMaster',
        isView: false);
  }

  @override
  Future<void> insertProject(ProjectMaster projectMaster) async {
    await _projectMasterInsertionAdapter.insert(
        projectMaster, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateProject(ProjectMaster partyMaster) async {
    await _projectMasterUpdateAdapter.update(
        partyMaster, OnConflictStrategy.abort);
  }
}

class _$WhatsAppDao extends WhatsAppDao {
  _$WhatsAppDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _whatsAppInsertionAdapter = InsertionAdapter(
            database,
            'WhatsApp',
            (WhatsApp item) => <String, Object?>{
                  'id': item.id,
                  'contactName': item.contactName,
                  'message': item.message
                }),
        _whatsAppUpdateAdapter = UpdateAdapter(
            database,
            'WhatsApp',
            ['id'],
            (WhatsApp item) => <String, Object?>{
                  'id': item.id,
                  'contactName': item.contactName,
                  'message': item.message
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<WhatsApp> _whatsAppInsertionAdapter;

  final UpdateAdapter<WhatsApp> _whatsAppUpdateAdapter;

  @override
  Future<List<WhatsApp>> selectAllWhatsAppData() async {
    return _queryAdapter.queryList('SELECT * FROM WhatsApp',
        mapper: (Map<String, Object?> row) => WhatsApp(
            id: row['id'] as int?,
            contactName: row['contactName'] as String,
            message: row['message'] as String));
  }

  @override
  Future<void> deleteWhatsAppById(int id) async {
    await _queryAdapter
        .queryNoReturn('DELETE FROM WhatsApp where id=?1', arguments: [id]);
  }

  @override
  Future<void> insertWhatsApp(WhatsApp whatsApp) async {
    await _whatsAppInsertionAdapter.insert(whatsApp, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateWhatsApp(WhatsApp whatsApp) async {
    await _whatsAppUpdateAdapter.update(whatsApp, OnConflictStrategy.abort);
  }
}
