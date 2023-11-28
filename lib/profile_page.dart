import 'package:flutter/material.dart';
import 'profile_page.dart';
import 'home.dart';
import 'play_page.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _currentIndex = 2; // Menandakan halaman Profile pada indeks ke-2

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Page'),
      ),
      body: Center(
        child: Text('This is the Profile Page'),
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
            } else if (_currentIndex == 1) { // Change from 0 to 1 for the Play icon
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => PlayPage()),
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
            icon: _currentIndex == 1
                ? Image.asset('img/play_on.png') // Replace with the path to your active icon
                : Image.asset('img/play_off.png'), // Replace with the path to your inactive icon
            label: 'Play',
          ),
          BottomNavigationBarItem(
            icon: _currentIndex == 2
                ? Image.asset('img/profile_on.png') // Replace with the path to your active icon
                : Image.asset('img/profile_off.png'), // Replace with the path to your inactive icon
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
