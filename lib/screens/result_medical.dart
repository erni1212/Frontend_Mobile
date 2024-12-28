import 'package:flutter/material.dart';

class ResultMedical extends StatefulWidget {
  const ResultMedical({super.key});

  @override
  _ResultMedicalState createState() => _ResultMedicalState();
}

class _ResultMedicalState extends State<ResultMedical> {
  int _currentIndex = 2;

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController npmController = TextEditingController();
    final TextEditingController heightController = TextEditingController();
    final TextEditingController weightController = TextEditingController();
    final TextEditingController bloodPressureController = TextEditingController();
    final TextEditingController temperatureController = TextEditingController();
    final TextEditingController minusPlusController = TextEditingController();
    final TextEditingController drugStatusController = TextEditingController();
    final TextEditingController healthStatusController = TextEditingController();
    final TextEditingController doctorRecommendationController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Hasil Pemeriksaan Kesehatan',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Input Hasil Pemeriksaan :',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              _buildTextField('Nama Mahasiswa', nameController),
              _buildTextField('NPM Mahasiswa', npmController),
              _buildTextField('Tinggi Badan (cm)', heightController),
              _buildTextField('Berat Badan (kg)', weightController),
              _buildTextField('Tekanan Darah (mmHg)', bloodPressureController),
              _buildTextField('Suhu Tubuh (°C)', temperatureController),
              _buildTextField('Minus/Plus (D)', minusPlusController),
              _buildTextField('Narkoba (Positif/Negatif)', drugStatusController),
              _buildTextField('Status Kesehatan (Sehat/Kurang Sehat)', healthStatusController),
              const SizedBox(height: 16),
              const Text(
                'Rekomendasi Dokter :',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: doctorRecommendationController,
                maxLines: 4,
                decoration: InputDecoration(
                  hintText: 'Masukkan rekomendasi dokter...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResultMedical2(
                          name: nameController.text,
                          npm: npmController.text,
                          height: heightController.text,
                          weight: weightController.text,
                          bloodPressure: bloodPressureController.text,
                          temperature: temperatureController.text,
                          minusPlus: minusPlusController.text,
                          drugStatus: drugStatusController.text,
                          healthStatus: healthStatusController.text,
                          doctorRecommendation: doctorRecommendationController.text,
                        ),
                      ),
                    );
                  },
                  child: const Text('Konfirmasi'),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.cyan,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: 'Schedule'),
          BottomNavigationBarItem(icon: Icon(Icons.check_box), label: 'Result'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
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
              Navigator.pushNamed(context, '/scheduleMedical');
              break;
            case 2:
              break;
            case 3:
              Navigator.pushNamed(context, '/profile');
              break;
          } // Navigation logic based on index here
        },
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
    );
  }
}

class ResultMedical2 extends StatelessWidget {
  final String name;
  final String npm;
  final String height;
  final String weight;
  final String bloodPressure;
  final String temperature;
  final String minusPlus;
  final String drugStatus;
  final String healthStatus;
  final String doctorRecommendation;

  const ResultMedical2({
    super.key,
    required this.name,
    required this.npm,
    required this.height,
    required this.weight,
    required this.bloodPressure,
    required this.temperature,
    required this.minusPlus,
    required this.drugStatus,
    required this.healthStatus,
    required this.doctorRecommendation,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Hasil Pemeriksaan Kesehatan'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Hasil Pemeriksaan :',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildResultRow('Nama Mahasiswa', name),
            _buildResultRow('NPM Mahasiswa', npm),
            _buildResultRow('Tinggi Badan', '$height cm'),
            _buildResultRow('Berat Badan', '$weight kg'),
            _buildResultRow('Tekanan Darah', '$bloodPressure mmHg'),
            _buildResultRow('Suhu Tubuh', '$temperature °C'),
            _buildResultRow('Minus/Plus', '$minusPlus D'),
            _buildResultRow('Narkoba', drugStatus),
            _buildResultRow('Status Kesehatan', healthStatus),
            const SizedBox(height: 16),
            const Text(
              'Rekomendasi Dokter :',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(doctorRecommendation),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.cyan,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: 'Schedule'),
          BottomNavigationBarItem(icon: Icon(Icons.check_box), label: 'Result'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black,
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushNamed(context, '/home');
              break;
            case 1:
              Navigator.pushNamed(context, '/scheduletMedical');
              break;
            case 2:
              break;
            case 3:
              Navigator.pushNamed(context, '/profile');
              break;
          } // Navigation logic based on index here
        },
      ),
    );
  }

  Widget _buildResultRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              '$label :',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(value),
          ),
        ],
      ),
    );
  }
}
