import 'package:flutter/material.dart';
import 'misi1_page.dart';

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
      body: Stack(
        children: [
          Positioned(
            top: 20.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Level 1',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Color(0xFF023C40),
                  ),
                ),
                SizedBox(height: 20.0),
                Text(
                  'Time: ${getFormattedTime()}',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Color(0xFF023C40),
                  ),
                ),
                if (questionIndex < questions.length)
                  SizedBox(height: 20.0),
                if (questionIndex < questions.length)
                  Text(
                    'Pertanyaan ${questionIndex + 1}',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Color(0xFF023C40),
                    ),
                  ),
                if (questionIndex < questions.length)
                  SizedBox(height: 40.0),
              ],
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (questionIndex < questions.length)
                  Text(
                    '${questions[questionIndex]['question']}',
                    style: TextStyle(fontSize: 20.0),
                  ),
                if (questionIndex < questions.length)
                  SizedBox(height: 20.0),
                if (questionIndex < questions.length)
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
                            color: Color(0xFF023C40), // Ubah warna latar belakang button
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
                if (questionIndex < questions.length)
                  SizedBox(height: 20.0),
                Positioned(
                  bottom: 40.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (questionIndex >= questions.length)
                        Text(
                          'Score: $score / 5',
                          style: TextStyle(fontSize: 18.0),
                        ),
                      if (questionIndex >= questions.length)
                        SizedBox(height: 40.0),
                      if (questionIndex >= questions.length)
                        ElevatedButton(
                          onPressed: () {
                            // Navigasi ke halaman Misi1Page
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Misi1Page(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xFF023C40),
                          ),
                          child: Text(
                            'Buka Peta Petualangan',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
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
            SizedBox(height: 40.0),
            ElevatedButton(
              onPressed: () {
                // Navigasi ke halaman Misi1Page
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Misi1Page(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF023C40),
              ),
              child: Text(
                'Buka Peta Petualangan',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
