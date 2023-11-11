import 'package:flutter/material.dart';

class ValueButton extends StatelessWidget {
  const ValueButton({super.key, this.buttonText, required this.buttonTap});

  final String? buttonText;
  final Function()? buttonTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: InkWell(
        onTap: buttonTap,
        highlightColor: Colors.green.shade100,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Container(
            color: buttonText == 'C' || buttonText == 'Del' || buttonText == '%' ? Colors.grey.shade300 : Colors.transparent,
            child: Center(
              child: Text(
                buttonText!,
                style: buttonText == 'C' || buttonText == 'Del' || buttonText == '%'
                    ? Theme.of(context).textTheme.headlineMedium
                    : Theme.of(context).textTheme.headlineSmall?.copyWith(fontSize: 34),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
