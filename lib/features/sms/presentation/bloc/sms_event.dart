part of 'sms_bloc.dart';

sealed class SmsEvent extends Equatable {
  const SmsEvent();

  @override
  List<Object?> get props => [];
}

final class SmsStarted extends SmsEvent {
  const SmsStarted();
}

final class SmsAppResumed extends SmsEvent {
  const SmsAppResumed();
}

final class SmsScanRequested extends SmsEvent {
  const SmsScanRequested();
}
