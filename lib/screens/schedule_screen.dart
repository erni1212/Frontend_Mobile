import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key});

  @override
  _ScheduleScreenState createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  DateTime _selectedDate = DateTime.now();
  String? _selectedTime;
  int _currentIndex = 1; // Indeks awal untuk 'Schedule'

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Jadwal Pemeriksaan Kesehatan', 
          style: TextStyle(
            fontWeight: FontWeight.bold, 
            color: Colors.black
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.cyan,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        color: Colors.cyan.shade100, // Warna latar belakang body
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Tanggal', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              SizedBox(height: 8.0),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white, // Warna latar belakang kalender
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 4,
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
                child: TableCalendar(
                  firstDay: DateTime.now(),
                  lastDay: DateTime.now().add(Duration(days: 365)),
                  focusedDay: _selectedDate,
                  calendarFormat: CalendarFormat.month,
                  selectedDayPredicate: (day) => isSameDay(day, _selectedDate),
                  onDaySelected: (selectedDay, focusedDay) {
                    setState(() {
                      _selectedDate = selectedDay;
                    });
                  },
                ),
              ),
              SizedBox(height: 14.0),
              Text('Waktu', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              SizedBox(height: 8.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _selectedTime == 'Pagi'
                          ? Colors.cyan.shade500
                          : Colors.grey.shade200,
                      foregroundColor: _selectedTime == 'Pagi'
                          ? Colors.white
                          : Colors.black,
                    ),
                    onPressed: () {
                      setState(() {
                        _selectedTime = 'Pagi';
                      });
                    },
                    child: Text('Pagi: 08:00 - 12:00'),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _selectedTime == 'Siang'
                          ? Colors.cyan.shade500
                          : Colors.grey.shade200,
                      foregroundColor: _selectedTime == 'Siang'
                          ? Colors.white
                          : Colors.black,
                    ),
                    onPressed: () {
                      setState(() {
                        _selectedTime = 'Siang';
                      });
                    },
                    child: Text('Siang: 14:00 - 16:30'),
                  ),
                ],
              ),
              SizedBox(height: 10.0),
              Text('Keterangan', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              SizedBox(height: 8.0),
              TextField(
                enabled: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: _selectedTime != null
                      ? 'Jadwal anda: ${_selectedDate.toLocal().toString().split(' ')[0]} - $_selectedTime'
                      : 'Pilih tanggal dan waktu',
                ),
              ),
              SizedBox(height: 10.0),
              Center(
                child: ElevatedButton(
                  onPressed: _selectedTime != null
                      ? () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                  'Jadwal berhasil dikonfirmasi: ${_selectedDate.toLocal().toString().split(' ')[0]} - $_selectedTime'),
                            ),
                          );
                        }
                      : null,
                  child: Text('Konfirmasi'),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.cyan,
        type: BottomNavigationBarType.fixed,
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
              // Tetap di halaman
              break;
            case 2:
              Navigator.pushNamed(context, '/result');
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
