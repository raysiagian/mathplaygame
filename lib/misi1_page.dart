import 'package:flutter/material.dart';

class Misi1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Misi 1'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Detail Misi 1',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Deskripsi misi 1 akan ditampilkan di sini.',
              style: TextStyle(fontSize: 16),
            ),
            // Tambahkan widget atau konten lain sesuai kebutuhan
          ],
        ),
      ),
    );
  }
}
