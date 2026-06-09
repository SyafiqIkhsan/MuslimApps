import 'package:flutter/material.dart';
import '../../core/app_colors.dart';

class AsmaulHusnaScreen extends StatelessWidget {
  const AsmaulHusnaScreen({super.key});
  
  final List<Map<String, String>> _asmaulHusnaList = const [
    {"id": "1", "latin": "Ar-Rahman", "arabic": "الرَّحْمَنُ", "meaning": "Yang Maha Pengasih"},
    {"id": "2", "latin": "Ar-Rahim", "arabic": "الرَّحِيمُ", "meaning": "Yang Maha Penyayang"},
    {"id": "3", "latin": "Al-Malik", "arabic": "الْمَلِكُ", "meaning": "Yang Maha Merajai"},
    {"id": "4", "latin": "Al-Quddus", "arabic": "الْقُدُّوسُ", "meaning": "Yang Maha Suci"},
    {"id": "5", "latin": "As-Salam", "arabic": "السَّلاَمُ", "meaning": "Yang Maha Memberi Kesejahteraan"},
    {"id": "6", "latin": "Al-Mu'min", "arabic": "الْمُؤْمِنُ", "meaning": "Yang Maha Memberi Keamanan"},
    {"id": "7", "latin": "Al-Muhaimin", "arabic": "الْمُهَيْمِنُ", "meaning": "Yang Maha Memelihara"},
    {"id": "8", "latin": "Al-Aziz", "arabic": "الْعَزِيزُ", "meaning": "Yang Maha Perkasa"},
    {"id": "9", "latin": "Al-Jabbar", "arabic": "الْجَبَّارُ", "meaning": "Yang Maha Gagah perkasa"},
    {"id": "10", "latin": "Al-Mutakabbir", "arabic": "الْمُتَكَبِّرُ", "meaning": "Yang Maha Memiliki Kebesaran"},
    {"id": "11", "latin": "Al-Khaliq", "arabic": "الْخَالِقُ", "meaning": "Yang Maha Pencipta"},
    {"id": "12", "latin": "Al-Bari'", "arabic": "الْبَارِئُ", "meaning": "Yang Maha Melepaskan (Membuat, Membentuk)"},
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