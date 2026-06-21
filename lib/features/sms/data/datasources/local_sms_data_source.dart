import 'package:drift/drift.dart';

import '../../../../core/database/app_database.dart';
import '../../domain/entities/harvested_sms.dart';

class LocalSmsDataSource {
  LocalSmsDataSource(this._database);

  final AppDatabase _database;

  Future<List<HarvestedSms>> readAll() async {
    final query = _database.select(_database.smsMessages)
      ..orderBy([
        (table) => OrderingTerm(
              expression: table.dateMillis,
              mode: OrderingMode.desc,
            ),
      ]);
    final rows = await query.get();
    return rows.map(_toEntity).toList(growable: false);
  }

  Future<int> upsertMany(Iterable<HarvestedSms> messages) async {
    var inserted = 0;

    await _database.transaction(() async {
      for (final message in messages) {
        final existing = await _findExisting(message);
        if (existing == null) {
          await _database.into(_database.smsMessages).insert(_toInsert(message));
          inserted++;
        } else {
          await (_database.update(_database.smsMessages)
                ..where((table) => table.id.equals(existing.id)))
              .write(_toUpdate(message));
        }
      }
    });

    return inserted;
  }

  Future<SmsMessageRow?> _findExisting(HarvestedSms message) async {
    if (message.providerId != null) {
      final byProviderId = await (_database.select(_database.smsMessages)
            ..where((table) => table.providerId.equals(message.providerId!)))
          .getSingleOrNull();
      if (byProviderId != null) return byProviderId;
    }

    return (_database.select(_database.smsMessages)
          ..where((table) => table.fingerprint.equals(message.fingerprint)))
        .getSingleOrNull();
  }

  SmsMessagesCompanion _toInsert(HarvestedSms message) {
    return SmsMessagesCompanion.insert(
      body: message.body,
      dateMillis: message.dateMillis,
      fingerprint: message.fingerprint,
      providerId: Value(message.providerId),
      threadId: Value(message.threadId),
      address: Value(message.address),
      dateSentMillis: Value(message.dateSentMillis),
      type: Value(message.type),
      read: Value(message.read),
      seen: Value(message.seen),
      status: Value(message.status),
      serviceCenter: Value(message.serviceCenter),
      protocol: Value(message.protocol),
      subject: Value(message.subject),
      replyPathPresent: Value(message.replyPathPresent),
      locked: Value(message.locked),
      errorCode: Value(message.errorCode),
      creator: Value(message.creator),
      subscriptionId: Value(message.subscriptionId),
      syncStatus: Value(SmsSyncStatus.pending.name),
    );
  }

  SmsMessagesCompanion _toUpdate(HarvestedSms message) {
    return SmsMessagesCompanion(
      providerId: Value(message.providerId),
      threadId: Value(message.threadId),
      address: Value(message.address),
      body: Value(message.body),
      dateMillis: Value(message.dateMillis),
      dateSentMillis: Value(message.dateSentMillis),
      type: Value(message.type),
      read: Value(message.read),
      seen: Value(message.seen),
      status: Value(message.status),
      serviceCenter: Value(message.serviceCenter),
      protocol: Value(message.protocol),
      subject: Value(message.subject),
      replyPathPresent: Value(message.replyPathPresent),
      locked: Value(message.locked),
      errorCode: Value(message.errorCode),
      creator: Value(message.creator),
      subscriptionId: Value(message.subscriptionId),
      fingerprint: Value(message.fingerprint),
      updatedAt: Value(DateTime.now()),
    );
  }

  HarvestedSms _toEntity(SmsMessageRow row) {
    return HarvestedSms(
      providerId: row.providerId,
      threadId: row.threadId,
      address: row.address,
      body: row.body,
      dateMillis: row.dateMillis,
      dateSentMillis: row.dateSentMillis,
      type: row.type,
      read: row.read,
      seen: row.seen,
      status: row.status,
      serviceCenter: row.serviceCenter,
      protocol: row.protocol,
      subject: row.subject,
      replyPathPresent: row.replyPathPresent,
      locked: row.locked,
      errorCode: row.errorCode,
      creator: row.creator,
      subscriptionId: row.subscriptionId,
      fingerprint: row.fingerprint,
    );
  }
}
