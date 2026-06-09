import 'package:flutter/material.dart';
import '../../core/app_colors.dart';

class TasbihScreen extends StatefulWidget {
  const TasbihScreen({super.key});

  @override
  State<TasbihScreen> createState() => _TasbihScreenState();
}

class _TasbihScreenState extends State<TasbihScreen> {
  int _counter = 0;
  String _currentZikir = "Subhanallah";

  void _incrementCounter() {
    setState(() {
      _counter++;
      if (_counter == 33) {
        // Otomatis ganti zikir setelah 33 kali
        if (_currentZikir == "Subhanallah") {
          _currentZikir = "Alhamdulillah";
          _counter = 0;
        } else if (_currentZikir == "Alhamdulillah") {
          _currentZikir = "Allahu Akbar";
          _counter = 0;
        } else {
          _currentZikir = "Subhanallah";
          _counter = 0;
        }
      }
    });
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryEmerald,
      appBar: AppBar(
        title: const Text("Tasbih Digital", style: TextStyle(color: Colors.white)),
        backgroundColor: AppColors.primaryEmerald,
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh, color: AppColors.accentGold),
            onPressed: _resetCounter,
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_currentZikir, style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            const Text("Target: 33 Kali", style: TextStyle(color: Colors.white60, fontSize: 14)),
            const SizedBox(height: 50),
            
            // Tombol Penghitung Lingkaran Besar
            GestureDetector(
              onTap: _incrementCounter,
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  color: AppColors.secondaryEmerald,
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.accentGold, width: 4),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.accentGold.withOpacity(0.2),
                      blurRadius: 20,
                      spreadRadius: 5,
                    )
                  ],
                ),
                child: Center(
                  child: Text(
                    "$_counter",
                    style: const TextStyle(color: Colors.white, fontSize: 48, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
            const Text("Ketuk lingkaran untuk berhitung", style: TextStyle(color: Colors.white70, fontSize: 14)),
          ],
        ),
      ),
    );
  }
}