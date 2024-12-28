import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'screens/login_screen.dart';
import 'screens/forgot_password.dart';
import 'screens/registration.dart';
import 'screens/home_screen.dart';
import 'screens/health_registration.dart';
import 'screens/total_register.dart';
import 'screens/schedule_screen.dart';
import 'screens/schedule_admin.dart';
import 'screens/schedule_medical.dart';
import 'screens/result_screen.dart';
import 'screens/result_medical.dart';
import 'screens/result_admin.dart';
import 'screens/profile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sistem Pendaftaran Pelayanan Kesehatan',
      theme: ThemeData(
        primaryColor: Colors.cyan.shade100,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/login': (context) => LoginScreen(),
        '/forgot': (context) => ForgotPassword(),
        '/register': (context) => RegistrationScreen(),
        '/home': (context) => HomeScreen(userRole: '',),
        '/health': (context) => HealthRegistration(),
        '/total': (context) => TotalRegister(),
        '/schedule': (context) => ScheduleScreen(),
        '/scheduleAdmin': (context) => ScheduleAdmin(),
        '/scheduleMedical': (context) => ScheduleMedical(),
        '/result': (context) => ResultScreen(),
        '/resultAdmin': (context) => ResultAdmin(),
        '/resultMedical': (context) => ResultMedical(),
        '/profile': (context) => ProfileScreen(userRole: '',),
      },
    );
  }
}
