import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/previous_year_bloc.dart';
import '../widgets/header.dart';
import '../widgets/year_card.dart';



class PreviousYearQuestionsPage extends StatelessWidget {
  const PreviousYearQuestionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const _PreviousYearView();
  }
}

class _PreviousYearView extends StatelessWidget {
  const _PreviousYearView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F7),
      body: Column(
        children: [
          Header(),
          Expanded(
            child: BlocBuilder<PreviousYearBloc, PreviousYearState>(
              builder: (context, state) {
                if (state is PreviousYearLoading || state is PreviousYearInitial) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (state is PreviousYearError) {
                  return Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.error_outline,
                            size: 48, color: Color(0xFFAEAEB2)),
                        const SizedBox(height: 12),
                        Text(
                          state.message,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Color(0xFF8E8E93),
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextButton.icon(
                          onPressed: () => context
                              .read<PreviousYearBloc>()
                              .add(FetchPreviousYearExams()),
                          icon: const Icon(Icons.refresh_rounded),
                          label: const Text('Retry'),
                        ),
                      ],
                    ),
                  );
                }

                if (state is PreviousYearLoaded) {
                  final papers = state.papers;
                  return ListView.separated(
                    padding: const EdgeInsets.fromLTRB(16, 20, 16, 32),
                    itemCount: papers.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 12),
                    itemBuilder: (context, index) {
                      return YearCard(paper: papers[index], index: index);
                    },
                  );
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