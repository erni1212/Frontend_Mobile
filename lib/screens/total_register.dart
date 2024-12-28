import 'package:flutter/material.dart';

class TotalRegister extends StatefulWidget {
  const TotalRegister({super.key});
  @override
  _TotalRegisterState createState() => _TotalRegisterState();
}

class _TotalRegisterState extends State<TotalRegister> {
  final List<int> jumlahMahasiswa = [
    100, 100, 50, 100, 50, 50, 50, 20, 6, 0, 0, 0, 0, 0, 0, 0, 0
  ];

  int _currentIndex = 1; // Index untuk 'Pendaftaran'

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Jumlah Pendaftar',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            color: Colors.cyan.shade100,
            padding: EdgeInsets.all(16.0),
            child: Center(
              child: Text(
                'Jumlah Pendaftar Per Tanggal',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: jumlahMahasiswa.length,
              itemBuilder: (context, index) {
                final tanggal = index + 1;
                final jumlah = jumlahMahasiswa[index];
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
                  child: ListTile(
                    title: Text('Tanggal $tanggal: ${jumlah > 0 ? "$jumlah Mahasiswa" : ""}'),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.cyan,
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex, // Menandakan tab "pendaftaran"
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          switch (index) {
            case 0:// Navigasi ke Home
              break;
            case 1:
              Navigator.pushNamed(context, '/scheduleMedical'); // Halaman ini
              break;
            case 2:
              Navigator.pushNamed(context, '/resultMedical'); // Halaman hasil
              break;
            case 3:
              Navigator.pushNamed(context, '/profile'); // Halaman profil
              break;
          }
        },
        items: [
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
      ),
    );
  }
}
