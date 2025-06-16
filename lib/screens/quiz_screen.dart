import 'package:flutter/material.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _currentQuestion = 0;

  final List<Map<String, dynamic>> _questions = [
    {
      'question': 'O que é uma variável?',
      'options': ['Um valor fixo', 'Um tipo de dado', 'Um espaço para armazenar valores', 'Um operador'],
      'answer': 2,
    },
    {
      'question': 'Qual símbolo é usado para comparação em Dart?',
      'options': ['=', '==', '!=', '<>'],
      'answer': 1,
    },
    {
      'question': 'Qual estrutura usamos para repetir algo várias vezes?',
      'options': ['if', 'switch', 'for', 'case'],
      'answer': 2,
    },
  ];

  int _selectedIndex = -1;
  bool _answered = false;

  void _nextQuestion() {
    setState(() {
      _currentQuestion++;
      _selectedIndex = -1;
      _answered = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final questionData = _questions[_currentQuestion];
    final colorMain = const Color(0xFF2F5961);
    final colorButton = const Color(0xFFE57373);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz'),
        backgroundColor: colorMain,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Pergunta ${_currentQuestion + 1}/${_questions.length}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Text(
              questionData['question'],
              style: const TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ...List.generate(
              questionData['options'].length,
              (index) {
                final isSelected = _selectedIndex == index;
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6.0),
                  child: ElevatedButton(
                    onPressed: _answered
                        ? null
                        : () {
                            setState(() {
                              _selectedIndex = index;
                              _answered = true;
                            });
                          },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isSelected ? colorButton : colorMain.withOpacity(0.8),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: Text(
                      questionData['options'][index],
                      style: const TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 30),
            if (_answered)
              ElevatedButton(
                onPressed: () {
                  if (_currentQuestion < _questions.length - 1) {
                    _nextQuestion();
                  } else {
                    Navigator.pop(context);
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: Text(
                  _currentQuestion < _questions.length - 1 ? 'Próxima' : 'Finalizar',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
