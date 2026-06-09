import 'package:flutter/material.dart';
import '../../core/app_colors.dart';

class DoaScreen extends StatelessWidget {
  const DoaScreen({super.key});

  final List<Map<String, String>> _doaList = const [
    {
      "title": "Doa Sebelum Makan",
      "arabic": "اللَّهُمَّ بَارِكْ لَنَا فِيمَا رَزَقْتَنَا وَقِنَا عَذَابَ النَّارِ",
      "translation": "Ya Allah, berkahilah kami dalam rezeki yang Telah Engkau berikan kepada kami dan peliharalah kami dari siksa neraka."
    },
    {
      "title": "Doa Bangun Tidur",
      "arabic": "الْحَمْدُ لِلَّهِ الَّذِي أَحْيَانَا بَعْدَ مَا أَمَاتَنَا وَإِلَيْهِ النُّشُورُ",
      "translation": "Segala puji bagi Allah yang menghidupkan kami kembali setelah mematikan kami dan kepada-Nya kami akan dibangkitkan."
    },
    {
      "title": "Doa Keluar Rumah",
      "arabic": "بِسْمِ اللهِ تَوَكَّلْتُ عَلَى اللهِ لاَ حَوْلَ وَلاَ قُوَّةَ إِلاَّ بِاللهِ",
      "translation": "Dengan nama Allah, aku bertawakal kepada Allah, tiada daya dan kekuatan melainkan dengan pertolongan Allah."
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryEmerald,
      appBar: AppBar(
        title: const Text("Doa-Doa Harian", style: TextStyle(color: Colors.white)),
        backgroundColor: AppColors.primaryEmerald,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(15),
        itemCount: _doaList.length,
        itemBuilder: (context, index) {
          final doa = _doaList[index];
          return ExpansionTile(
            iconColor: AppColors.accentGold,
            collapsedIconColor: Colors.white,
            title: Text(doa["title"]!, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            backgroundColor: AppColors.secondaryEmerald,
            collapsedBackgroundColor: AppColors.secondaryEmerald.withOpacity(0.5),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            collapsedShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      doa["arabic"]!, 
                      style: const TextStyle(
                        color: AppColors.accentGold, 
                        fontSize: 18, 
                        fontWeight: FontWeight.bold
                      ), 
                      textAlign: TextAlign.end, 
                    ),
                    const SizedBox(height: 10),
                    Text(doa["translation"]!, style: const TextStyle(color: Colors.white70, fontSize: 13), textAlign: TextAlign.start),
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}