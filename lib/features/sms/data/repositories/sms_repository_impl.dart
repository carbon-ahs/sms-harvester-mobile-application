import 'package:permission_handler/permission_handler.dart';

import '../../domain/entities/harvested_sms.dart';
import '../../domain/repositories/sms_repository.dart';
import '../datasources/device_sms_data_source.dart';
import '../datasources/local_sms_data_source.dart';

class SmsRepositoryImpl implements SmsRepository {
  SmsRepositoryImpl({
    required DeviceSmsDataSource deviceDataSource,
    required LocalSmsDataSource localDataSource,
  })  : _deviceDataSource = deviceDataSource,
        _localDataSource = localDataSource;

  final DeviceSmsDataSource _deviceDataSource;
  final LocalSmsDataSource _localDataSource;

  @override
  Future<bool> ensureSmsPermission() async {
    final currentStatus = await Permission.sms.status;
    if (currentStatus.isGranted) return true;

    final requestedStatus = await Permission.sms.request();
    return requestedStatus.isGranted;
  }

  @override
  Future<int> importInboxAndPendingIncoming() async {
    final pendingIncoming = await _deviceDataSource.drainPendingIncomingSms();
    final inbox = await _deviceDataSource.readInboxSms();
    return _localDataSource.upsertMany([...pendingIncoming, ...inbox]);
  }

  @override
  Future<List<HarvestedSms>> watchStoredSmsSnapshot() {
    return _localDataSource.readAll();
  }
}
