import 'package:flutter/material.dart';

class AboutCard extends StatelessWidget {
  const AboutCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'About Random Practice',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w700,
              color: Color(0xFF1C1C1E),
              letterSpacing: -0.3,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Random practice mode selects questions from all subjects and previous years, helping you test your overall knowledge and get used to mixed question patterns — just like the real exam.',
            style: TextStyle(
              fontSize: 14,
              color: Color(0xFF6C6C70),
              fontWeight: FontWeight.w400,
              height: 1.55,
            ),
          ),
          const SizedBox(height: 16),
          _InfoRow(
            icon: Icons.shuffle_rounded,
            text: 'Questions shuffled from all topics',
          ),
          const SizedBox(height: 10),
          _InfoRow(
            icon: Icons.bar_chart_rounded,
            text: 'Tracks your accuracy & time spent',
          ),
          const SizedBox(height: 10),
          _InfoRow(
            icon: Icons.replay_rounded,
            text: 'Never repeats recent questions',
          ),
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const _InfoRow({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: const Color(0xFFF3D9FA),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: const Color(0xFF9C36B5), size: 17),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 13,
              color: Color(0xFF3A3A3C),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}