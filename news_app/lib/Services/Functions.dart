import 'package:clipboard/clipboard.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class Functions{
   static Future<void> openLink(String link) async {
    var urllink = link;
    if (await canLaunch(urllink)) {
      var bool = await launch(urllink);
    } else {
      await launch(urllink);
    }
  }
   static Future<void> shareLink(String link) async {
     Share.share(link);
   }
   static Future<void> copyLink(String link) async {
     FlutterClipboard.copy(
         "https://www.youm7.com/story/2021/9/6/حسام-حسن-يكشف-لـ-اليوم-السابع-حقيقة-اقترابه-من-تدريب/5452256")
         .then((value) => print('copied'));
   }
}
