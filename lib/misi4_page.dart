import 'package:flutter/material.dart';

class Misi4Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Misi 4'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Detail Misi 4',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Deskripsi misi 4 akan ditampilkan di sini.',
              style: TextStyle(fontSize: 16),
            ),
            // Tambahkan widget atau konten lain sesuai kebutuhan
          ],
        ),
      ),
    );
  }
}
