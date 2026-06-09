import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:adhan/adhan.dart';
import '../../core/app_colors.dart';
import '../../data/prayer_service.dart';
import 'quran_screen.dart'; // Pastikan import ini ada

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PrayerService _prayerService = PrayerService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder<PrayerTimes>(
          future: _prayerService.getPrayerTimes(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator(color: AppColors.accentGold));
            }
            if (snapshot.hasError) {
              return const Center(child: Text("Gagal mengambil data", style: TextStyle(color: Colors.white)));
            }

            final prayers = snapshot.data!;
            return SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader(),
                  const SizedBox(height: 25),
                  _buildPrayerCard(prayers),
                  const SizedBox(height: 25),
                  _buildWeeklySummary(),
                  const SizedBox(height: 25),
                  _buildMenuGrid(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Assalamu Alaikum!", 
              style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
            Text(DateFormat('EEEE, d MMMM').format(DateTime.now()), 
              style: const TextStyle(color: Colors.white70, fontSize: 14)),
          ],
        ),
        const CircleAvatar(
          backgroundColor: AppColors.secondaryEmerald,
          child: Icon(Icons.notifications_none, color: AppColors.accentGold),
        )
      ],
    );
  }

  Widget _buildPrayerCard(PrayerTimes prayers) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.secondaryEmerald,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _prayerTimeItem("Subuh", prayers.fajr),
          _prayerTimeItem("Dzuhur", prayers.dhuhr),
          _prayerTimeItem("Ashar", prayers.asr),
          _prayerTimeItem("Maghrib", prayers.maghrib),
          _prayerTimeItem("Isya", prayers.isha),
        ],
      ),
    );
  }

  Widget _prayerTimeItem(String name, DateTime time) {
    return Column(
      children: [
        Text(name, style: const TextStyle(color: Colors.white70, fontSize: 10)),
        Text(DateFormat.Hm().format(time), 
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _buildWeeklySummary() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.backgroundLight,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          const Text("Weekly Counter Summary", style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(7, (i) => Container(
              width: 10, height: 40, 
              decoration: BoxDecoration(color: i == 3 ? AppColors.accentGold : Colors.grey[300], borderRadius: BorderRadius.circular(5))
            )),
          )
        ],
      ),
    );
  }

  Widget _buildMenuGrid() {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      crossAxisSpacing: 15,
      mainAxisSpacing: 15,
      children: [
        _buildMenuCard("Al-Quran", Icons.menu_book, onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const QuranScreen()));
        }),
        _buildMenuCard("Doa-Doa", Icons.front_hand_outlined),
        _buildMenuCard("Asmaul Husna", Icons.auto_awesome),
        _buildMenuCard("Tasbih", Icons.fingerprint),
      ],
    );
  }

  Widget _buildMenuCard(String title, IconData icon, {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.05),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.white10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: AppColors.accentGold, size: 30),
            const SizedBox(height: 10),
            Text(title, style: const TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}