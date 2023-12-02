import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'pretest1misi1_page.dart';
import 'pretest2misi1_page.dart';
import 'pretest3misi1_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LevelProgressService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> completeLevel(int level) async {
    try {
      User? user = _auth.currentUser;
      if (user != null) {
        await _firestore.collection('users').doc(user.uid).update({
          'levels': FieldValue.arrayUnion([level]),
        });
      }
    } catch (e) {
      print('Error updating level completion: $e');
    }
  }

  Future<List<bool>> getLevelCompletion() async {
    List<bool> levelCompletion = List.filled(3, false);

    try {
      User? user = _auth.currentUser;
      if (user != null) {
        DocumentSnapshot snapshot =
        await _firestore.collection('users').doc(user.uid).get();
        List<dynamic>? userLevels =
        (snapshot.data() as Map<String, dynamic>?)?['levels'] as List<dynamic>?;

        if (userLevels != null) {
          for (int i = 0; i < userLevels.length && i < levelCompletion.length; i++) {
            levelCompletion[i] = userLevels[i] ?? false;
          }
        }
      }
    } catch (e) {
      print('Error retrieving level completion: $e');
    }

    return levelCompletion;
  }
}

class Misi1Page extends StatefulWidget {
  @override
  _Misi1PageState createState() => _Misi1PageState();
}

class _Misi1PageState extends State<Misi1Page> {
  static List<bool> levelCompletionStatus = [false, false, false];
  static bool isLevelUnlocked = true; // Initially, all levels are unlocked
  final LevelProgressService _levelProgressService = LevelProgressService();

  void completeLevel(int level) {
    if (level < levelCompletionStatus.length) {
      setState(() {
        levelCompletionStatus[level - 1] = true;
        showToast('Level $level unlocked!');
        _levelProgressService.completeLevel(level);
      });
    }
  }

  void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.black.withOpacity(0.8),
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF13877E),
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('img/bg_mission_1.png'),
                fit: BoxFit.fill,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 40),
                  Container(
                    height: 70,
                    child: Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.arrow_back, color: Colors.white),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        SizedBox(width: 110.0),
                        Text(
                          'Misi 1',
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF023C40),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      children: [
                        TahapContainer(
                          tahap: 'Tahap 1',
                          description: 'Memahami Konsep Penjumlahan',
                          levelButtons: [
                            CircleLevelButton(
                              level: 1,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        Pretest1misi1Page(
                                            completeLevel: completeLevel),
                                  ),
                                ).then((value) {
                                  // Check if the level is completed
                                  if (value == true) {
                                    completeLevel(1);
                                  }
                                });
                              },
                              isUnlocked: true, // Level 1 is always unlocked
                            ),
                            CircleLevelButton(
                              level: 2,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        Pretest2misi1Page(
                                            completeLevel: completeLevel),
                                  ),
                                ).then((value) {
                                  // Check if the level is completed
                                  if (value == true) {
                                    completeLevel(2);
                                  }
                                });
                              },
                              isUnlocked: levelCompletionStatus[0],
                            ),
                            CircleLevelButton(
                              level: 3,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        Pretest3misi1Page(
                                            completeLevel: completeLevel),
                                  ),
                                ).then((value) {
                                  // Check if the level is completed
                                  if (value == true) {
                                    completeLevel(3);
                                  }
                                });
                              },
                              isUnlocked: levelCompletionStatus[1],
                            ),
                          ],
                        ),
                        TahapContainer(
                          tahap: 'Tahap 2',
                          description: 'Memahami Penjumlahan Lanjutan',
                          levelButtons: [
                            // NextLevelButton(
                            //   level: 4,
                            //   onPressed: () {
                            // Handle navigation to the next level
                            // For example: Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (BuildContext context) =>
                            //         NextLevelPage(),
                            //   ),
                            // );
                            //   },
                            // ),
                            // Add more levels as needed
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TahapContainer extends StatelessWidget {
  final String tahap;
  final String description;
  final List<CircleLevelButton> levelButtons;

  TahapContainer({
    required this.tahap,
    required this.description,
    required this.levelButtons,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          color: Colors.black.withOpacity(0.3),
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tahap,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 23.0,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 40),
        Column(
          children: levelButtons,
        ),
        SizedBox(height: 40),
      ],
    );
  }
}

class CircleLevelButton extends StatelessWidget {
  final int level;
  final VoidCallback onPressed;
  final bool isUnlocked;

  CircleLevelButton({
    required this.level,
    required this.onPressed,
    required this.isUnlocked,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        isUnlocked
            ? CircleLevelButtonWidget(
          level: level,
          onPressed: onPressed,
        )
            : CircleLockedButtonWidget(),
        SizedBox(width: 10),
      ],
    );
  }
}

class CircleLevelButtonWidget extends StatelessWidget {
  final int level;
  final VoidCallback onPressed;

  CircleLevelButtonWidget({
    required this.level,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      margin: EdgeInsets.all(10),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0),
          ),
          primary: Color(0xFF023C40), // Warna latar belakang button
        ),
        child: Text(
          level.toString(),
          style: TextStyle(
            fontSize: 25.0,
          ),
        ),
      ),
    );
  }
}

class CircleLockedButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey,
      ),
      child: Icon(
        Icons.lock,
        color: Colors.white,
        size: 40.0,
      ),
    );
  }
}
