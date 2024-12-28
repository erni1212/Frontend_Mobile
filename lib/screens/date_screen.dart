import 'package:flutter/material.dart';

class DateScreen extends StatelessWidget {
  final Function(DateTime) onDateSelected; // Tambahkan parameter callback

  const DateScreen({super.key, required this.onDateSelected}); // Tambahkan ke constructor

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
        title: Text('Jadwal Pemeriksaan Kesehatan',
            style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.cyan.shade100,
            padding: EdgeInsets.all(16.0),
            child: Center(
              child: Text(
                'Tanggal Pemeriksaan',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 14, // Total 14 dates as per the UI
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
                  child: ListTile(
                    title: Text('Tanggal ${index + 1}:'),
                    subtitle: Text(getScheduleStatus(index)),
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
        currentIndex: 1, // This indicates the "schedule" tab
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushNamed(context, '/home');
              break;
            case 1:
              break;
            case 2:
              Navigator.pushNamed(context, '/resultMedical');
              break;
            case 3:
              Navigator.pushNamed(context, '/profile');
              break;
          }
        },
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black,
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

  String getScheduleStatus(int index) {
    // Mock data for schedule status
    switch (index) {
      case 0:
        return 'Pagi Penuh, Siang Penuh';
      case 1:
        return 'Pagi Penuh, Siang Penuh';
      case 2:
        return 'Pagi Penuh';
      case 3:
        return 'Pagi Penuh, Siang Penuh';
      case 4:
        return 'Siang Penuh';
      case 5:
        return 'Siang Penuh';
      case 6:
        return 'Pagi Penuh';
      case 7:
        return 'Pagi Penuh';
      default:
        return '';
    }
  }
}
