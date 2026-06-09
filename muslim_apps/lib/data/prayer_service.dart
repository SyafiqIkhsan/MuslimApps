import 'package:adhan/adhan.dart';
import 'package:geolocator/geolocator.dart';

class PrayerService {
  Future<PrayerTimes> getPrayerTimes() async {
    // 1. Ambil Lokasi (Default ke Cianjur jika GPS mati)
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low);

    // 2. Tentukan Koordinat
    final coordinates = Coordinates(position.latitude, position.longitude);

    // 3. Konfigurasi Parameter (Untuk Indonesia biasanya KEMENAG/Singapore)
    final params = CalculationMethod.singapore.getParameters();
    params.madhab = Madhab.shafi;

    // 4. Hitung Waktu Solat berdasarkan tanggal sekarang
    final prayerTimes = PrayerTimes.today(coordinates, params);
    
    return prayerTimes;
  }
}