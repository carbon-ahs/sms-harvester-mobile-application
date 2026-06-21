import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/sms_bloc.dart';

class SmsPage extends StatelessWidget {
  const SmsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SMS Harvester'),
        actions: [
          IconButton(
            tooltip: 'Scan inbox',
            onPressed: () => context.read<SmsBloc>().add(
                  const SmsScanRequested(),
                ),
            icon: const Icon(Icons.sync),
          ),
        ],
      ),
      body: BlocBuilder<SmsBloc, SmsState>(
        builder: (context, state) {
          if (state.status == SmsViewStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.status == SmsViewStatus.permissionDenied) {
            return const _CenteredMessage(
              title: 'SMS permission denied',
              body: 'Allow SMS permission from Android settings and scan again.',
            );
          }

          if (state.status == SmsViewStatus.failure) {
            return _CenteredMessage(
              title: 'Scan failed',
              body: state.errorMessage ?? 'Unknown error',
            );
          }

          if (state.messages.isEmpty) {
            return const _CenteredMessage(
              title: 'No SMS stored yet',
              body: 'Tap the scan button to import inbox messages.',
            );
          }

          return Column(
            children: [
              _SummaryBar(
                totalCount: state.messages.length,
                lastInsertedCount: state.lastInsertedCount,
              ),
              Expanded(
                child: ListView.separated(
                  itemCount: state.messages.length,
                  separatorBuilder: (_, __) => const Divider(height: 1),
                  itemBuilder: (context, index) {
                    final message = state.messages[index];
                    return ListTile(
                      title: Text(message.address ?? 'Unknown sender'),
                      subtitle: Text(
                        message.body,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      trailing: Text(
                        _formatDate(message.date),
                        textAlign: TextAlign.end,
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.read<SmsBloc>().add(const SmsScanRequested()),
        icon: const Icon(Icons.download),
        label: const Text('Scan'),
      ),
    );
  }

  static String _formatDate(DateTime date) {
    final month = date.month.toString().padLeft(2, '0');
    final day = date.day.toString().padLeft(2, '0');
    final hour = date.hour.toString().padLeft(2, '0');
    final minute = date.minute.toString().padLeft(2, '0');
    return '$day/$month\n$hour:$minute';
  }
}

class _SummaryBar extends StatelessWidget {
  const _SummaryBar({
    required this.totalCount,
    required this.lastInsertedCount,
  });

  final int totalCount;
  final int lastInsertedCount;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).colorScheme.surfaceContainerHighest,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Row(
          children: [
            Expanded(child: Text('Stored: $totalCount')),
            Text('New: $lastInsertedCount'),
          ],
        ),
      ),
    );
  }
}

class _CenteredMessage extends StatelessWidget {
  const _CenteredMessage({
    required this.title,
    required this.body,
  });

  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            Text(
              body,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
