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
    double screenWidth = MediaQuery.of(context).size.width;
    double cardWidth = screenWidth * 0.96; // Mengurangi 10% dari lebar layar

    return Scaffold(
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
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
        ),
        backgroundColor: Color(0xFF023C40),
      ),
      body: Container(
        color: Color(0xFF13877E),
        child: Padding(
          padding: EdgeInsets.only(top: 15),
          child: Column(
            children: [
              // Tambahkan 4 card di sini
              buildCard('img/misi1_card_image.png', 'Misi 1', 'Pegunungan Es', cardWidth, Misi1Page()),
              buildCard('img/misi2_card_image.png', 'Misi 2', 'Pegunungan Es', cardWidth, Misi2Page()),
              buildCard('img/misi3_card_image.png', 'Misi 3', 'Pegunungan Es', cardWidth, Misi3Page()),
              buildCard('img/misi4_card_image.png', 'Misi 4', 'Pegunungan Es', cardWidth, Misi4Page()),
            ],
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
                ? Image.asset('img/home_on.png') // Replace with the path to your active icon
                : Image.asset('img/home_off.png'), // Replace with the path to your inactive icon
            label: 'Home',
            // selectedIconTheme: IconThemeData(color: Colors.white), // Set the color of the active icon
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.play_circle_fill),
            label: 'Play',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  Widget buildCard(String imagePath, String title, String subTitle, double width, Widget page) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 60),
        height: 142,
        width: width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 8),
            Text(
              subTitle,
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
