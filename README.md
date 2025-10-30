# 🌿 Yeni Bir Nefes  
**Mobil Sigara Bırakma Destek Uygulaması**

📅 **Hazırlanma Tarihi:** 15.10.2025  
📱 **Platform:** Flutter (Android & iOS)  
☁️ **Backend:** Firebase (Authentication + Cloud Firestore)

---

## 📖 Proje Özeti ve Amacı
**Yeni Bir Nefes**, sigarayı bırakmak isteyen bireylere dijital destek ve motivasyon sunmayı amaçlayan bir mobil uygulamadır.  
Uygulama, kullanıcıların sigarayı bırakma sürecindeki ilerlemelerini takip etmelerini, elde ettikleri maddi tasarrufu görmelerini ve motive kalmalarını sağlar.  

Modern, kullanıcı dostu ve sade bir arayüz tasarımıyla hem işlevsel hem de duygusal destek sunmayı hedeflemektedir. 🌱

---

## 🎯 Hedef Kitle
Sigarayı bırakmak isteyen veya bu süreçte ek motivasyona ihtiyaç duyan her yaştan birey.

---

## ⚙️ Temel Özellikler

### 👤 Kullanıcı Yönetimi (Authentication)
- E-posta ve şifreyle güvenli **kayıt olma** ve **giriş yapma** işlemleri  
- Firebase Authentication altyapısı ile güvenli kimlik doğrulama  

### 🚀 Başlangıç Bilgileri (Onboarding)
İlk girişte kullanıcıdan şu bilgiler alınır:  
- Günde içilen ortalama sigara adedi  
- Sigara paketinin fiyatı  

Bu bilgiler ilerlemenin doğru hesaplanmasını sağlar.

### 📊 Ana Panel (Dashboard)
Kullanıcının anlık ilerlemesini gösterir:  
- **⏳ Sigarasız Geçen Süre:** Gün, saat, dakika olarak  
- **🚭 İçilmeyen Sigara Sayısı:** Toplam kaç sigaradan uzak durulduğu  
- **💰 Elde Edilen Maddi Tasarruf:** Kaç TL kazanç sağlandığı  

### 🕊️ “Sigarayı Şimdi Bırak” Aksiyonu
- Kullanıcı butona bastığında bırakma tarihi/saatini kaydeder.  
- Tüm sayaçlar bu andan itibaren çalışmaya başlar.  
- Gerçek zamanlı olarak ilerleme güncellenir.  

### ☁️ Verilerin Bulutta Saklanması
- Kullanıcı verileri Firebase **Cloud Firestore**’da saklanır.  
- Kullanıcı farklı cihazlardan giriş yaptığında bile verilerine erişebilir.  

---

## 🔄 Kullanıcı Akışı
1. Uygulama açıldığında **“Giriş Yap”** veya **“Kaydol”** seçenekleri görülür.  
2. Yeni kullanıcı kayıt olur ve **başlangıç bilgilerini** girer.  
3. Ana panelde büyük bir **“Sigarayı Şimdi Bırak”** butonu bulunur.  
4. Butona basıldığında sayaçlar başlar ve kullanıcı ilerlemesini anlık olarak takip eder.  
5. Uygulama her açıldığında güncel veriler otomatik olarak gösterilir.  

---

## 🧩 Kullanılan Teknolojiler

| Teknoloji | Açıklama |
|------------|-----------|
| **Dart** | Programlama dili |
| **Flutter** | Mobil çatı (Android & iOS desteği) |
| **Firebase Authentication** | Güvenli kullanıcı kaydı ve girişi |
| **Cloud Firestore** | Kullanıcı verilerinin bulutta saklanması |

---

## 💡 Gelecek Güncellemeler (Planlanan Özellikler)
- 🎯 Günlük motivasyon bildirimleri  
- 🏅 Başarı rozetleri (1 hafta, 1 ay, 1000 TL kazanç vb.)  
- 📆 İlerleme grafikleri  
- ☁️ Google hesabı ile giriş seçeneği  

---

## 👨‍💻 Geliştirici
**Vedat Karahan**  
📚 Bandırma Onyedi Eylül Üniversitesi – Bilgisayar Programcılığı  
📧 vedatkarahan.ai@gmail.com  
🌐 [LinkedIn](https://www.linkedin.com/in/vedat-karahan) | [GitHub](https://github.com/Vedat-KARAHAN)

---

> 🌱 “Her bırakılan sigara, yeni bir nefes demektir.”  
> _Yeni Bir Nefes – Sigarasız bir hayat için dijital yol arkadaşınız._
