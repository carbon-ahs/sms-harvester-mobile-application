import 'dart:developer' as developer;

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
    developer.log('Current SMS permission: $currentStatus', name: _logName);
    if (currentStatus.isGranted) {
      developer.log('SMS permission already granted', name: _logName);
      return true;
    }

    final requestedStatus = await Permission.sms.request();
    developer.log('Requested SMS permission: $requestedStatus', name: _logName);
    return requestedStatus.isGranted;
  }

  @override
  Future<int> importInboxAndPendingIncoming() async {
    developer.log('Import requested: pending queue + device inbox', name: _logName);
    final pendingIncoming = await _deviceDataSource.drainPendingIncomingSms();
    final inbox = await _deviceDataSource.readInboxSms();
    final insertedCount = await _localDataSource.upsertMany([
      ...pendingIncoming,
      ...inbox,
    ]);
    developer.log(
      'Import finished: pending=${pendingIncoming.length}, '
      'inbox=${inbox.length}, inserted=$insertedCount',
      name: _logName,
    );
    return insertedCount;
  }

  @override
  Future<int> importPendingIncoming() async {
    developer.log('Import requested: pending queue only', name: _logName);
    final pendingIncoming = await _deviceDataSource.drainPendingIncomingSms();
    final insertedCount = await _localDataSource.upsertMany(pendingIncoming);
    developer.log(
      'Pending import finished: pending=${pendingIncoming.length}, '
      'inserted=$insertedCount',
      name: _logName,
    );
    return insertedCount;
  }

  @override
  Future<List<HarvestedSms>> watchStoredSmsSnapshot() {
    return _localDataSource.readAll();
  }

  static const _logName = 'SmsHarvester.SmsRepository';
}
