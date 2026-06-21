import 'package:flutter/services.dart';

class SmsPlatformChannel {
  SmsPlatformChannel({MethodChannel? methodChannel})
      : _methodChannel = methodChannel ??
            const MethodChannel('org.ahsan.dpdns.sms_harvester/sms');

  final MethodChannel _methodChannel;

  Future<List<Map<String, Object?>>> readInboxSms() async {
    final result = await _methodChannel.invokeListMethod<Map<dynamic, dynamic>>(
      'readInboxSms',
    );
    return _normalize(result);
  }

  Future<List<Map<String, Object?>>> drainPendingIncomingSms() async {
    final result = await _methodChannel.invokeListMethod<Map<dynamic, dynamic>>(
      'drainPendingIncomingSms',
    );
    return _normalize(result);
  }

  List<Map<String, Object?>> _normalize(List<Map<dynamic, dynamic>>? rows) {
    return (rows ?? const [])
        .map(
          (row) => row.map(
            (key, value) => MapEntry(key.toString(), value as Object?),
          ),
        )
        .toList(growable: false);
  }
}
