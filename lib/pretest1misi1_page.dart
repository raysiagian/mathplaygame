import 'package:flutter/material.dart';

class Pretest1misi1Page extends StatefulWidget {
  @override
  _Pretest1misi1PageState createState() => _Pretest1misi1PageState();
}

class _Pretest1misi1PageState extends State<Pretest1misi1Page> {
  int questionIndex = 0;
  int score = 0;

  List<Map<String, dynamic>> questions = [
    {
      'question': '1 + 1 = ?',
      'options': ['2', '3', '4', '5'],
      'correctIndex': 0,
    },
    {
      'question': '2 + 3 = ?',
      'options': ['4', '5', '6', '7'],
      'correctIndex': 1,
    },
    {
      'question': '4 + 2 = ?',
      'options': ['5', '6', '7', '8'],
      'correctIndex': 2,
    },
    {
      'question': '3 + 3 = ?',
      'options': ['5', '6', '7', '8'],
      'correctIndex': 3,
    },
    {
      'question': '5 + 4 = ?',
      'options': ['8', '9', '10', '11'],
      'correctIndex': 1,
    },
  ];

  int countdown = 10;

  @override
  void initState() {
    super.initState();
    startCountdown();
  }

  void startCountdown() {
    Future.delayed(Duration(seconds: 1), () {
      if (countdown > 0) {
        setState(() {
          countdown--;
        });
        startCountdown();
      } else {
        goToNextQuestion();
      }
    });
  }

  void goToNextQuestion() {
    if (questionIndex < questions.length - 1) {
      setState(() {
        questionIndex++;
        countdown = 10;
      });
      startCountdown();
    } else {
      showResultPage();
    }
  }

  void showResultPage() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => ResultPage(score: score),
      ),
    );
  }

  void checkAnswer(int selectedOption) {
    if (selectedOption == questions[questionIndex]['correctIndex']) {
      setState(() {
        score++;
      });
    }
    goToNextQuestion();
  }

  String getFormattedTime() {
    int minutes = countdown ~/ 60;
    int seconds = countdown % 60;
    return '$minutes:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pretest 1 Misi 1'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Question ${questionIndex + 1}: ${questions[questionIndex]['question']}',
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 20.0),
            Text(
              'Time remaining: ${getFormattedTime()}',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 20.0),
            Wrap(
              spacing: 10.0,
              runSpacing: 10.0,
              children: List.generate(
                4,
                    (index) => GestureDetector(
                  onTap: () => checkAnswer(index),
                  child: Container(
                    width: 50.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue, // You can customize the color
                    ),
                    child: Center(
                      child: Text(
                        questions[questionIndex]['options'][index],
                        style: TextStyle(fontSize: 16.0, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ResultPage extends StatelessWidget {
  final int score;

  ResultPage({required this.score});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Result Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Mission Completed!',
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 20.0),
            Text(
              'Score: $score / 5',
              style: TextStyle(fontSize: 18.0),
            ),
          ],
        ),
      ),
    );
  }
}
