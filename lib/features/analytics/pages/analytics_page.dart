import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/analytics_bloc.dart';
import '../widgets/analytics_header.dart';
import '../widgets/analytics_stats_grid.dart';
import '../widgets/weekly_activity_card.dart';

class AnalyticsPage extends StatelessWidget {
  const AnalyticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AnalyticsBloc()..add(AnalyticsLoadRequested()),
      child: const _AnalyticsView(),
    );
  }
}

class _AnalyticsView extends StatelessWidget {
  const _AnalyticsView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F7),
      body: Column(
        children: [
          const AnalyticsHeader(),
          Expanded(
            child: BlocBuilder<AnalyticsBloc, AnalyticsState>(
              builder: (context, state) {
                if (state is AnalyticsLoading || state is AnalyticsInitial) {
                  return const _LoadingBody();
                }
                if (state is AnalyticsError) {
                  return _ErrorBody(message: state.message);
                }
                if (state is AnalyticsLoaded) {
                  return _LoadedBody(state: state);
                }
                return const SizedBox.shrink();
              },
            ),
          ),
        ],
      ),
    );
  }
}

// ── Loading ───────────────────────────────────────────────────────────────────
class _LoadingBody extends StatelessWidget {
  const _LoadingBody();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: Color(0xFF9C36B5),
        strokeWidth: 2.5,
      ),
    );
  }
}

// ── Error ─────────────────────────────────────────────────────────────────────
class _ErrorBody extends StatelessWidget {
  final String message;
  const _ErrorBody({required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.error_outline_rounded,
                color: Color(0xFFFA5252), size: 48),
            const SizedBox(height: 12),
            Text(
              'Failed to load stats',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1C1C1E),
              ),
            ),
            const SizedBox(height: 6),
            Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 13, color: Color(0xFF8E8E93)),
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () => context
                  .read<AnalyticsBloc>()
                  .add(AnalyticsLoadRequested()),
              child: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Loaded ────────────────────────────────────────────────────────────────────
class _LoadedBody extends StatelessWidget {
  final AnalyticsLoaded state;
  const _LoadedBody({required this.state});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: const Color(0xFF9C36B5),
      onRefresh: () async =>
          context.read<AnalyticsBloc>().add(AnalyticsLoadRequested()),
      child: ListView(
        padding: const EdgeInsets.fromLTRB(16, 20, 16, 32),
        children: [
          // 2×2 stat grid
          AnalyticsStatsGrid(overall: state.overall),

          const SizedBox(height: 16),

          // Weekly bar chart
          WeeklyActivityCard(weekly: state.weekly),

          const SizedBox(height: 16),
        ],
      ),
    );
  }
}