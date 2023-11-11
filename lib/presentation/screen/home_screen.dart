import 'package:calculator/presentation/widgets/equal_button.dart';
import 'package:calculator/presentation/widgets/operator_button.dart';
import 'package:calculator/presentation/widgets/value_button.dart';
import 'package:calculator/provider/calculator_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: screenHeight,
          width: screenWidth,
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: SizedBox(
                    width: screenWidth,
                    child: Consumer<CalculatorNotifier>(builder: (context, provider, _) {
                      return Padding(
                        padding: EdgeInsets.only(right: screenWidth * 0.05, bottom: 12),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Flexible(
                              child: Text(
                                provider.questionHandler,
                                style: Theme.of(context).textTheme.displayMedium,
                              ),
                            ),
                            Flexible(
                              child: Text(
                                provider.answerHandler,
                                style: Theme.of(context).textTheme.displaySmall,
                              ),
                            ),
                          ],
                        ),
                      );
                    })),
              ),
              Expanded(
                flex: 4,
                child: Consumer<CalculatorNotifier>(
                  builder: (context, provider, _) {
                    return GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
                      itemCount: provider.buttonList.length,
                      itemBuilder: (context, index) {
                        if (provider.buttonList[index] == 'x' ||
                            provider.buttonList[index] == '--' ||
                            provider.buttonList[index] == '+' ||
                            provider.buttonList[index] == '/') {
                          return OperatorButton(
                            buttonTap: () {
                              print("buttonList[index] ============= ${provider.buttonList[index]}");
                              if (provider.questionHandler == '0') {
                                provider.questionHandler = '';
                                provider.questionHandler += provider.buttonList[index];
                              } else {
                                provider.questionHandler += provider.buttonList[index];
                              }
                            },
                            buttonText: provider.buttonList[index],
                          );
                        } else if (provider.buttonList[index] == '=') {
                          return EqualButton(
                            buttonTap: () {
                              provider.equalPressed(provider.questionHandler);
                            },
                            buttonText: provider.buttonList[index],
                          );
                        }
                        return ValueButton(
                          buttonTap: provider.buttonList[index] == ''
                              ? null
                              : () {
                                  print("buttonList[index] ============= ${provider.buttonList[index]}");
                                  if (provider.buttonList[index] == 'C') {
                                    provider.questionHandler = '0';
                                    provider.answerHandler = '0';
                                  } else if (provider.buttonList[index] == 'Del') {
                                    if (provider.questionHandler == '') {
                                      provider.questionHandler = '0';
                                      provider.answerHandler = '0';
                                    } else if (provider.questionHandler.length == 1) {
                                      provider.questionHandler = '0';
                                      provider.answerHandler = '0';
                                    } else {
                                      provider.questionHandler =
                                          provider.questionHandler.substring(0, provider.questionHandler.length - 1);
                                      provider.answerHandler = '0';
                                    }
                                  } else {
                                    if (provider.questionHandler == '0') {
                                      provider.questionHandler = '';
                                      provider.questionHandler += provider.buttonList[index];
                                    } else {
                                      provider.questionHandler += provider.buttonList[index];
                                    }
                                  }
                                  print(provider.questionHandler);
                                },
                          buttonText: provider.buttonList[index],
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
