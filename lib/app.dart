import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/di/service_locator.dart';
import 'features/sms/presentation/bloc/sms_bloc.dart';
import 'features/sms/presentation/pages/sms_page.dart';

class SmsHarvesterApp extends StatelessWidget {
  const SmsHarvesterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SMS Harvester',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF1F6F5B)),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (_) => getIt<SmsBloc>()..add(const SmsStarted()),
        child: const SmsPage(),
      ),
    );
  }
}
