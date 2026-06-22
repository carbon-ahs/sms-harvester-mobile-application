import 'dart:convert';

import 'package:crypto/crypto.dart';

import '../../domain/entities/harvested_sms.dart';

class NativeSmsModel extends HarvestedSms {
  const NativeSmsModel({
    required super.body,
    required super.dateMillis,
    required super.fingerprint,
    super.providerId,
    super.threadId,
    super.address,
    super.dateSentMillis,
    super.type,
    super.read,
    super.seen,
    super.status,
    super.serviceCenter,
    super.protocol,
    super.subject,
    super.replyPathPresent,
    super.locked,
    super.errorCode,
    super.creator,
    super.subscriptionId,
  });

  factory NativeSmsModel.fromMap(Map<String, Object?> map) {
    final body = _asString(map['body']) ?? '';
    final dateMillis = _asInt(map['dateMillis']) ?? 0;
    final type = _asString(map['type']) ?? 'inbox';
    final address = _asString(map['address']);
    final providerId = _asInt(map['providerId']);

    return NativeSmsModel(
      providerId: providerId,
      threadId: _asInt(map['threadId']),
      address: address,
      body: body,
      dateMillis: dateMillis,
      dateSentMillis: _asInt(map['dateSentMillis']),
      type: type,
      read: _asBool(map['read']),
      seen: _asBool(map['seen']),
      status: _asInt(map['status']),
      serviceCenter: _asString(map['serviceCenter']),
      protocol: _asInt(map['protocol']),
      subject: _asString(map['subject']),
      replyPathPresent: _asBool(map['replyPathPresent']),
      locked: _asBool(map['locked']),
      errorCode: _asInt(map['errorCode']),
      creator: _asString(map['creator']),
      subscriptionId: _asInt(map['subscriptionId']),
      fingerprint: _fingerprint(
        address: address,
        body: body,
        dateMillis: dateMillis,
        type: type,
      ),
    );
  }

  static String _fingerprint({
    required String? address,
    required String body,
    required int dateMillis,
    required String type,
  }) {
    final source = [
      address ?? '',
      body,
      dateMillis.toString(),
      type,
    ].join('|');
    return sha256.convert(utf8.encode(source)).toString();
  }

  static int? _asInt(Object? value) {
    if (value is int) return value;
    if (value is num) return value.toInt();
    if (value is String) return int.tryParse(value);
    return null;
  }

  static String? _asString(Object? value) {
    if (value == null) return null;
    return value.toString();
  }

  static bool? _asBool(Object? value) {
    if (value is bool) return value;
    if (value is int) return value == 1;
    if (value is String) return value == '1' || value.toLowerCase() == 'true';
    return null;
  }
}
