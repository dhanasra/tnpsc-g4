
import 'package:flutter/material.dart';

class OptionTile extends StatelessWidget {
  final String optionKey;
  final String label;
  final bool isSelected;
  final Color bgColor;
  final Color borderColor;
  final Color radioColor;
  final VoidCallback onTap;

  const OptionTile({
    super.key, 
    required this.optionKey,
    required this.label,
    required this.isSelected,
    required this.bgColor,
    required this.borderColor,
    required this.radioColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: borderColor, width: 1.5),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            // Option key badge (A/B/C/D)
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: radioColor, width: 2),
                color: isSelected
                    ? radioColor.withOpacity(0.12)
                    : Colors.transparent,
              ),
              alignment: Alignment.center,
              child: Text(
                optionKey,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: radioColor,
                ),
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: isSelected
                      ? const Color(0xFF1C1C1E)
                      : const Color(0xFF3A3A3C),
                  letterSpacing: -0.1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}