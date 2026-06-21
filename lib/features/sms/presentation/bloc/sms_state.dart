part of 'sms_bloc.dart';

enum SmsViewStatus {
  initial,
  loading,
  ready,
  permissionDenied,
  failure,
}

final class SmsState extends Equatable {
  const SmsState({
    this.status = SmsViewStatus.initial,
    this.messages = const [],
    this.lastInsertedCount = 0,
    this.errorMessage,
  });

  final SmsViewStatus status;
  final List<HarvestedSms> messages;
  final int lastInsertedCount;
  final String? errorMessage;

  SmsState copyWith({
    SmsViewStatus? status,
    List<HarvestedSms>? messages,
    int? lastInsertedCount,
    String? errorMessage,
  }) {
    return SmsState(
      status: status ?? this.status,
      messages: messages ?? this.messages,
      lastInsertedCount: lastInsertedCount ?? this.lastInsertedCount,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        status,
        messages,
        lastInsertedCount,
        errorMessage,
      ];
}
