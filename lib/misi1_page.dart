import 'package:flutter/material.dart';
import 'pretest1misi1_page.dart';
import 'pretest2misi1_page.dart';
import 'pretest3misi1_page.dart';

class Misi1Page extends StatelessWidget {
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
                        Container(
                          color: Colors.black.withOpacity(0.3),
                          child: Container(
                            padding: EdgeInsets.all(25),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Tahap 1',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 23.0,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(height: 15),
                                Text(
                                  'Memahami Konsep Penjumlahan',
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
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(width: 10),
                                CircleElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            Pretest1misi1Page(),
                                      ),
                                    );
                                  },
                                  text: '1',
                                ),
                              ],
                            ),
                            SizedBox(height: 50),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CircleElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            Pretest2misi1Page(),
                                      ),
                                    );
                                  },
                                  text: '2',
                                ),
                              ],
                            ),
                            SizedBox(height: 50),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                CircleElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            Pretest3misi1Page(),
                                      ),
                                    );
                                  },
                                  text: '3',
                                ),
                                SizedBox(width: 10),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 40),
                        Container(
                          color: Colors.black.withOpacity(0.3),
                          child: Container(
                            padding: EdgeInsets.all(25),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Tahap 2',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 23.0,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(height: 15),
                                Text(
                                  'Memahami Penjumlahan Lanjutan',
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
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(width: 10),
                                CircleElevatedButton(
                                  onPressed: () {},
                                  text: '1',
                                ),
                              ],
                            ),
                            SizedBox(height: 50),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CircleElevatedButton(
                                  onPressed: () {},
                                  text: '2',
                                ),
                              ],
                            ),
                            SizedBox(height: 50),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                CircleElevatedButton(
                                  onPressed: () {},
                                  text: '3',
                                ),
                                SizedBox(width: 10),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 40),
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

class CircleElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const CircleElevatedButton({
    Key? key,
    required this.onPressed,
    required this.text,
  }) : super(key: key);

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
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 25.0,
          ),
        ),
      ),
    );
  }
}
