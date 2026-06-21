import 'package:drift/drift.dart';

import 'connection/connection.dart';

part 'app_database.g.dart';

enum SmsSyncStatus {
  pending,
  synced,
  failed,
}

@DataClassName('SmsMessageRow')
class SmsMessages extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get providerId => integer().nullable()();
  IntColumn get threadId => integer().nullable()();
  TextColumn get address => text().nullable()();
  TextColumn get body => text()();
  IntColumn get dateMillis => integer()();
  IntColumn get dateSentMillis => integer().nullable()();
  TextColumn get type => text().withDefault(const Constant('inbox'))();
  BoolColumn get read => boolean().nullable()();
  BoolColumn get seen => boolean().nullable()();
  IntColumn get status => integer().nullable()();
  TextColumn get serviceCenter => text().nullable()();
  IntColumn get protocol => integer().nullable()();
  TextColumn get subject => text().nullable()();
  BoolColumn get replyPathPresent => boolean().nullable()();
  BoolColumn get locked => boolean().nullable()();
  IntColumn get errorCode => integer().nullable()();
  TextColumn get creator => text().nullable()();
  IntColumn get subscriptionId => integer().nullable()();
  TextColumn get fingerprint => text()();
  TextColumn get syncStatus => text().withDefault(const Constant('pending'))();
  TextColumn get serverId => text().nullable()();
  IntColumn get lastSyncAttemptAtMillis => integer().nullable()();
  TextColumn get syncError => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
}

@DriftDatabase(tables: [SmsMessages])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        beforeOpen: (_) async {
          await customStatement(
            'CREATE UNIQUE INDEX IF NOT EXISTS sms_messages_provider_id_unique '
            'ON sms_messages(provider_id) WHERE provider_id IS NOT NULL',
          );
          await customStatement(
            'CREATE UNIQUE INDEX IF NOT EXISTS sms_messages_fingerprint_unique '
            'ON sms_messages(fingerprint)',
          );
        },
      );
}
