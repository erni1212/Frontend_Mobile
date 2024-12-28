import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final String userRole; // Tambahkan parameter untuk peran pengguna

  const HomeScreen({super.key, required this.userRole});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: const Text(
          'Beranda',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Navigasi kembali ke halaman login
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        color: Colors.cyan.shade100,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Halo, selamat datang di sistem pendaftaran pelayanan kesehatan mahasiswa baru Universitas Khairun',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 35.0),
            Expanded(
              child: ListView(
                children: [
                  if (userRole == 'Mahasiswa')
                    _buildMenuItem(
                      context,
                      icon: Icons.assignment,
                      title: 'Pendaftaran Pemeriksaan Kesehatan',
                      routeName: '/health',
                    ),
                  if (userRole == 'Admin' || userRole == 'Tenaga Medis')
                    _buildMenuItem(
                      context,
                      icon: Icons.assignment,
                      title: 'Pendaftaran Pemeriksaan Kesehatan',
                      routeName: '/total',
                    ),
                  if (userRole == 'Mahasiswa')
                    _buildMenuItem(
                      context,
                      icon: Icons.calendar_today,
                      title: 'Jadwal Pemeriksaan Kesehatan',
                      routeName: '/schedule',
                    ),
                  if (userRole == 'Admin')
                    _buildMenuItem(
                      context,
                      icon: Icons.calendar_today,
                      title: 'Jadwal Pemeriksaan Kesehatan',
                      routeName: '/scheduleAdmin',
                    ),
                  if (userRole == 'Tenaga Medis')
                    _buildMenuItem(
                      context,
                      icon: Icons.calendar_today,
                      title: 'Jadwal Pemeriksaan Kesehatan',
                      routeName: '/scheduleMedical',
                    ),
                  if (userRole == 'Mahasiswa')
                    _buildMenuItem(
                      context,
                      icon: Icons.check_box,
                      title: 'Hasil Pemeriksaan Kesehatan',
                      routeName: '/result',
                    ),
                  if (userRole == 'Admin')
                    _buildMenuItem(
                      context,
                      icon: Icons.check_box,
                      title: 'Hasil Pemeriksaan Kesehatan',
                      routeName: '/resultAdmin',
                    ),
                  if (userRole == 'Tenaga Medis')
                    _buildMenuItem(
                      context,
                      icon: Icons.check_box,
                      title: 'Hasil Pemeriksaan Kesehatan',
                      routeName: '/resultMedical',
                    ),
                ],
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
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black,
        onTap: (index) {
          switch (index) {
            case 0:
              break;
            case 1:
              if (userRole == 'Mahasiswa') {
                Navigator.pushNamed(context, '/scheduleScreen');
              } else if (userRole == 'Tenaga Medis') {
                Navigator.pushNamed(context, '/scheduleMedical');
              } else if (userRole == 'Admin') {
                Navigator.pushNamed(context, '/scheduleAdmin');
              }
              break;
            case 2:
              if (userRole == 'Mahasiswa') {
                Navigator.pushNamed(context, '/resultScreen');
              } else if (userRole == 'Tenaga Medis') {
                Navigator.pushNamed(context, '/resultMedical');
              } else if (userRole == 'Admin') {
                Navigator.pushNamed(context, '/resultAdmin');
              }
              break;
            case 3:
              Navigator.pushNamed(context, '/profile');
              break;
          }
        },
      ),
    );
  }

  Widget _buildMenuItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String routeName,
  }) {
    return Card(
      child: ListTile(
        leading: Icon(icon, color: Colors.cyan.shade500, size: 50.0),
        title: Text(title),
        onTap: () {
          Navigator.pushNamed(context, routeName);
        },
        contentPadding: const EdgeInsets.symmetric(vertical: 40.0),
      ),
    );
  }
}
