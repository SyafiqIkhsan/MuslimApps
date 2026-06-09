import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../core/app_colors.dart';
import '../../data/models/surah_models.dart';

class QuranScreen extends StatelessWidget {
  const QuranScreen({super.key});

  Future<List<Surah>> fetchSurah() async {
    final response = await http.get(Uri.parse('https://equran.id/api/v2/surat'));
    if (response.statusCode == 200) {
      List data = json.decode(response.body)['data'];
      return data.map((json) => Surah.fromJson(json)).toList();
    } else {
      throw Exception('Gagal memuat daftar surah');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Al-Quran", style: TextStyle(color: Colors.white)),
        backgroundColor: AppColors.primaryEmerald,
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
      ),
      body: FutureBuilder<List<Surah>>(
        future: fetchSurah(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator(color: AppColors.accentGold));
          }
          if (snapshot.hasError) return Center(child: Text("Error: ${snapshot.error}"));

          return ListView.separated(
            itemCount: snapshot.data!.length,
            separatorBuilder: (context, index) => Divider(color: Colors.white.withOpacity(0.1)),
            itemBuilder: (context, index) {
              final surah = snapshot.data![index];
              return ListTile(
                leading: CircleAvatar(
                  backgroundColor: AppColors.secondaryEmerald,
                  child: Text("${surah.nomor}", style: const TextStyle(color: AppColors.accentGold)),
                ),
                title: Text(surah.namaLatin, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                subtitle: Text("${surah.tempatTurun} • ${surah.jumlahAyat} Ayat", style: const TextStyle(color: Colors.white70)),
                trailing: Text(surah.nama, style: const TextStyle(color: AppColors.accentGold, fontSize: 20, fontFamily: 'Amiri')), // Gunakan font Arab jika ada
                onTap: () {
                  // Nanti kita arahkan ke halaman Detail Ayat
                },
              );
            },
          );
        },
      ),
    );
  }
}