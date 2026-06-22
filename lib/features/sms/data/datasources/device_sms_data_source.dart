import 'dart:developer' as developer;

import '../../../../core/platform/sms_platform_channel.dart';
import '../models/native_sms_model.dart';

class DeviceSmsDataSource {
  DeviceSmsDataSource(this._platformChannel);

  final SmsPlatformChannel _platformChannel;

  Future<List<NativeSmsModel>> readInboxSms() async {
    developer.log('Reading inbox SMS from device', name: _logName);
    final rows = await _platformChannel.readInboxSms();
    final messages = rows.map(NativeSmsModel.fromMap).toList(growable: false);
    developer.log(
      'Read ${messages.length} inbox SMS from device',
      name: _logName,
    );
    return messages;
  }

  Future<List<NativeSmsModel>> drainPendingIncomingSms() async {
    developer.log('Draining pending SMS from native queue', name: _logName);
    final rows = await _platformChannel.drainPendingIncomingSms();
    final messages = rows.map(NativeSmsModel.fromMap).toList(growable: false);
    developer.log(
      'Drained ${messages.length} pending SMS from native queue',
      name: _logName,
    );
    return messages;
  }

  static const _logName = 'SmsHarvester.DeviceSmsDataSource';
}
