import 'package:url_launcher/url_launcher.dart';

void openWhatsApp(String phoneNumber) async {
  final whatsappUrl = Uri.parse("https://wa.me/$phoneNumber");
  if (await canLaunchUrl(whatsappUrl)) {
    await launchUrl(whatsappUrl);
  } else {
    throw 'Could not launch $whatsappUrl';
  }
}
