import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'profile_page.dart';
import 'play_page.dart';

void main() {
  runApp(MyApp());
}

class GlobalColors {
  static const Color secondColor = Color(0xFF13877E);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String username = '';
  IconData activeIcon = Icons.home; // Track the active icon

  @override
  void initState() {
    super.initState();
    getUsername();
  }

  Future<void> getUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      username = prefs.getString('username') ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double leftPadding = 0.05 * screenWidth; // 5% dari lebar layar
    double rightPadding = 0.05 * screenWidth; // 5% dari lebar layar

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue,
              ),
              child: Icon(
                Icons.person,
                color: Colors.white,
              ),
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Selamat Datang',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                Text(
                  username,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      backgroundColor: GlobalColors.secondColor,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'img/home_image.png',
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 300,
                  height: 300,
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            child: Padding(
              padding: EdgeInsets.only(left: leftPadding),
              child: Row(
                children: [
                  Column(
                    children: [
                      CardWithIcons(activeIcon: activeIcon),
                    ],
                  ),
                  SizedBox(width: rightPadding), // Jarak antara CardWithIcons dan ContainerCard
                  ContainerCard(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ContainerCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 150,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Selamat Datang Pahlawan',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => PlayPage()),
              );
            },
            style: ElevatedButton.styleFrom(
              primary: GlobalColors.secondColor,
            ),
            child: Text(
              'Lanjutkan Misi',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

class CardWithIcons extends StatelessWidget {
  final IconData activeIcon;

  const CardWithIcons({Key? key, required this.activeIcon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: Container(
        width: 70,
        height: 300,
        decoration: BoxDecoration(
          color: Color(0xFF023C40),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(50),
            topLeft: Radius.circular(50),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
              child: Column(
                children: [
                  Image.asset(
                    activeIcon == Icons.home
                        ? 'img/home_on.png'
                        : 'img/home_off.png',
                    width: 50.0,
                    height: 50.0,
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Home',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => PlayPage()),
                );
              },
              child: Column(
                children: [
                  Image.asset(
                    'img/play_off.png', // Placeholder image
                    width: 50.0,
                    height: 50.0,
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Play', // Placeholder label
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage()),
                );
              },
              child: Column(
                children: [
                  Image.asset(
                    'img/profile_off.png', // Placeholder image
                    width: 50.0,
                    height: 50.0,
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Profile', // Placeholder label
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
