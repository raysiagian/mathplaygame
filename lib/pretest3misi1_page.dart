import 'package:flutter/material.dart';
import 'misi1_page.dart';

const Color primaryColor = Color(0xFF023C40);
const Color buttonColor = Color(0xFF023A3F);
const int countdownDuration = 10;

class Pretest3misi1Page extends StatefulWidget {
  final void Function(int) completeLevel;

  Pretest3misi1Page({required this.completeLevel});

  @override
  _Pretest3misi1PageState createState() => _Pretest3misi1PageState();
}

class _Pretest3misi1PageState extends State<Pretest3misi1Page> {
  int questionIndex = 0;
  int score = 0;
  bool isAnswered = false;

  List<Map<String, dynamic>> questions = [
    {'question': '1 + 1 = ?', 'options': ['2', '3', '4', '5'], 'correctIndex': 0},
    {'question': '2 + 3 = ?', 'options': ['4', '5', '6', '7'], 'correctIndex': 1},
    {'question': '4 + 2 = ?', 'options': ['5', '6', '7', '8'], 'correctIndex': 1},
    {'question': '3 + 3 = ?', 'options': ['5', '6', '7', '8'], 'correctIndex': 1},
    {'question': '5 + 4 = ?', 'options': ['8', '5', '9', '11'], 'correctIndex': 3},
  ];

  int countdown = countdownDuration;

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
        if (!isAnswered) {
          goToNextQuestion();
        }
      }
    });
  }

  void goToNextQuestion() {
    if (questionIndex < questions.length - 1) {
      setState(() {
        questionIndex++;
        countdown = countdownDuration;
        isAnswered = false;
      });
      startCountdown();
    } else {
      showResultPage();
    }
  }

  void showResultPage() {
    widget.completeLevel(1); // Notify Misi1Page about the completion of level 1
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => ResultPage(
          completeLevel: widget.completeLevel,
          score: score,
          questions: questions,
        ),
      ),
    );
  }

  void checkAnswer(int selectedOption) {
    if (!isAnswered) {
      if (selectedOption == questions[questionIndex]['correctIndex']) {
        setState(() {
          score++;
        });
      }
      setState(() {
        isAnswered = true;
      });
      goToNextQuestion();
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double timeBarWidth = 0.9 * screenWidth;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text('Level 1', style: TextStyle(color: primaryColor)),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Container(),
      ),
      body: Stack(
        children: [
          Positioned(
            top: 20.0,
            left: 20.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Time: ${countdown}s',
                  style: TextStyle(fontSize: 16.0, color: primaryColor),
                ),
                if (questionIndex < questions.length) SizedBox(height: 20.0),
                if (questionIndex < questions.length)
                  Text(
                    'Pertanyaan ${questionIndex + 1}',
                    style: TextStyle(fontSize: 20.0, color: primaryColor),
                  ),
                if (questionIndex < questions.length) SizedBox(height: 40.0),
                if (questionIndex < questions.length)
                  Container(
                    width: timeBarWidth,
                    height: 10.0,
                    alignment: Alignment.center,
                    child: LinearProgressIndicator(
                      value: countdown / countdownDuration,
                      valueColor: AlwaysStoppedAnimation<Color>(primaryColor),
                      backgroundColor: Colors.grey,
                    ),
                  ),
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
                if (questionIndex < questions.length) SizedBox(height: 20.0),
                if (questionIndex < questions.length)
                  Wrap(
                    spacing: 25.0,
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
                            color: primaryColor,
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
                if (questionIndex >= questions.length) SizedBox(height: 50.0),
                if (questionIndex >= questions.length)
                  Image.asset('img/misiselesai_image.png'),
                if (questionIndex >= questions.length) SizedBox(height: 20.0),
                if (questionIndex >= questions.length)
                  Text(
                    'Hebat, Kamu Benar $score dari ${questions.length}',
                    style: TextStyle(fontSize: 20.0),
                  ),
                if (questionIndex >= questions.length) SizedBox(height: 40.0),
                if (questionIndex >= questions.length)
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Misi1Page(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: buttonColor,
                      minimumSize: Size(
                        screenWidth * 0.9,
                        MediaQuery.of(context).size.height * 0.1,
                      ),
                    ),
                    child: Text('Buka peta petualangan'),
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
  final List<Map<String, dynamic>> questions;
  final void Function(int) completeLevel;

  ResultPage({
    required this.completeLevel,
    required this.score,
    required this.questions,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text('Level 1 Selesai', style: TextStyle(color: primaryColor)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Container(),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 50.0),
            Image.asset('img/misiselesai_image.png'),
            SizedBox(height: 20.0),
            Text(
              'Hebat, Kamu Benar $score dari ${questions.length}',
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 40.0),
            ElevatedButton(
              onPressed: () {
                completeLevel(1); // Notify Misi1Page about the completion of level 1
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Misi1Page(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(
                  MediaQuery.of(context).size.width * 0.8,
                  MediaQuery.of(context).size.width * 0.12,
                ),
                backgroundColor: Color(0xFF023A3F),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: Text('Buka Peta Petualangan'),
            ),
          ],
        ),
      ),
    );
  }
}
