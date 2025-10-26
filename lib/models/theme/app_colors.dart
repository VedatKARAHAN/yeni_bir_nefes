import 'package:flutter/material.dart';

class AppColors {
  // KULLANIM: AppBar (üst bar), BottomNavigator (alt bar), ana butonlar (örn: "Bugün İçmedim"),
  // ana ilerleme çubukları (progress bar).
  static const Color primary = Color(0xFF1DE9B6); // Canlı Nane Yeşili

  // İKİNCİL RENK (Secondary): Sakinliği, gökyüzünü ve stresi azaltmayı temsil eder.
  // KULLANIM: Aktif olan sekmeler (tabs), seçili filtreler,
  // bilgi kartlarının başlıkları veya 'Haftalık Rapor' gibi ikincil alanlar.
  static const Color secondary = Color(0xFFB3E5FC); // Açık Gökyüzü Mavisi

  // ARKA PLAN (Background): Temizliği, ferahlığı ve 'yeni bir boş sayfayı' simgeler.
  // KULLANIM: Tüm ekranların ana arka plan rengi. Göz yormaz.
  static const Color background = Color(0xFFF0FDFB); // Çok Açık Nane/Buz Rengi

  // VURGU RENGİ (Accent): Motivasyonu, başarıyı ve pozitif enerjiyi temsil eder.
  // KULLANIM: Başarımlar (kazanılan rozetler), 'sigara içilmeyen gün' sayacı,
  // "TEBRİKLER!" kartları veya acil durum butonu kenarlıkları.
  static const Color accent = Color(0xFFFFE082); // Sıcak Güneş Sarısı

  // KOYU METİN (TextDark): Saf siyahtan daha yumuşak, göz yormayan okuma rengi.
  // KULLANIM: 'background' gibi açık renkli zeminler üzerindeki tüm ana metinler,
  // başlıklar ve paragraflar için.
  static const Color textDark = Color(0xFF37474F); // Koyu Mavi-Gri

  // AÇIK METİN (TextLight): Yüksek kontrast için kullanılır.
  // KULLANIM: 'primary' gibi koyu renkli butonların veya koyu arka planların
  // (eğer varsa) üzerindeki yazılar için.
  static const Color textLight = Colors.white;
}
