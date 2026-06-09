import 'package:flutter/material.dart';
import '../../core/app_colors.dart';

class AsmaulHusnaScreen extends StatelessWidget {
  const AsmaulHusnaScreen({super.key});

  // Contoh data lokal, kamu bisa melengkapinya nanti sampai 99
  final List<Map<String, String>> _asmaulHusnaList = const [
    {"id": "1", "latin": "Ar-Rahman", "arabic": "الرَّحْمَنُ", "meaning": "Yang Maha Pengasih"},
    {"id": "2", "latin": "Ar-Rahim", "arabic": "الرَّحِيمُ", "meaning": "Yang Maha Penyayang"},
    {"id": "3", "latin": "Al-Malik", "arabic": "الْمَلِكُ", "meaning": "Yang Maha Merajai"},
    {"id": "4", "latin": "Al-Quddus", "arabic": "الْقُدُّوسُ", "meaning": "Yang Maha Suci"},
    {"id": "5", "latin": "As-Salam", "arabic": "السَّلاَمُ", "meaning": "Yang Maha Memberi Kesejahteraan"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryEmerald,
      appBar: AppBar(
        title: const Text("Asmaul Husna", style: TextStyle(color: Colors.white)),
        backgroundColor: AppColors.primaryEmerald,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(15),
        itemCount: _asmaulHusnaList.length,
        itemBuilder: (context, index) {
          final item = _asmaulHusnaList[index];
          return Card(
            color: AppColors.secondaryEmerald,
            margin: const EdgeInsets.only(bottom: 12),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: AppColors.primaryEmerald,
                child: Text(item["id"]!, style: const TextStyle(color: AppColors.accentGold)),
              ),
              title: Text(item["latin"]!, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              subtitle: Text(item["meaning"]!, style: const TextStyle(color: Colors.white70, fontSize: 12)),
              trailing: Text(item["arabic"]!, style: const TextStyle(color: AppColors.accentGold, fontSize: 20, fontWeight: FontWeight.bold)),
            ),
          );
        },
      ),
    );
  }
}