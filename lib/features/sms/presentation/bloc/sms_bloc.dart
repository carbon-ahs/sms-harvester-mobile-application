import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/harvested_sms.dart';
import '../../domain/repositories/sms_repository.dart';

part 'sms_event.dart';
part 'sms_state.dart';

class SmsBloc extends Bloc<SmsEvent, SmsState> {
  SmsBloc(this._repository) : super(const SmsState()) {
    on<SmsStarted>(_onStarted);
    on<SmsScanRequested>(_onScanRequested);
  }

  final SmsRepository _repository;

  Future<void> _onStarted(SmsStarted event, Emitter<SmsState> emit) async {
    await _loadStored(emit);
  }

  Future<void> _onScanRequested(
    SmsScanRequested event,
    Emitter<SmsState> emit,
  ) async {
    emit(state.copyWith(status: SmsViewStatus.loading, errorMessage: null));

    final hasPermission = await _repository.ensureSmsPermission();
    if (!hasPermission) {
      emit(state.copyWith(status: SmsViewStatus.permissionDenied));
      return;
    }

    try {
      final insertedCount = await _repository.importInboxAndPendingIncoming();
      final messages = await _repository.watchStoredSmsSnapshot();
      emit(
        state.copyWith(
          status: SmsViewStatus.ready,
          messages: messages,
          lastInsertedCount: insertedCount,
        ),
      );
    } catch (error) {
      emit(
        state.copyWith(
          status: SmsViewStatus.failure,
          errorMessage: error.toString(),
        ),
      );
    }
  }

  Future<void> _loadStored(Emitter<SmsState> emit) async {
    try {
      final messages = await _repository.watchStoredSmsSnapshot();
      emit(state.copyWith(status: SmsViewStatus.ready, messages: messages));
    } catch (error) {
      emit(
        state.copyWith(
          status: SmsViewStatus.failure,
          errorMessage: error.toString(),
        ),
      );
    }
  }
}
