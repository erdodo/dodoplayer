# 🎬 DodoPlayer - ErdoFlix

> Modern ve kullanıcı dostu film & dizi deneyimi sunan yeni nesil streaming platformu

[![Flutter](https://img.shields.io/badge/Flutter-3.9.2+-02569B?style=flat&logo=flutter)](https://flutter.dev)
[![TMDB](https://img.shields.io/badge/Powered%20by-TMDB-01D277?style=flat&logo=themoviedatabase)](https://www.themoviedb.org)

## 📱 Genel Bakış

DodoPlayer, film ve dizi tutkunları için tasarlanmış kapsamlı bir mobil uygulamadır. TMDB (The Movie Database) API'si ile entegre çalışarak, milyonlarca film ve dizi verisi sunar. Kullanıcıların kendi kişiselleştirilmiş içerik deneyimlerini oluşturmalarını sağlar.

## ✨ Mevcut Özellikler

### 🎯 Ana Özellikler

- **📚 Kapsamlı İçerik Kütüphanesi**
  - TMDB üzerinden tüm filmlerin listelenmesi
  - Popüler filmler ve diziler koleksiyonu
  - Güncel ve trend içerikler

- **🔍 Gelişmiş Arama**
  - Hızlı ve akıllı film/dizi arama
  - Filtreleme ve sıralama seçenekleri
  - Anında sonuç gösterimi

- **📖 Detaylı İçerik Sayfaları**
  - Film ve dizi detay bilgileri
  - Oyuncu kadrosu ve ekip bilgileri
  - Kullanıcı değerlendirmeleri ve puanlar
  - Sezon ve bölüm bilgileri

- **❤️ Favori Yönetimi**
  - Kişisel favori listeleri oluşturma
  - İzleme listesi yönetimi
  - Hızlı erişim ve organize etme

- **👤 Kullanıcı Hesap Sistemi**
  - Güvenli giriş ve kayıt sistemi
  - Kişiselleştirilmiş profiller
  - Çoklu cihaz senkronizasyonu

## 🚀 Yakında Gelecek Özellikler

### 🎬 Planlanan Geliştirmeler

- **📝 Özel Liste Yönetimi**
  - Kullanıcıların kendi izleme listelerini oluşturması
  - Liste paylaşımı ve topluluk listeleri
  - Kategori bazlı liste organizasyonu

- **🤖 Akıllı Öneri Sistemi**
  - Favori ve izleme geçmişine dayalı film/dizi önerileri
  - Kişiselleştirilmiş içerik keşfi
  - Benzer içerik önerileri

- **🎥 Fragman İzleme**
  - Uygulama içi fragman oynatma
  - Yüksek kaliteli video deneyimi
  - Paylaşım özellikleri

- **📊 Gelişmiş İstatistikler**
  - İzleme istatistikleri
  - Favori türler ve trendler
  - Kişisel aktivite geçmişi

## 🛠️ Teknoloji Stack

- **Framework:** Flutter 3.9.2+
- **Dil:** Dart
- **State Management:** Provider
- **API:** TMDB API
- **UI Components:** GetWidget
- **Veri Depolama:** SharedPreferences
- **HTTP İstekleri:** HTTP package

## 📦 Kurulum

### Gereksinimler

- Flutter SDK 3.9.2 veya üstü
- Dart SDK
- Android Studio / Xcode (platform bazlı)
- TMDB API Key

### Adımlar

1. **Projeyi klonlayın**
   ```bash
   git clone https://github.com/erdodo/dodoplayer.git
   cd dodoplayer
   ```

2. **Bağımlılıkları yükleyin**
   ```bash
   flutter pub get
   ```

3. **TMDB API anahtarınızı yapılandırın**
   - `lib/apis/tmdb.dart` dosyasına API anahtarınızı ekleyin

4. **Uygulamayı çalıştırın**
   ```bash
   flutter run
   ```

## 🏗️ Proje Yapısı

```
lib/
├── main.dart              # Uygulama giriş noktası
├── AuthCheck.dart         # Kimlik doğrulama kontrolü
├── HomePage.dart          # Ana sayfa
├── apis/                  # API entegrasyonları
│   ├── tmdb.dart         # TMDB API servisi
│   └── n8n.dart          # Backend entegrasyonu
├── models/               # Veri modelleri
├── pages/                # Uygulama sayfaları
│   ├── movies/          # Film sayfaları
│   ├── tvseries/        # Dizi sayfaları
│   ├── favorites/       # Favori listeleri
│   ├── search/          # Arama sayfası
│   └── sign/            # Giriş/Kayıt
├── providers/            # State management
├── services/             # Servis katmanı
└── widgets/              # Özel widget'lar
```

## 🎨 Ekran Görüntüleri

*Yakında eklenecek*

## 🤝 Katkıda Bulunma

Projeye katkıda bulunmak isterseniz:

1. Fork yapın
2. Feature branch oluşturun (`git checkout -b feature/amazing-feature`)
3. Değişikliklerinizi commit edin (`git commit -m 'feat: Add amazing feature'`)
4. Branch'inizi push edin (`git push origin feature/amazing-feature`)
5. Pull Request oluşturun

## 📄 Lisans

Bu proje özel bir projedir.

## 📞 İletişim

- **Geliştirici:** erdodo
- **Proje Link:** [https://github.com/erdodo/dodoplayer](https://github.com/erdodo/dodoplayer)

## 🙏 Teşekkürler

- [TMDB](https://www.themoviedb.org) - İçerik veritabanı
- [Flutter](https://flutter.dev) - Framework
- [GetWidget](https://www.getwidget.dev) - UI Components

---

⭐ Bu projeyi beğendiyseniz, yıldız vermeyi unutmayın!

**Made with ❤️ by erdodo**
