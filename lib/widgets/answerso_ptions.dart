import 'package:flutter/material.dart';

class OptionButton extends StatelessWidget {
  final bool selected;
  final VoidCallback onTap;
  final String answerText;

  const OptionButton({
    super.key,
    required this.selected,
    required this.onTap,
    required this.answerText,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: selected ? const Color(0xFFC4BFF9) : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.white),
        ),
        child: Row(
          children: [
            selected
                ? Container(
                    width: 20,
                    height: 20,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFF231F3E),
                    ),
                    child: const Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 16,
                    ),
                  )
                : const Icon(Icons.radio_button_off, size: 20),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                answerText,
                style: const TextStyle(color: Color(0xFF231F3E), fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
