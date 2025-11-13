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
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: selected ? Color(0xFFC4BFF9) : Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.white),
          ),
          child: Row(
            children: [
              selected
                  ? Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: const Color(0xFF231F3E),
                      ),
                      child: Icon(Icons.check, color: Colors.white),
                    )
                  : Icon(Icons.radio_button_off),

              const SizedBox(width: 12),
              Text(
                answerText,
                style: const TextStyle(
                  color: const Color(0xFF231F3E),
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
