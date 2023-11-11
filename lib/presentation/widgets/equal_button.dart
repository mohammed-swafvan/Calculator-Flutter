import 'package:flutter/material.dart';

class EqualButton extends StatelessWidget {
  const EqualButton({super.key, this.buttonText, required this.buttonTap});

  final String? buttonText;
  final Function()? buttonTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: InkWell(
        onTap: buttonTap,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Container(
            color: const Color.fromARGB(255, 243, 106, 16),
            child: Center(
              child: Text(buttonText!, style: Theme.of(context).textTheme.headlineLarge),
            ),
          ),
        ),
      ),
    );
  }
}
