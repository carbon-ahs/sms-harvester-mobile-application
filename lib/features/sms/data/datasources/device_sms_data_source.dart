import '../../../../core/platform/sms_platform_channel.dart';
import '../models/native_sms_model.dart';

class DeviceSmsDataSource {
  DeviceSmsDataSource(this._platformChannel);

  final SmsPlatformChannel _platformChannel;

  Future<List<NativeSmsModel>> readInboxSms() async {
    final rows = await _platformChannel.readInboxSms();
    return rows.map(NativeSmsModel.fromMap).toList(growable: false);
  }

  Future<List<NativeSmsModel>> drainPendingIncomingSms() async {
    final rows = await _platformChannel.drainPendingIncomingSms();
    return rows.map(NativeSmsModel.fromMap).toList(growable: false);
  }
}
