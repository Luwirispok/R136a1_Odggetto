import 'package:flutter/material.dart';
import 'package:oggetto_r136a1/presentation/resources/app_colors.dart';

class QuestionWidget extends StatelessWidget {
  QuestionWidget({
    Key? key,
    required this.question,
    required this.indexAction,
    required this.totalQuestions,
    required this.score,
  }) : super(key: key);

  final String question;
  final int indexAction;
  final int totalQuestions;
  final int score;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.grey,
      child: Padding(
        padding: const EdgeInsets.all(9.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Вопрос',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    '${indexAction + 1}/$totalQuestions',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                  Spacer(),
                  Text(
                    'Верно: ${score}',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Text(
                '\n\n${question}',
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ]),
      ),
    );
  }
}
