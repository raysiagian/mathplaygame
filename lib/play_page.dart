import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'profile_page.dart';
import 'home.dart';
import 'misi1_page.dart';
import 'misi2_page.dart';
import 'misi3_page.dart';
import 'misi4_page.dart';

class PlayPage extends StatefulWidget {
  String username = '';

  @override
  _PlayPageState createState() => _PlayPageState();
}

class _PlayPageState extends State<PlayPage> {
  int _currentIndex = 1; // Menandakan halaman Play pada indeks ke-1

  @override
  void initState() {
    super.initState();
    getUsername();
  }

  Future<void> getUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      widget.username = prefs.getString('username') ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    double cardWidth = screenWidth * 0.96; // Mengurangi 10% dari lebar layar

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF023C40),
        title: Column(
          children: [
            Column(
              children: [
                Text(
                  'Halo Penjelajah',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                Text(
                  widget.username,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Color(0xFF13877E),
          child: Padding(
            padding: EdgeInsets.only(top: 15),
            child: Column(
              children: [
                // Tambahkan 4 card di sini
                buildCard(
                  'img/misi1_card_image.png',
                  'Misi 1',
                  'Pegunungan Es',
                  cardWidth,
                  Misi1Page(),
                ),
                buildCard(
                  'img/misi2_card_image.png',
                  'Misi 2',
                  'Bukit Lava',
                  cardWidth,
                  Misi2Page(),
                ),
                buildCard(
                  'img/misi3_card_image.png',
                  'Misi 3',
                  'Samudra Atlantik',
                  cardWidth,
                  Misi3Page(),
                ),
                buildCard(
                  'img/misi4_card_image.png',
                  'Misi 4',
                  'Benteng Tanpa Celah',
                  cardWidth,
                  Misi4Page(),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFF023C40),
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            if (_currentIndex == 0) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
            } else if (_currentIndex == 2) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            }
          });
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: _currentIndex == 0
                ? Image.asset('img/home_on.png')
                : Image.asset('img/home_off.png'),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: _currentIndex == 1
                ? Image.asset('img/play_on.png')
                : Image.asset('img/play_off.png'),
            label: 'Play',
          ),
          BottomNavigationBarItem(
            icon: _currentIndex == 2
                ? Image.asset('img/profile_on.png')
                : Image.asset('img/profile_off.png'),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  Widget buildCard(String imagePath, String title, String subTitle,
      double width, Widget page) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      child: Container(
        height: 200,
        width: 400,
        margin: EdgeInsets.only(top: 10, left: 30, right: 30, bottom: 10),
        // Add margin to the top and bottom
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => page,
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            primary: Colors.transparent,
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            shadowColor: Colors.blue.withOpacity(0.0),
            elevation: 5,
          ),
          child: Container(
            height: 250,
            width: 450,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imagePath),
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            padding: EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  subTitle,
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}