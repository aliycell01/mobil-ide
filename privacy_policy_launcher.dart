// ==========================================
// GİZLİLİK POLİTİKASI / HAKKINDA BAĞLANTISI
// Bu dosya main.dart'a HİÇBİR ekleme yapmadan bağımsız çalışır.
// main.dart'ta yapmanız gereken TEK şey:
//   1) Üste: import 'privacy_policy_launcher.dart';
//   2) HomeScreen'in menü kart listesine bir _menuCard(...) bloğu eklemek
//      (aşağıdaki PrivacyPolicyLauncher.open metodunu çağırarak).
// Tüm URL açma / hata mesajı mantığı burada, main.dart'ın dışında yaşar.
// ==========================================
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PrivacyPolicyLauncher {
  // GitHub Pages'te yayınladığınız adres. Farklı bir yol kullandıysanız
  // (örn. .../mobil-ide/privacy-policy.html) burayı güncelleyin.
  static const String url = "https://aliycell01.github.io/mobil-ide/";

  /// Gizlilik politikası / hakkında sayfasını cihazın varsayılan
  /// tarayıcısında (genelde Chrome) açar. Açılamazsa kullanıcıya
  /// bir uyarı gösterir.
  static Future<void> open(BuildContext context) async {
    final uri = Uri.parse(url);
    bool ok = false;
    try {
      ok = await launchUrl(uri, mode: LaunchMode.externalApplication);
    } catch (_) {
      ok = false;
    }
    if (!ok && context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Bağlantı açılamadı. Lütfen internet bağlantınızı kontrol edin.")),
      );
    }
  }
}
