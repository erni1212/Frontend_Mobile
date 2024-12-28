import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  late String fullName, email, userType, password, confirmPassword;
  final List<String> userTypes = ['Mahasiswa', 'Tenaga Medis', 'Admin']; // Jenis pengguna baru
  String selectedUserType = 'Mahasiswa'; // Default jenis pengguna

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); // Kembali ke halaman login
          },
        ),
        title: const Text(
          'Registrasi Akun',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.cyan.shade100,
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildTextField('Nama Lengkap', false, (value) {
                    fullName = value!;
                  }),
                  const SizedBox(height: 10),
                  _buildTextField('Email', false, (value) {
                    email = value!;
                  }),
                  const SizedBox(height: 10),
                  _buildDropdownField('Jenis Pengguna'),
                  const SizedBox(height: 10),
                  _buildTextField('Password', true, (value) {
                    password = value!;
                  }),
                  const SizedBox(height: 10),
                  _buildTextField('Konfirmasi Password', true, (value) {
                    confirmPassword = value!;
                  }),
                  const SizedBox(height: 20),
                  _buildSubmitButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Fungsi untuk membuat TextField
  Widget _buildTextField(String labelText, bool isPassword, FormFieldSetter<String> onSaved) {
    return TextFormField(
      obscureText: isPassword,
      decoration: InputDecoration(
        labelText: labelText,
        border: const OutlineInputBorder(),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return '$labelText tidak boleh kosong';
        }
        return null;
      },
      onSaved: onSaved,
    );
  }

  // Fungsi untuk membuat DropdownField
  Widget _buildDropdownField(String labelText) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 5),
        DropdownButtonFormField<String>(
          value: selectedUserType,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
          ),
          items: userTypes
              .map((type) => DropdownMenuItem(
                    value: type,
                    child: Text(type),
                  ))
              .toList(),
          onChanged: (value) {
            setState(() {
              selectedUserType = value!;
            });
          },
          onSaved: (value) {
            userType = value!;
          },
        ),
      ],
    );
  }

  // Tombol Submit dengan efek hover dan klik
  Widget _buildSubmitButton() {
    return InkWell(
      onTap: () {
        if (_formKey.currentState!.validate()) {
          _formKey.currentState!.save();
          if (password == confirmPassword) {
            // Logika jika registrasi berhasil
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Akun berhasil dibuat!')),
            );
            Navigator.pop(context); // Kembali ke halaman login
          } else {
            // Logika jika password tidak cocok
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Password dan Konfirmasi Password tidak cocok!')),
            );
          }
        }
      },
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.cyan,
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Center(
          child: Text(
            'Daftar',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ),
    );
  }
}
