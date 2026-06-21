import 'package:get_it/get_it.dart';

import '../../features/sms/data/datasources/device_sms_data_source.dart';
import '../../features/sms/data/datasources/local_sms_data_source.dart';
import '../../features/sms/data/repositories/sms_repository_impl.dart';
import '../../features/sms/domain/repositories/sms_repository.dart';
import '../../features/sms/presentation/bloc/sms_bloc.dart';
import '../database/app_database.dart';
import '../platform/sms_platform_channel.dart';

final getIt = GetIt.instance;

Future<void> configureDependencies() async {
  getIt
    ..registerLazySingleton<AppDatabase>(AppDatabase.new)
    ..registerLazySingleton<SmsPlatformChannel>(SmsPlatformChannel.new)
    ..registerLazySingleton<DeviceSmsDataSource>(
      () => DeviceSmsDataSource(getIt<SmsPlatformChannel>()),
    )
    ..registerLazySingleton<LocalSmsDataSource>(
      () => LocalSmsDataSource(getIt<AppDatabase>()),
    )
    ..registerLazySingleton<SmsRepository>(
      () => SmsRepositoryImpl(
        deviceDataSource: getIt<DeviceSmsDataSource>(),
        localDataSource: getIt<LocalSmsDataSource>(),
      ),
    )
    ..registerFactory<SmsBloc>(() => SmsBloc(getIt<SmsRepository>()));
}
