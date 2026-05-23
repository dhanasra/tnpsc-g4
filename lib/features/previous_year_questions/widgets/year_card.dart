import 'package:flutter/material.dart';

import '../../../app/routes/app_routes.dart';
import '../../../app/routes/route_names.dart';
import '../../../core/models/exam_paper_model.dart';
import '../../../core/models/quiz_question.dart';

const _accentPairs = [
  (Color(0xFF3B5BDB), Color(0xFFE8EDFF)),
  (Color(0xFF2F9E44), Color(0xFFDCF5E4)),
  (Color(0xFF9C36B5), Color(0xFFF3D9FA)),
  (Color(0xFFE8590C), Color(0xFFFFECDE)),
  (Color(0xFF1098AD), Color(0xFFD3F9F9)),
  (Color(0xFFD6336C), Color(0xFFFFDEEB)),
];

(Color, Color) _accentFor(int index) => _accentPairs[index % _accentPairs.length];

class YearCard extends StatelessWidget {
  final ExamPaper paper;
  final int index;


  const YearCard({super.key, required this.paper, required this.index});

  @override
  Widget build(BuildContext context) {
    final (color, bgColor) = _accentFor(index);
    final shortYear = paper.year % 100; // e.g. 2024 → 24

    return GestureDetector(
      onTap: ()=>AppRoutes.push(context, RouteNames.quiz, arguments: {
        'type': QuizType.previousYear,
        'paperCode': paper.paperCode,
      }),
      child: Container(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 12,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            // Year badge
            Container(
              width: 54,
              height: 54,
              decoration: BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.circular(14),
              ),
              alignment: Alignment.center,
              child: Text(
                '$shortYear',
                style: TextStyle(
                  color: color,
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  letterSpacing: -0.5,
                ),
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    paper.title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF1C1C1E),
                      letterSpacing: -0.2,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    paper.paperCode,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Color(0xFF8E8E93),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  if (paper.isPremium) ...[
                    const SizedBox(height: 4),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFF3CD),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Text(
                        'Premium',
                        style: TextStyle(
                          fontSize: 11,
                          color: Color(0xFFB8860B),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 14,
              color: Color(0xFFAEAEB2),
            ),
          ],
        ),
      ),
    );
  }
}