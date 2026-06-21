// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $SmsMessagesTable extends SmsMessages
    with TableInfo<$SmsMessagesTable, SmsMessageRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SmsMessagesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _providerIdMeta = const VerificationMeta(
    'providerId',
  );
  @override
  late final GeneratedColumn<int> providerId = GeneratedColumn<int>(
    'provider_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _threadIdMeta = const VerificationMeta(
    'threadId',
  );
  @override
  late final GeneratedColumn<int> threadId = GeneratedColumn<int>(
    'thread_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _addressMeta = const VerificationMeta(
    'address',
  );
  @override
  late final GeneratedColumn<String> address = GeneratedColumn<String>(
    'address',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _bodyMeta = const VerificationMeta('body');
  @override
  late final GeneratedColumn<String> body = GeneratedColumn<String>(
    'body',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dateMillisMeta = const VerificationMeta(
    'dateMillis',
  );
  @override
  late final GeneratedColumn<int> dateMillis = GeneratedColumn<int>(
    'date_millis',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dateSentMillisMeta = const VerificationMeta(
    'dateSentMillis',
  );
  @override
  late final GeneratedColumn<int> dateSentMillis = GeneratedColumn<int>(
    'date_sent_millis',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
    'type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('inbox'),
  );
  static const VerificationMeta _readMeta = const VerificationMeta('read');
  @override
  late final GeneratedColumn<bool> read = GeneratedColumn<bool>(
    'read',
    aliasedName,
    true,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("read" IN (0, 1))',
    ),
  );
  static const VerificationMeta _seenMeta = const VerificationMeta('seen');
  @override
  late final GeneratedColumn<bool> seen = GeneratedColumn<bool>(
    'seen',
    aliasedName,
    true,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("seen" IN (0, 1))',
    ),
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<int> status = GeneratedColumn<int>(
    'status',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _serviceCenterMeta = const VerificationMeta(
    'serviceCenter',
  );
  @override
  late final GeneratedColumn<String> serviceCenter = GeneratedColumn<String>(
    'service_center',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _protocolMeta = const VerificationMeta(
    'protocol',
  );
  @override
  late final GeneratedColumn<int> protocol = GeneratedColumn<int>(
    'protocol',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _subjectMeta = const VerificationMeta(
    'subject',
  );
  @override
  late final GeneratedColumn<String> subject = GeneratedColumn<String>(
    'subject',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _replyPathPresentMeta = const VerificationMeta(
    'replyPathPresent',
  );
  @override
  late final GeneratedColumn<bool> replyPathPresent = GeneratedColumn<bool>(
    'reply_path_present',
    aliasedName,
    true,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("reply_path_present" IN (0, 1))',
    ),
  );
  static const VerificationMeta _lockedMeta = const VerificationMeta('locked');
  @override
  late final GeneratedColumn<bool> locked = GeneratedColumn<bool>(
    'locked',
    aliasedName,
    true,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("locked" IN (0, 1))',
    ),
  );
  static const VerificationMeta _errorCodeMeta = const VerificationMeta(
    'errorCode',
  );
  @override
  late final GeneratedColumn<int> errorCode = GeneratedColumn<int>(
    'error_code',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _creatorMeta = const VerificationMeta(
    'creator',
  );
  @override
  late final GeneratedColumn<String> creator = GeneratedColumn<String>(
    'creator',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _subscriptionIdMeta = const VerificationMeta(
    'subscriptionId',
  );
  @override
  late final GeneratedColumn<int> subscriptionId = GeneratedColumn<int>(
    'subscription_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _fingerprintMeta = const VerificationMeta(
    'fingerprint',
  );
  @override
  late final GeneratedColumn<String> fingerprint = GeneratedColumn<String>(
    'fingerprint',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _syncStatusMeta = const VerificationMeta(
    'syncStatus',
  );
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
    'sync_status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('pending'),
  );
  static const VerificationMeta _serverIdMeta = const VerificationMeta(
    'serverId',
  );
  @override
  late final GeneratedColumn<String> serverId = GeneratedColumn<String>(
    'server_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _lastSyncAttemptAtMillisMeta =
      const VerificationMeta('lastSyncAttemptAtMillis');
  @override
  late final GeneratedColumn<int> lastSyncAttemptAtMillis =
      GeneratedColumn<int>(
        'last_sync_attempt_at_millis',
        aliasedName,
        true,
        type: DriftSqlType.int,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _syncErrorMeta = const VerificationMeta(
    'syncError',
  );
  @override
  late final GeneratedColumn<String> syncError = GeneratedColumn<String>(
    'sync_error',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    providerId,
    threadId,
    address,
    body,
    dateMillis,
    dateSentMillis,
    type,
    read,
    seen,
    status,
    serviceCenter,
    protocol,
    subject,
    replyPathPresent,
    locked,
    errorCode,
    creator,
    subscriptionId,
    fingerprint,
    syncStatus,
    serverId,
    lastSyncAttemptAtMillis,
    syncError,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sms_messages';
  @override
  VerificationContext validateIntegrity(
    Insertable<SmsMessageRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('provider_id')) {
      context.handle(
        _providerIdMeta,
        providerId.isAcceptableOrUnknown(data['provider_id']!, _providerIdMeta),
      );
    }
    if (data.containsKey('thread_id')) {
      context.handle(
        _threadIdMeta,
        threadId.isAcceptableOrUnknown(data['thread_id']!, _threadIdMeta),
      );
    }
    if (data.containsKey('address')) {
      context.handle(
        _addressMeta,
        address.isAcceptableOrUnknown(data['address']!, _addressMeta),
      );
    }
    if (data.containsKey('body')) {
      context.handle(
        _bodyMeta,
        body.isAcceptableOrUnknown(data['body']!, _bodyMeta),
      );
    } else if (isInserting) {
      context.missing(_bodyMeta);
    }
    if (data.containsKey('date_millis')) {
      context.handle(
        _dateMillisMeta,
        dateMillis.isAcceptableOrUnknown(data['date_millis']!, _dateMillisMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMillisMeta);
    }
    if (data.containsKey('date_sent_millis')) {
      context.handle(
        _dateSentMillisMeta,
        dateSentMillis.isAcceptableOrUnknown(
          data['date_sent_millis']!,
          _dateSentMillisMeta,
        ),
      );
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    }
    if (data.containsKey('read')) {
      context.handle(
        _readMeta,
        read.isAcceptableOrUnknown(data['read']!, _readMeta),
      );
    }
    if (data.containsKey('seen')) {
      context.handle(
        _seenMeta,
        seen.isAcceptableOrUnknown(data['seen']!, _seenMeta),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('service_center')) {
      context.handle(
        _serviceCenterMeta,
        serviceCenter.isAcceptableOrUnknown(
          data['service_center']!,
          _serviceCenterMeta,
        ),
      );
    }
    if (data.containsKey('protocol')) {
      context.handle(
        _protocolMeta,
        protocol.isAcceptableOrUnknown(data['protocol']!, _protocolMeta),
      );
    }
    if (data.containsKey('subject')) {
      context.handle(
        _subjectMeta,
        subject.isAcceptableOrUnknown(data['subject']!, _subjectMeta),
      );
    }
    if (data.containsKey('reply_path_present')) {
      context.handle(
        _replyPathPresentMeta,
        replyPathPresent.isAcceptableOrUnknown(
          data['reply_path_present']!,
          _replyPathPresentMeta,
        ),
      );
    }
    if (data.containsKey('locked')) {
      context.handle(
        _lockedMeta,
        locked.isAcceptableOrUnknown(data['locked']!, _lockedMeta),
      );
    }
    if (data.containsKey('error_code')) {
      context.handle(
        _errorCodeMeta,
        errorCode.isAcceptableOrUnknown(data['error_code']!, _errorCodeMeta),
      );
    }
    if (data.containsKey('creator')) {
      context.handle(
        _creatorMeta,
        creator.isAcceptableOrUnknown(data['creator']!, _creatorMeta),
      );
    }
    if (data.containsKey('subscription_id')) {
      context.handle(
        _subscriptionIdMeta,
        subscriptionId.isAcceptableOrUnknown(
          data['subscription_id']!,
          _subscriptionIdMeta,
        ),
      );
    }
    if (data.containsKey('fingerprint')) {
      context.handle(
        _fingerprintMeta,
        fingerprint.isAcceptableOrUnknown(
          data['fingerprint']!,
          _fingerprintMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_fingerprintMeta);
    }
    if (data.containsKey('sync_status')) {
      context.handle(
        _syncStatusMeta,
        syncStatus.isAcceptableOrUnknown(data['sync_status']!, _syncStatusMeta),
      );
    }
    if (data.containsKey('server_id')) {
      context.handle(
        _serverIdMeta,
        serverId.isAcceptableOrUnknown(data['server_id']!, _serverIdMeta),
      );
    }
    if (data.containsKey('last_sync_attempt_at_millis')) {
      context.handle(
        _lastSyncAttemptAtMillisMeta,
        lastSyncAttemptAtMillis.isAcceptableOrUnknown(
          data['last_sync_attempt_at_millis']!,
          _lastSyncAttemptAtMillisMeta,
        ),
      );
    }
    if (data.containsKey('sync_error')) {
      context.handle(
        _syncErrorMeta,
        syncError.isAcceptableOrUnknown(data['sync_error']!, _syncErrorMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SmsMessageRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SmsMessageRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      providerId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}provider_id'],
      ),
      threadId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}thread_id'],
      ),
      address: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}address'],
      ),
      body: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}body'],
      )!,
      dateMillis: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}date_millis'],
      )!,
      dateSentMillis: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}date_sent_millis'],
      ),
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}type'],
      )!,
      read: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}read'],
      ),
      seen: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}seen'],
      ),
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}status'],
      ),
      serviceCenter: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}service_center'],
      ),
      protocol: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}protocol'],
      ),
      subject: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}subject'],
      ),
      replyPathPresent: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}reply_path_present'],
      ),
      locked: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}locked'],
      ),
      errorCode: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}error_code'],
      ),
      creator: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}creator'],
      ),
      subscriptionId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}subscription_id'],
      ),
      fingerprint: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}fingerprint'],
      )!,
      syncStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sync_status'],
      )!,
      serverId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}server_id'],
      ),
      lastSyncAttemptAtMillis: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}last_sync_attempt_at_millis'],
      ),
      syncError: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sync_error'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $SmsMessagesTable createAlias(String alias) {
    return $SmsMessagesTable(attachedDatabase, alias);
  }
}

class SmsMessageRow extends DataClass implements Insertable<SmsMessageRow> {
  final int id;
  final int? providerId;
  final int? threadId;
  final String? address;
  final String body;
  final int dateMillis;
  final int? dateSentMillis;
  final String type;
  final bool? read;
  final bool? seen;
  final int? status;
  final String? serviceCenter;
  final int? protocol;
  final String? subject;
  final bool? replyPathPresent;
  final bool? locked;
  final int? errorCode;
  final String? creator;
  final int? subscriptionId;
  final String fingerprint;
  final String syncStatus;
  final String? serverId;
  final int? lastSyncAttemptAtMillis;
  final String? syncError;
  final DateTime createdAt;
  final DateTime updatedAt;
  const SmsMessageRow({
    required this.id,
    this.providerId,
    this.threadId,
    this.address,
    required this.body,
    required this.dateMillis,
    this.dateSentMillis,
    required this.type,
    this.read,
    this.seen,
    this.status,
    this.serviceCenter,
    this.protocol,
    this.subject,
    this.replyPathPresent,
    this.locked,
    this.errorCode,
    this.creator,
    this.subscriptionId,
    required this.fingerprint,
    required this.syncStatus,
    this.serverId,
    this.lastSyncAttemptAtMillis,
    this.syncError,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || providerId != null) {
      map['provider_id'] = Variable<int>(providerId);
    }
    if (!nullToAbsent || threadId != null) {
      map['thread_id'] = Variable<int>(threadId);
    }
    if (!nullToAbsent || address != null) {
      map['address'] = Variable<String>(address);
    }
    map['body'] = Variable<String>(body);
    map['date_millis'] = Variable<int>(dateMillis);
    if (!nullToAbsent || dateSentMillis != null) {
      map['date_sent_millis'] = Variable<int>(dateSentMillis);
    }
    map['type'] = Variable<String>(type);
    if (!nullToAbsent || read != null) {
      map['read'] = Variable<bool>(read);
    }
    if (!nullToAbsent || seen != null) {
      map['seen'] = Variable<bool>(seen);
    }
    if (!nullToAbsent || status != null) {
      map['status'] = Variable<int>(status);
    }
    if (!nullToAbsent || serviceCenter != null) {
      map['service_center'] = Variable<String>(serviceCenter);
    }
    if (!nullToAbsent || protocol != null) {
      map['protocol'] = Variable<int>(protocol);
    }
    if (!nullToAbsent || subject != null) {
      map['subject'] = Variable<String>(subject);
    }
    if (!nullToAbsent || replyPathPresent != null) {
      map['reply_path_present'] = Variable<bool>(replyPathPresent);
    }
    if (!nullToAbsent || locked != null) {
      map['locked'] = Variable<bool>(locked);
    }
    if (!nullToAbsent || errorCode != null) {
      map['error_code'] = Variable<int>(errorCode);
    }
    if (!nullToAbsent || creator != null) {
      map['creator'] = Variable<String>(creator);
    }
    if (!nullToAbsent || subscriptionId != null) {
      map['subscription_id'] = Variable<int>(subscriptionId);
    }
    map['fingerprint'] = Variable<String>(fingerprint);
    map['sync_status'] = Variable<String>(syncStatus);
    if (!nullToAbsent || serverId != null) {
      map['server_id'] = Variable<String>(serverId);
    }
    if (!nullToAbsent || lastSyncAttemptAtMillis != null) {
      map['last_sync_attempt_at_millis'] = Variable<int>(
        lastSyncAttemptAtMillis,
      );
    }
    if (!nullToAbsent || syncError != null) {
      map['sync_error'] = Variable<String>(syncError);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  SmsMessagesCompanion toCompanion(bool nullToAbsent) {
    return SmsMessagesCompanion(
      id: Value(id),
      providerId: providerId == null && nullToAbsent
          ? const Value.absent()
          : Value(providerId),
      threadId: threadId == null && nullToAbsent
          ? const Value.absent()
          : Value(threadId),
      address: address == null && nullToAbsent
          ? const Value.absent()
          : Value(address),
      body: Value(body),
      dateMillis: Value(dateMillis),
      dateSentMillis: dateSentMillis == null && nullToAbsent
          ? const Value.absent()
          : Value(dateSentMillis),
      type: Value(type),
      read: read == null && nullToAbsent ? const Value.absent() : Value(read),
      seen: seen == null && nullToAbsent ? const Value.absent() : Value(seen),
      status: status == null && nullToAbsent
          ? const Value.absent()
          : Value(status),
      serviceCenter: serviceCenter == null && nullToAbsent
          ? const Value.absent()
          : Value(serviceCenter),
      protocol: protocol == null && nullToAbsent
          ? const Value.absent()
          : Value(protocol),
      subject: subject == null && nullToAbsent
          ? const Value.absent()
          : Value(subject),
      replyPathPresent: replyPathPresent == null && nullToAbsent
          ? const Value.absent()
          : Value(replyPathPresent),
      locked: locked == null && nullToAbsent
          ? const Value.absent()
          : Value(locked),
      errorCode: errorCode == null && nullToAbsent
          ? const Value.absent()
          : Value(errorCode),
      creator: creator == null && nullToAbsent
          ? const Value.absent()
          : Value(creator),
      subscriptionId: subscriptionId == null && nullToAbsent
          ? const Value.absent()
          : Value(subscriptionId),
      fingerprint: Value(fingerprint),
      syncStatus: Value(syncStatus),
      serverId: serverId == null && nullToAbsent
          ? const Value.absent()
          : Value(serverId),
      lastSyncAttemptAtMillis: lastSyncAttemptAtMillis == null && nullToAbsent
          ? const Value.absent()
          : Value(lastSyncAttemptAtMillis),
      syncError: syncError == null && nullToAbsent
          ? const Value.absent()
          : Value(syncError),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory SmsMessageRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SmsMessageRow(
      id: serializer.fromJson<int>(json['id']),
      providerId: serializer.fromJson<int?>(json['providerId']),
      threadId: serializer.fromJson<int?>(json['threadId']),
      address: serializer.fromJson<String?>(json['address']),
      body: serializer.fromJson<String>(json['body']),
      dateMillis: serializer.fromJson<int>(json['dateMillis']),
      dateSentMillis: serializer.fromJson<int?>(json['dateSentMillis']),
      type: serializer.fromJson<String>(json['type']),
      read: serializer.fromJson<bool?>(json['read']),
      seen: serializer.fromJson<bool?>(json['seen']),
      status: serializer.fromJson<int?>(json['status']),
      serviceCenter: serializer.fromJson<String?>(json['serviceCenter']),
      protocol: serializer.fromJson<int?>(json['protocol']),
      subject: serializer.fromJson<String?>(json['subject']),
      replyPathPresent: serializer.fromJson<bool?>(json['replyPathPresent']),
      locked: serializer.fromJson<bool?>(json['locked']),
      errorCode: serializer.fromJson<int?>(json['errorCode']),
      creator: serializer.fromJson<String?>(json['creator']),
      subscriptionId: serializer.fromJson<int?>(json['subscriptionId']),
      fingerprint: serializer.fromJson<String>(json['fingerprint']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
      serverId: serializer.fromJson<String?>(json['serverId']),
      lastSyncAttemptAtMillis: serializer.fromJson<int?>(
        json['lastSyncAttemptAtMillis'],
      ),
      syncError: serializer.fromJson<String?>(json['syncError']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'providerId': serializer.toJson<int?>(providerId),
      'threadId': serializer.toJson<int?>(threadId),
      'address': serializer.toJson<String?>(address),
      'body': serializer.toJson<String>(body),
      'dateMillis': serializer.toJson<int>(dateMillis),
      'dateSentMillis': serializer.toJson<int?>(dateSentMillis),
      'type': serializer.toJson<String>(type),
      'read': serializer.toJson<bool?>(read),
      'seen': serializer.toJson<bool?>(seen),
      'status': serializer.toJson<int?>(status),
      'serviceCenter': serializer.toJson<String?>(serviceCenter),
      'protocol': serializer.toJson<int?>(protocol),
      'subject': serializer.toJson<String?>(subject),
      'replyPathPresent': serializer.toJson<bool?>(replyPathPresent),
      'locked': serializer.toJson<bool?>(locked),
      'errorCode': serializer.toJson<int?>(errorCode),
      'creator': serializer.toJson<String?>(creator),
      'subscriptionId': serializer.toJson<int?>(subscriptionId),
      'fingerprint': serializer.toJson<String>(fingerprint),
      'syncStatus': serializer.toJson<String>(syncStatus),
      'serverId': serializer.toJson<String?>(serverId),
      'lastSyncAttemptAtMillis': serializer.toJson<int?>(
        lastSyncAttemptAtMillis,
      ),
      'syncError': serializer.toJson<String?>(syncError),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  SmsMessageRow copyWith({
    int? id,
    Value<int?> providerId = const Value.absent(),
    Value<int?> threadId = const Value.absent(),
    Value<String?> address = const Value.absent(),
    String? body,
    int? dateMillis,
    Value<int?> dateSentMillis = const Value.absent(),
    String? type,
    Value<bool?> read = const Value.absent(),
    Value<bool?> seen = const Value.absent(),
    Value<int?> status = const Value.absent(),
    Value<String?> serviceCenter = const Value.absent(),
    Value<int?> protocol = const Value.absent(),
    Value<String?> subject = const Value.absent(),
    Value<bool?> replyPathPresent = const Value.absent(),
    Value<bool?> locked = const Value.absent(),
    Value<int?> errorCode = const Value.absent(),
    Value<String?> creator = const Value.absent(),
    Value<int?> subscriptionId = const Value.absent(),
    String? fingerprint,
    String? syncStatus,
    Value<String?> serverId = const Value.absent(),
    Value<int?> lastSyncAttemptAtMillis = const Value.absent(),
    Value<String?> syncError = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => SmsMessageRow(
    id: id ?? this.id,
    providerId: providerId.present ? providerId.value : this.providerId,
    threadId: threadId.present ? threadId.value : this.threadId,
    address: address.present ? address.value : this.address,
    body: body ?? this.body,
    dateMillis: dateMillis ?? this.dateMillis,
    dateSentMillis: dateSentMillis.present
        ? dateSentMillis.value
        : this.dateSentMillis,
    type: type ?? this.type,
    read: read.present ? read.value : this.read,
    seen: seen.present ? seen.value : this.seen,
    status: status.present ? status.value : this.status,
    serviceCenter: serviceCenter.present
        ? serviceCenter.value
        : this.serviceCenter,
    protocol: protocol.present ? protocol.value : this.protocol,
    subject: subject.present ? subject.value : this.subject,
    replyPathPresent: replyPathPresent.present
        ? replyPathPresent.value
        : this.replyPathPresent,
    locked: locked.present ? locked.value : this.locked,
    errorCode: errorCode.present ? errorCode.value : this.errorCode,
    creator: creator.present ? creator.value : this.creator,
    subscriptionId: subscriptionId.present
        ? subscriptionId.value
        : this.subscriptionId,
    fingerprint: fingerprint ?? this.fingerprint,
    syncStatus: syncStatus ?? this.syncStatus,
    serverId: serverId.present ? serverId.value : this.serverId,
    lastSyncAttemptAtMillis: lastSyncAttemptAtMillis.present
        ? lastSyncAttemptAtMillis.value
        : this.lastSyncAttemptAtMillis,
    syncError: syncError.present ? syncError.value : this.syncError,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  SmsMessageRow copyWithCompanion(SmsMessagesCompanion data) {
    return SmsMessageRow(
      id: data.id.present ? data.id.value : this.id,
      providerId: data.providerId.present
          ? data.providerId.value
          : this.providerId,
      threadId: data.threadId.present ? data.threadId.value : this.threadId,
      address: data.address.present ? data.address.value : this.address,
      body: data.body.present ? data.body.value : this.body,
      dateMillis: data.dateMillis.present
          ? data.dateMillis.value
          : this.dateMillis,
      dateSentMillis: data.dateSentMillis.present
          ? data.dateSentMillis.value
          : this.dateSentMillis,
      type: data.type.present ? data.type.value : this.type,
      read: data.read.present ? data.read.value : this.read,
      seen: data.seen.present ? data.seen.value : this.seen,
      status: data.status.present ? data.status.value : this.status,
      serviceCenter: data.serviceCenter.present
          ? data.serviceCenter.value
          : this.serviceCenter,
      protocol: data.protocol.present ? data.protocol.value : this.protocol,
      subject: data.subject.present ? data.subject.value : this.subject,
      replyPathPresent: data.replyPathPresent.present
          ? data.replyPathPresent.value
          : this.replyPathPresent,
      locked: data.locked.present ? data.locked.value : this.locked,
      errorCode: data.errorCode.present ? data.errorCode.value : this.errorCode,
      creator: data.creator.present ? data.creator.value : this.creator,
      subscriptionId: data.subscriptionId.present
          ? data.subscriptionId.value
          : this.subscriptionId,
      fingerprint: data.fingerprint.present
          ? data.fingerprint.value
          : this.fingerprint,
      syncStatus: data.syncStatus.present
          ? data.syncStatus.value
          : this.syncStatus,
      serverId: data.serverId.present ? data.serverId.value : this.serverId,
      lastSyncAttemptAtMillis: data.lastSyncAttemptAtMillis.present
          ? data.lastSyncAttemptAtMillis.value
          : this.lastSyncAttemptAtMillis,
      syncError: data.syncError.present ? data.syncError.value : this.syncError,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SmsMessageRow(')
          ..write('id: $id, ')
          ..write('providerId: $providerId, ')
          ..write('threadId: $threadId, ')
          ..write('address: $address, ')
          ..write('body: $body, ')
          ..write('dateMillis: $dateMillis, ')
          ..write('dateSentMillis: $dateSentMillis, ')
          ..write('type: $type, ')
          ..write('read: $read, ')
          ..write('seen: $seen, ')
          ..write('status: $status, ')
          ..write('serviceCenter: $serviceCenter, ')
          ..write('protocol: $protocol, ')
          ..write('subject: $subject, ')
          ..write('replyPathPresent: $replyPathPresent, ')
          ..write('locked: $locked, ')
          ..write('errorCode: $errorCode, ')
          ..write('creator: $creator, ')
          ..write('subscriptionId: $subscriptionId, ')
          ..write('fingerprint: $fingerprint, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('serverId: $serverId, ')
          ..write('lastSyncAttemptAtMillis: $lastSyncAttemptAtMillis, ')
          ..write('syncError: $syncError, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    providerId,
    threadId,
    address,
    body,
    dateMillis,
    dateSentMillis,
    type,
    read,
    seen,
    status,
    serviceCenter,
    protocol,
    subject,
    replyPathPresent,
    locked,
    errorCode,
    creator,
    subscriptionId,
    fingerprint,
    syncStatus,
    serverId,
    lastSyncAttemptAtMillis,
    syncError,
    createdAt,
    updatedAt,
  ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SmsMessageRow &&
          other.id == this.id &&
          other.providerId == this.providerId &&
          other.threadId == this.threadId &&
          other.address == this.address &&
          other.body == this.body &&
          other.dateMillis == this.dateMillis &&
          other.dateSentMillis == this.dateSentMillis &&
          other.type == this.type &&
          other.read == this.read &&
          other.seen == this.seen &&
          other.status == this.status &&
          other.serviceCenter == this.serviceCenter &&
          other.protocol == this.protocol &&
          other.subject == this.subject &&
          other.replyPathPresent == this.replyPathPresent &&
          other.locked == this.locked &&
          other.errorCode == this.errorCode &&
          other.creator == this.creator &&
          other.subscriptionId == this.subscriptionId &&
          other.fingerprint == this.fingerprint &&
          other.syncStatus == this.syncStatus &&
          other.serverId == this.serverId &&
          other.lastSyncAttemptAtMillis == this.lastSyncAttemptAtMillis &&
          other.syncError == this.syncError &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class SmsMessagesCompanion extends UpdateCompanion<SmsMessageRow> {
  final Value<int> id;
  final Value<int?> providerId;
  final Value<int?> threadId;
  final Value<String?> address;
  final Value<String> body;
  final Value<int> dateMillis;
  final Value<int?> dateSentMillis;
  final Value<String> type;
  final Value<bool?> read;
  final Value<bool?> seen;
  final Value<int?> status;
  final Value<String?> serviceCenter;
  final Value<int?> protocol;
  final Value<String?> subject;
  final Value<bool?> replyPathPresent;
  final Value<bool?> locked;
  final Value<int?> errorCode;
  final Value<String?> creator;
  final Value<int?> subscriptionId;
  final Value<String> fingerprint;
  final Value<String> syncStatus;
  final Value<String?> serverId;
  final Value<int?> lastSyncAttemptAtMillis;
  final Value<String?> syncError;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const SmsMessagesCompanion({
    this.id = const Value.absent(),
    this.providerId = const Value.absent(),
    this.threadId = const Value.absent(),
    this.address = const Value.absent(),
    this.body = const Value.absent(),
    this.dateMillis = const Value.absent(),
    this.dateSentMillis = const Value.absent(),
    this.type = const Value.absent(),
    this.read = const Value.absent(),
    this.seen = const Value.absent(),
    this.status = const Value.absent(),
    this.serviceCenter = const Value.absent(),
    this.protocol = const Value.absent(),
    this.subject = const Value.absent(),
    this.replyPathPresent = const Value.absent(),
    this.locked = const Value.absent(),
    this.errorCode = const Value.absent(),
    this.creator = const Value.absent(),
    this.subscriptionId = const Value.absent(),
    this.fingerprint = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.serverId = const Value.absent(),
    this.lastSyncAttemptAtMillis = const Value.absent(),
    this.syncError = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  SmsMessagesCompanion.insert({
    this.id = const Value.absent(),
    this.providerId = const Value.absent(),
    this.threadId = const Value.absent(),
    this.address = const Value.absent(),
    required String body,
    required int dateMillis,
    this.dateSentMillis = const Value.absent(),
    this.type = const Value.absent(),
    this.read = const Value.absent(),
    this.seen = const Value.absent(),
    this.status = const Value.absent(),
    this.serviceCenter = const Value.absent(),
    this.protocol = const Value.absent(),
    this.subject = const Value.absent(),
    this.replyPathPresent = const Value.absent(),
    this.locked = const Value.absent(),
    this.errorCode = const Value.absent(),
    this.creator = const Value.absent(),
    this.subscriptionId = const Value.absent(),
    required String fingerprint,
    this.syncStatus = const Value.absent(),
    this.serverId = const Value.absent(),
    this.lastSyncAttemptAtMillis = const Value.absent(),
    this.syncError = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : body = Value(body),
       dateMillis = Value(dateMillis),
       fingerprint = Value(fingerprint);
  static Insertable<SmsMessageRow> custom({
    Expression<int>? id,
    Expression<int>? providerId,
    Expression<int>? threadId,
    Expression<String>? address,
    Expression<String>? body,
    Expression<int>? dateMillis,
    Expression<int>? dateSentMillis,
    Expression<String>? type,
    Expression<bool>? read,
    Expression<bool>? seen,
    Expression<int>? status,
    Expression<String>? serviceCenter,
    Expression<int>? protocol,
    Expression<String>? subject,
    Expression<bool>? replyPathPresent,
    Expression<bool>? locked,
    Expression<int>? errorCode,
    Expression<String>? creator,
    Expression<int>? subscriptionId,
    Expression<String>? fingerprint,
    Expression<String>? syncStatus,
    Expression<String>? serverId,
    Expression<int>? lastSyncAttemptAtMillis,
    Expression<String>? syncError,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (providerId != null) 'provider_id': providerId,
      if (threadId != null) 'thread_id': threadId,
      if (address != null) 'address': address,
      if (body != null) 'body': body,
      if (dateMillis != null) 'date_millis': dateMillis,
      if (dateSentMillis != null) 'date_sent_millis': dateSentMillis,
      if (type != null) 'type': type,
      if (read != null) 'read': read,
      if (seen != null) 'seen': seen,
      if (status != null) 'status': status,
      if (serviceCenter != null) 'service_center': serviceCenter,
      if (protocol != null) 'protocol': protocol,
      if (subject != null) 'subject': subject,
      if (replyPathPresent != null) 'reply_path_present': replyPathPresent,
      if (locked != null) 'locked': locked,
      if (errorCode != null) 'error_code': errorCode,
      if (creator != null) 'creator': creator,
      if (subscriptionId != null) 'subscription_id': subscriptionId,
      if (fingerprint != null) 'fingerprint': fingerprint,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (serverId != null) 'server_id': serverId,
      if (lastSyncAttemptAtMillis != null)
        'last_sync_attempt_at_millis': lastSyncAttemptAtMillis,
      if (syncError != null) 'sync_error': syncError,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  SmsMessagesCompanion copyWith({
    Value<int>? id,
    Value<int?>? providerId,
    Value<int?>? threadId,
    Value<String?>? address,
    Value<String>? body,
    Value<int>? dateMillis,
    Value<int?>? dateSentMillis,
    Value<String>? type,
    Value<bool?>? read,
    Value<bool?>? seen,
    Value<int?>? status,
    Value<String?>? serviceCenter,
    Value<int?>? protocol,
    Value<String?>? subject,
    Value<bool?>? replyPathPresent,
    Value<bool?>? locked,
    Value<int?>? errorCode,
    Value<String?>? creator,
    Value<int?>? subscriptionId,
    Value<String>? fingerprint,
    Value<String>? syncStatus,
    Value<String?>? serverId,
    Value<int?>? lastSyncAttemptAtMillis,
    Value<String?>? syncError,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
  }) {
    return SmsMessagesCompanion(
      id: id ?? this.id,
      providerId: providerId ?? this.providerId,
      threadId: threadId ?? this.threadId,
      address: address ?? this.address,
      body: body ?? this.body,
      dateMillis: dateMillis ?? this.dateMillis,
      dateSentMillis: dateSentMillis ?? this.dateSentMillis,
      type: type ?? this.type,
      read: read ?? this.read,
      seen: seen ?? this.seen,
      status: status ?? this.status,
      serviceCenter: serviceCenter ?? this.serviceCenter,
      protocol: protocol ?? this.protocol,
      subject: subject ?? this.subject,
      replyPathPresent: replyPathPresent ?? this.replyPathPresent,
      locked: locked ?? this.locked,
      errorCode: errorCode ?? this.errorCode,
      creator: creator ?? this.creator,
      subscriptionId: subscriptionId ?? this.subscriptionId,
      fingerprint: fingerprint ?? this.fingerprint,
      syncStatus: syncStatus ?? this.syncStatus,
      serverId: serverId ?? this.serverId,
      lastSyncAttemptAtMillis:
          lastSyncAttemptAtMillis ?? this.lastSyncAttemptAtMillis,
      syncError: syncError ?? this.syncError,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (providerId.present) {
      map['provider_id'] = Variable<int>(providerId.value);
    }
    if (threadId.present) {
      map['thread_id'] = Variable<int>(threadId.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (body.present) {
      map['body'] = Variable<String>(body.value);
    }
    if (dateMillis.present) {
      map['date_millis'] = Variable<int>(dateMillis.value);
    }
    if (dateSentMillis.present) {
      map['date_sent_millis'] = Variable<int>(dateSentMillis.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (read.present) {
      map['read'] = Variable<bool>(read.value);
    }
    if (seen.present) {
      map['seen'] = Variable<bool>(seen.value);
    }
    if (status.present) {
      map['status'] = Variable<int>(status.value);
    }
    if (serviceCenter.present) {
      map['service_center'] = Variable<String>(serviceCenter.value);
    }
    if (protocol.present) {
      map['protocol'] = Variable<int>(protocol.value);
    }
    if (subject.present) {
      map['subject'] = Variable<String>(subject.value);
    }
    if (replyPathPresent.present) {
      map['reply_path_present'] = Variable<bool>(replyPathPresent.value);
    }
    if (locked.present) {
      map['locked'] = Variable<bool>(locked.value);
    }
    if (errorCode.present) {
      map['error_code'] = Variable<int>(errorCode.value);
    }
    if (creator.present) {
      map['creator'] = Variable<String>(creator.value);
    }
    if (subscriptionId.present) {
      map['subscription_id'] = Variable<int>(subscriptionId.value);
    }
    if (fingerprint.present) {
      map['fingerprint'] = Variable<String>(fingerprint.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    if (serverId.present) {
      map['server_id'] = Variable<String>(serverId.value);
    }
    if (lastSyncAttemptAtMillis.present) {
      map['last_sync_attempt_at_millis'] = Variable<int>(
        lastSyncAttemptAtMillis.value,
      );
    }
    if (syncError.present) {
      map['sync_error'] = Variable<String>(syncError.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SmsMessagesCompanion(')
          ..write('id: $id, ')
          ..write('providerId: $providerId, ')
          ..write('threadId: $threadId, ')
          ..write('address: $address, ')
          ..write('body: $body, ')
          ..write('dateMillis: $dateMillis, ')
          ..write('dateSentMillis: $dateSentMillis, ')
          ..write('type: $type, ')
          ..write('read: $read, ')
          ..write('seen: $seen, ')
          ..write('status: $status, ')
          ..write('serviceCenter: $serviceCenter, ')
          ..write('protocol: $protocol, ')
          ..write('subject: $subject, ')
          ..write('replyPathPresent: $replyPathPresent, ')
          ..write('locked: $locked, ')
          ..write('errorCode: $errorCode, ')
          ..write('creator: $creator, ')
          ..write('subscriptionId: $subscriptionId, ')
          ..write('fingerprint: $fingerprint, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('serverId: $serverId, ')
          ..write('lastSyncAttemptAtMillis: $lastSyncAttemptAtMillis, ')
          ..write('syncError: $syncError, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $SmsMessagesTable smsMessages = $SmsMessagesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [smsMessages];
}

typedef $$SmsMessagesTableCreateCompanionBuilder =
    SmsMessagesCompanion Function({
      Value<int> id,
      Value<int?> providerId,
      Value<int?> threadId,
      Value<String?> address,
      required String body,
      required int dateMillis,
      Value<int?> dateSentMillis,
      Value<String> type,
      Value<bool?> read,
      Value<bool?> seen,
      Value<int?> status,
      Value<String?> serviceCenter,
      Value<int?> protocol,
      Value<String?> subject,
      Value<bool?> replyPathPresent,
      Value<bool?> locked,
      Value<int?> errorCode,
      Value<String?> creator,
      Value<int?> subscriptionId,
      required String fingerprint,
      Value<String> syncStatus,
      Value<String?> serverId,
      Value<int?> lastSyncAttemptAtMillis,
      Value<String?> syncError,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });
typedef $$SmsMessagesTableUpdateCompanionBuilder =
    SmsMessagesCompanion Function({
      Value<int> id,
      Value<int?> providerId,
      Value<int?> threadId,
      Value<String?> address,
      Value<String> body,
      Value<int> dateMillis,
      Value<int?> dateSentMillis,
      Value<String> type,
      Value<bool?> read,
      Value<bool?> seen,
      Value<int?> status,
      Value<String?> serviceCenter,
      Value<int?> protocol,
      Value<String?> subject,
      Value<bool?> replyPathPresent,
      Value<bool?> locked,
      Value<int?> errorCode,
      Value<String?> creator,
      Value<int?> subscriptionId,
      Value<String> fingerprint,
      Value<String> syncStatus,
      Value<String?> serverId,
      Value<int?> lastSyncAttemptAtMillis,
      Value<String?> syncError,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });

class $$SmsMessagesTableFilterComposer
    extends Composer<_$AppDatabase, $SmsMessagesTable> {
  $$SmsMessagesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get providerId => $composableBuilder(
    column: $table.providerId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get threadId => $composableBuilder(
    column: $table.threadId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get body => $composableBuilder(
    column: $table.body,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get dateMillis => $composableBuilder(
    column: $table.dateMillis,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get dateSentMillis => $composableBuilder(
    column: $table.dateSentMillis,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get read => $composableBuilder(
    column: $table.read,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get seen => $composableBuilder(
    column: $table.seen,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get serviceCenter => $composableBuilder(
    column: $table.serviceCenter,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get protocol => $composableBuilder(
    column: $table.protocol,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get subject => $composableBuilder(
    column: $table.subject,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get replyPathPresent => $composableBuilder(
    column: $table.replyPathPresent,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get locked => $composableBuilder(
    column: $table.locked,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get errorCode => $composableBuilder(
    column: $table.errorCode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get creator => $composableBuilder(
    column: $table.creator,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get subscriptionId => $composableBuilder(
    column: $table.subscriptionId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get fingerprint => $composableBuilder(
    column: $table.fingerprint,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get serverId => $composableBuilder(
    column: $table.serverId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get lastSyncAttemptAtMillis => $composableBuilder(
    column: $table.lastSyncAttemptAtMillis,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get syncError => $composableBuilder(
    column: $table.syncError,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SmsMessagesTableOrderingComposer
    extends Composer<_$AppDatabase, $SmsMessagesTable> {
  $$SmsMessagesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get providerId => $composableBuilder(
    column: $table.providerId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get threadId => $composableBuilder(
    column: $table.threadId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get body => $composableBuilder(
    column: $table.body,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get dateMillis => $composableBuilder(
    column: $table.dateMillis,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get dateSentMillis => $composableBuilder(
    column: $table.dateSentMillis,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get read => $composableBuilder(
    column: $table.read,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get seen => $composableBuilder(
    column: $table.seen,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get serviceCenter => $composableBuilder(
    column: $table.serviceCenter,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get protocol => $composableBuilder(
    column: $table.protocol,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get subject => $composableBuilder(
    column: $table.subject,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get replyPathPresent => $composableBuilder(
    column: $table.replyPathPresent,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get locked => $composableBuilder(
    column: $table.locked,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get errorCode => $composableBuilder(
    column: $table.errorCode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get creator => $composableBuilder(
    column: $table.creator,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get subscriptionId => $composableBuilder(
    column: $table.subscriptionId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get fingerprint => $composableBuilder(
    column: $table.fingerprint,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get serverId => $composableBuilder(
    column: $table.serverId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get lastSyncAttemptAtMillis => $composableBuilder(
    column: $table.lastSyncAttemptAtMillis,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncError => $composableBuilder(
    column: $table.syncError,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SmsMessagesTableAnnotationComposer
    extends Composer<_$AppDatabase, $SmsMessagesTable> {
  $$SmsMessagesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get providerId => $composableBuilder(
    column: $table.providerId,
    builder: (column) => column,
  );

  GeneratedColumn<int> get threadId =>
      $composableBuilder(column: $table.threadId, builder: (column) => column);

  GeneratedColumn<String> get address =>
      $composableBuilder(column: $table.address, builder: (column) => column);

  GeneratedColumn<String> get body =>
      $composableBuilder(column: $table.body, builder: (column) => column);

  GeneratedColumn<int> get dateMillis => $composableBuilder(
    column: $table.dateMillis,
    builder: (column) => column,
  );

  GeneratedColumn<int> get dateSentMillis => $composableBuilder(
    column: $table.dateSentMillis,
    builder: (column) => column,
  );

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<bool> get read =>
      $composableBuilder(column: $table.read, builder: (column) => column);

  GeneratedColumn<bool> get seen =>
      $composableBuilder(column: $table.seen, builder: (column) => column);

  GeneratedColumn<int> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get serviceCenter => $composableBuilder(
    column: $table.serviceCenter,
    builder: (column) => column,
  );

  GeneratedColumn<int> get protocol =>
      $composableBuilder(column: $table.protocol, builder: (column) => column);

  GeneratedColumn<String> get subject =>
      $composableBuilder(column: $table.subject, builder: (column) => column);

  GeneratedColumn<bool> get replyPathPresent => $composableBuilder(
    column: $table.replyPathPresent,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get locked =>
      $composableBuilder(column: $table.locked, builder: (column) => column);

  GeneratedColumn<int> get errorCode =>
      $composableBuilder(column: $table.errorCode, builder: (column) => column);

  GeneratedColumn<String> get creator =>
      $composableBuilder(column: $table.creator, builder: (column) => column);

  GeneratedColumn<int> get subscriptionId => $composableBuilder(
    column: $table.subscriptionId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get fingerprint => $composableBuilder(
    column: $table.fingerprint,
    builder: (column) => column,
  );

  GeneratedColumn<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => column,
  );

  GeneratedColumn<String> get serverId =>
      $composableBuilder(column: $table.serverId, builder: (column) => column);

  GeneratedColumn<int> get lastSyncAttemptAtMillis => $composableBuilder(
    column: $table.lastSyncAttemptAtMillis,
    builder: (column) => column,
  );

  GeneratedColumn<String> get syncError =>
      $composableBuilder(column: $table.syncError, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$SmsMessagesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SmsMessagesTable,
          SmsMessageRow,
          $$SmsMessagesTableFilterComposer,
          $$SmsMessagesTableOrderingComposer,
          $$SmsMessagesTableAnnotationComposer,
          $$SmsMessagesTableCreateCompanionBuilder,
          $$SmsMessagesTableUpdateCompanionBuilder,
          (
            SmsMessageRow,
            BaseReferences<_$AppDatabase, $SmsMessagesTable, SmsMessageRow>,
          ),
          SmsMessageRow,
          PrefetchHooks Function()
        > {
  $$SmsMessagesTableTableManager(_$AppDatabase db, $SmsMessagesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SmsMessagesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SmsMessagesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SmsMessagesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int?> providerId = const Value.absent(),
                Value<int?> threadId = const Value.absent(),
                Value<String?> address = const Value.absent(),
                Value<String> body = const Value.absent(),
                Value<int> dateMillis = const Value.absent(),
                Value<int?> dateSentMillis = const Value.absent(),
                Value<String> type = const Value.absent(),
                Value<bool?> read = const Value.absent(),
                Value<bool?> seen = const Value.absent(),
                Value<int?> status = const Value.absent(),
                Value<String?> serviceCenter = const Value.absent(),
                Value<int?> protocol = const Value.absent(),
                Value<String?> subject = const Value.absent(),
                Value<bool?> replyPathPresent = const Value.absent(),
                Value<bool?> locked = const Value.absent(),
                Value<int?> errorCode = const Value.absent(),
                Value<String?> creator = const Value.absent(),
                Value<int?> subscriptionId = const Value.absent(),
                Value<String> fingerprint = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<String?> serverId = const Value.absent(),
                Value<int?> lastSyncAttemptAtMillis = const Value.absent(),
                Value<String?> syncError = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => SmsMessagesCompanion(
                id: id,
                providerId: providerId,
                threadId: threadId,
                address: address,
                body: body,
                dateMillis: dateMillis,
                dateSentMillis: dateSentMillis,
                type: type,
                read: read,
                seen: seen,
                status: status,
                serviceCenter: serviceCenter,
                protocol: protocol,
                subject: subject,
                replyPathPresent: replyPathPresent,
                locked: locked,
                errorCode: errorCode,
                creator: creator,
                subscriptionId: subscriptionId,
                fingerprint: fingerprint,
                syncStatus: syncStatus,
                serverId: serverId,
                lastSyncAttemptAtMillis: lastSyncAttemptAtMillis,
                syncError: syncError,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int?> providerId = const Value.absent(),
                Value<int?> threadId = const Value.absent(),
                Value<String?> address = const Value.absent(),
                required String body,
                required int dateMillis,
                Value<int?> dateSentMillis = const Value.absent(),
                Value<String> type = const Value.absent(),
                Value<bool?> read = const Value.absent(),
                Value<bool?> seen = const Value.absent(),
                Value<int?> status = const Value.absent(),
                Value<String?> serviceCenter = const Value.absent(),
                Value<int?> protocol = const Value.absent(),
                Value<String?> subject = const Value.absent(),
                Value<bool?> replyPathPresent = const Value.absent(),
                Value<bool?> locked = const Value.absent(),
                Value<int?> errorCode = const Value.absent(),
                Value<String?> creator = const Value.absent(),
                Value<int?> subscriptionId = const Value.absent(),
                required String fingerprint,
                Value<String> syncStatus = const Value.absent(),
                Value<String?> serverId = const Value.absent(),
                Value<int?> lastSyncAttemptAtMillis = const Value.absent(),
                Value<String?> syncError = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => SmsMessagesCompanion.insert(
                id: id,
                providerId: providerId,
                threadId: threadId,
                address: address,
                body: body,
                dateMillis: dateMillis,
                dateSentMillis: dateSentMillis,
                type: type,
                read: read,
                seen: seen,
                status: status,
                serviceCenter: serviceCenter,
                protocol: protocol,
                subject: subject,
                replyPathPresent: replyPathPresent,
                locked: locked,
                errorCode: errorCode,
                creator: creator,
                subscriptionId: subscriptionId,
                fingerprint: fingerprint,
                syncStatus: syncStatus,
                serverId: serverId,
                lastSyncAttemptAtMillis: lastSyncAttemptAtMillis,
                syncError: syncError,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SmsMessagesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SmsMessagesTable,
      SmsMessageRow,
      $$SmsMessagesTableFilterComposer,
      $$SmsMessagesTableOrderingComposer,
      $$SmsMessagesTableAnnotationComposer,
      $$SmsMessagesTableCreateCompanionBuilder,
      $$SmsMessagesTableUpdateCompanionBuilder,
      (
        SmsMessageRow,
        BaseReferences<_$AppDatabase, $SmsMessagesTable, SmsMessageRow>,
      ),
      SmsMessageRow,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$SmsMessagesTableTableManager get smsMessages =>
      $$SmsMessagesTableTableManager(_db, _db.smsMessages);
}
