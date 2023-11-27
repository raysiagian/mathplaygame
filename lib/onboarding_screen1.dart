import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login_page.dart';
import 'spalsh_screen.dart';

class OnboardingScreen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double buttonWidth = MediaQuery.of(context).size.width * 0.8;
    double buttonHeight = MediaQuery.of(context).size.width * 0.12;

    return Scaffold(
      body: Container(
        color: Color(0xFF13877E),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 70.0, right: 30, bottom: 50),
              child: Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () {
                    // Navigasi ke halaman onboarding 4
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => OnboardingScreen4()),
                    );
                  },
                  child: Flexible(
                    flex: 1,
                    child: Text(
                      'Lewati',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Di Kerajaan Ilmu Pengetahuan, di Provinsi Matematika. Hiduplah 4 Orang Sahabat. Mereka Hidup Bahagia',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 50.0),
            Container(
              child: Image.asset(
                'img/onboarding1_image.png',
                width: 600,
                height: 380,
                fit: BoxFit.fitHeight,
              ),
            ),
            SizedBox(height: 50.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OnboardingScreen2()),
                );
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(buttonWidth, buttonHeight),
                backgroundColor: Color(0xFF023A3F),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: Text('Selanjutnya'),
            ),
          ],
        ),
      ),
    );
  }
}



class OnboardingScreen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double buttonWidth = MediaQuery.of(context).size.width * 0.8;
    double buttonHeight = MediaQuery.of(context).size.width * 0.12;

    return Scaffold(
      body: Container(
        color: Color(0xFF13877E),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 70.0, right: 30, bottom: 50),
              child: Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () {
                    // Navigasi ke halaman onboarding 4
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => OnboardingScreen4()),
                    );
                  },
                  child: Flexible(
                    flex: 1,
                    child: Text(
                      'Lewati',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Sampai Suatu Saat, Musuh Datang Menangkap Tambah, Kali, Bagi, dan Kurang. Ia Ingin Menguasai Kerajaan',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 50.0),
            Container(
              child: Image.asset(
                'img/onboarding2_image.png',
                width: 600,
                height: 380,
                fit: BoxFit.fitHeight,
              ),
            ),
            SizedBox(height: 50.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OnboardingScreen3()),
                );
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(buttonWidth, buttonHeight),
                backgroundColor: Color(0xFF023A3F),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: Text('Selanjutnya'),
            ),
          ],
        ),
      ),
    );
  }
}


class OnboardingScreen3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double buttonWidth = MediaQuery.of(context).size.width * 0.8;
    double buttonHeight = MediaQuery.of(context).size.width * 0.12;

    return Scaffold(
      body: Container(
        color: Color(0xFF13877E),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 70.0, right: 30, bottom: 50),
              child: Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () {
                    // Navigasi ke halaman onboarding 4
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => OnboardingScreen4()),
                    );
                  },
                  child: Flexible(
                    flex: 1,
                    child: Text(
                      'Lewati',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'SpyCil, Seorang Mata-Mata Terkenal, Mengetahui Rencana Jahat Tersebut',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 50.0),
            Container(
              child: Image.asset(
                'img/onboarding3_image.png',
                width: 600,
                height: 380,
                fit: BoxFit.fitHeight,
              ),
            ),
            SizedBox(height: 50.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OnboardingScreen4()),
                );
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(buttonWidth, buttonHeight),
                backgroundColor: Color(0xFF023A3F),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: Text('Selanjutnya'),
            ),
          ],
        ),
      ),
    );
  }
}
class OnboardingScreen4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double buttonWidth = MediaQuery.of(context).size.width * 0.8;
    double buttonHeight = MediaQuery.of(context).size.width * 0.12;

    return Scaffold(
      body: Container(
        color: Color(0xFF13877E),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Kamu dan SpyCil Ditujuk Untuk Menyelamatkan Mereka. Petualanganmu Dimulai Dari Sekarang',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 50.0),
            Container(
              child: Image.asset(
                'img/onboarding4_image.png',
                width: 600,
                height: 380,
                fit: BoxFit.fitHeight,
              ),
            ),
            SizedBox(height: 50.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(buttonWidth, buttonHeight),
                backgroundColor: Color(0xFF023A3F),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: Text('Mulai'),
            ),
          ],
        ),
      ),
    );
  }
}