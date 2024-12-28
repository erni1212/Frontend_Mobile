import 'package:flutter/material.dart';

class ResultAdmin2 extends StatefulWidget {
  const ResultAdmin2({super.key});

  @override
  _ResultMedical2State createState() => _ResultMedical2State();
}

class _ResultMedical2State extends State<ResultAdmin2> {
  int _currentIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hasil Pemeriksaan Kesehatan'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hasil Pemeriksaan :',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Nama Mahasiswa : [Nama]', style: TextStyle(fontSize: 16)),
                  Text('NPM Mahasiswa : [NPM]', style: TextStyle(fontSize: 16)),
                  Text('Tinggi Badan : [Tinggi] cm', style: TextStyle(fontSize: 16)),
                  Text('Berat Badan : [Berat] Kg', style: TextStyle(fontSize: 16)),
                  Text('Tekanan Darah : [Tekanan] mmHg', style: TextStyle(fontSize: 16)),
                  Text('Suhu Tubuh : [Suhu] °C', style: TextStyle(fontSize: 16)),
                  Text('Buta Warna : [Buta Warna]', style: TextStyle(fontSize: 16)),
                  Text('Minus/Plus : [Minus/Plus] D', style: TextStyle(fontSize: 16)),
                  Text('Narkoba : [Positif/Negatif]', style: TextStyle(fontSize: 16)),
                  Text('Status Kesehatan : [Sehat/Kurang Sehat]', style: TextStyle(fontSize: 16)),
                ],
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Rekomendasi Dokter :',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Text(
                '[Rekomendasi]',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.cyan,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Schedule',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check_box),
            label: 'Result',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _currentIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          switch (index) {
            case 0:
              Navigator.pushNamed(context, '/home');
              break;
            case 1:
              Navigator.pushNamed(context, '/scheduleAdmin');
              break;
            case 2:
              // Stay on this screen
              break;
            case 3:
              Navigator.pushNamed(context, '/profile');
              break;
          }
        },
      ),
    );
  }
}
