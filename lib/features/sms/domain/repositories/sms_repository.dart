import '../entities/harvested_sms.dart';

abstract interface class SmsRepository {
  Future<bool> ensureSmsPermission();

  Future<int> importInboxAndPendingIncoming();

  Future<int> importPendingIncoming();

  Future<List<HarvestedSms>> watchStoredSmsSnapshot();
}
