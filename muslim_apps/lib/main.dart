import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'core/app_colors.dart';
import 'presentation/screens/home_screen.dart';

void main() {
  runApp(const MuslimApp());
}

class MuslimApp extends StatelessWidget {
  const MuslimApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Muslim App',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.primaryEmerald,
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: const HomeScreen(),
    );
  }
}