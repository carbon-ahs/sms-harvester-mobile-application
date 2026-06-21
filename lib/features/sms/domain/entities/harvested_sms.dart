import 'package:equatable/equatable.dart';

class HarvestedSms extends Equatable {
  const HarvestedSms({
    required this.body,
    required this.dateMillis,
    required this.fingerprint,
    this.providerId,
    this.threadId,
    this.address,
    this.dateSentMillis,
    this.type = 'inbox',
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
  });

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

  DateTime get date => DateTime.fromMillisecondsSinceEpoch(dateMillis);

  @override
  List<Object?> get props => [
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
      ];
}
