import 'package:flutter/material.dart';

import '../../previous_year_questions/widgets/header.dart';
import '../widgets/about_card.dart';
import '../widgets/session_card.dart';


class SessionOption {
  final int questions;
  final int approxMins;

  const SessionOption({required this.questions, required this.approxMins});
}

const List<SessionOption> sessions = [
  SessionOption(questions: 10, approxMins: 5),
  SessionOption(questions: 25, approxMins: 12),
  SessionOption(questions: 50, approxMins: 25),
  SessionOption(questions: 100, approxMins: 50),
];

// ── Screen ────────────────────────────────────────────────────────────────────
class RandomQuestionsPage extends StatelessWidget {
  const RandomQuestionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F7),
      body: Column(
        children: [
          Header(),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.fromLTRB(16, 20, 16, 32),
              children: [
                // Session option cards
                ...sessions.map((s) => Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: SessionCard(session: s),
                    )),

                const SizedBox(height: 8),

                AboutCard(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
