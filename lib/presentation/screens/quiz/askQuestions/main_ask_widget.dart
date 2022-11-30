import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:oggetto_r136a1/presentation/resources/app_colors.dart';
import 'package:oggetto_r136a1/presentation/screens/quiz/askQuestions/ask_ques.dart';
import 'package:oggetto_r136a1/presentation/screens/quiz/askQuestions/custom_ask_card.dart';
import 'package:oggetto_r136a1/presentation/screens/quiz/askQuestions/float_ask.dart';
import 'package:oggetto_r136a1/presentation/screens/quiz/models/model.dart';

class MainAskWidget extends StatefulWidget {
  MainAskWidget({super.key});

  @override
  State<MainAskWidget> createState() => _MainAskWidgetState();
}

class _MainAskWidgetState extends State<MainAskWidget> {
  List<QuizQuestion> data = [
    QuizQuestion(
      title: 'Сколько лет сотрудник name работает в нашей компании 1?',
      options: {
        '>1 года': false,
        '<1 года': false,
        '<2 лет': false,
        '4 лет': false,
        '4+ лет': false,
      },
    ),
    QuizQuestion(
      title: 'Сколькими языками владеет сотрудник name 2?',
      options: {
        '1': false,
        '2': false,
        '3': false,
        '4': false,
        '5 и более вопросов': false,
      },
    ),
    QuizQuestion(
      title: 'Главное в людях для сотрудника 3?',
      options: {
        'Ум и Креативность': false,
        'Добрата и честность': false,
        'Красота здоровье': false,
        'Власть и богатство': false,
        'Смелость и упорство': false,
        'Юмор и жизнелюбие': false,
      },
    ),
    QuizQuestion(
      title: 'Любимый фильм сотрудника 4?',
      options: {
        'Интерстелларр': false,
        'Богемская рапсодия': false,
        'Война бесконечности': false,
        'Начало': false,
        'Зелёная Миля': false,
        'Форест Гамп': false,
        'Назад в будущее': false,
        'Властелин Колец': false,
        'Темный рыцарь': false,
        'Побег из Шоушенка': false,
        'Остров проклятых': false,
        'Джентельмены': false,
        'Титаник': false,
        'Ходячий замок': false,
        'Леон': false,
        'Назад в будущее': false,
        'Матрица': false,
        'Пианист': false,
        'Ваш ответ?': false,
      },
    ),
    QuizQuestion(
      title: 'Любимая игра у сотрудник name 5?',
      options: {
        'Тетрис': false,
        'Шахматы': false,
        'Apex': false,
        'Dota': false,
        'God of War': false,
        'Клуб романтики': false,
        'Симс': false,
        'PUBG': false,
        'Skyrim': false,
        'GTA': false,
        'Minecraft': false,
        'Assassin Creed': false,
        'Watch Dogs': false,
        'War zone': false,
        'Far Cry': false,
        'Dishonored': false,
        'Halo': false,
        'Battlefield': false,
        'Overwatch': false,
        'Ваш ответ?': false,
      },
    ),
  ];

  Future<void> sendData(data) async {
    DatabaseReference ref = FirebaseDatabase.instance.ref('/Quiz');
    await ref.set(data.toJson());
  }

  void checkAnswerAndUpdate(
    int index,
    int sepIndex,
    String name,
  ) {
    for (String el in data[index].options.keys) {
      data[index].options[el] = false;
    }
    data[index].options[name] = true;

    print(data[index].options);
    data[index].options;
    setState(() {
      isPressed = true;
    });
    score++;
  }

  void next() {
    if (score == 5) {
      sendData(data);
      setState(() {
        score = 0;
      });
    }
    if (index == data.length - 1) {
      return;
    } else {
      if (isPressed) {
        setState(() {
          index++;
          isPressed = false;
          isAlreadySelected = false;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Пожалуйста выберите ответ'),
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.symmetric(vertical: 20.0),
        ));
      }
    }
  }

  int index = 0;
  bool isPressed = false;
  int score = 0;
  bool isAlreadySelected = false;
  final correct = Colors.green;
  final incorrect = AppColors.grey;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                AskQuestionWidget(
                  indexAction: index,
                  question: data[index].title,
                  totalQuestions: data.length,
                ),
                Divider(
                  color: Colors.white,
                ),
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.61,
                  child: ListView.separated(
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (BuildContext context, int sepIndex) {
                        return GestureDetector(
                          onTap: () => checkAnswerAndUpdate(index, sepIndex,
                              data[index].options.keys.toList()[sepIndex]),
                          child: CustomAskCardWidget(
                            isInput:
                                data[index].options.keys.toList()[sepIndex] ==
                                    'Ваш ответ?',
                            onChange: (text) {
                              data[index].options.remove(
                                  data[index].options.keys.toList()[sepIndex]);
                              data[index].options.addAll({text: true});
                            },
                            option: data[index].options.keys.toList()[sepIndex],
                            color: isPressed
                                ? data[index]
                                            .options
                                            .values
                                            .toList()[sepIndex] ==
                                        true
                                    ? correct
                                    : incorrect
                                : AppColors.grey,
                          ),
                        );
                      },
                      separatorBuilder:
                          (BuildContext context, int sepBuildIndex) {
                        return SizedBox(
                          height: 10,
                        );
                      },
                      itemCount: data[index].options.keys.toList().length),
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatAsk(
        text: 'Далее',
        onTap: next,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
