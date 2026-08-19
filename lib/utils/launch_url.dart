import 'package:url_launcher/url_launcher.dart';

Future<void> launchMail(String email) async {
  final uri = Uri(scheme: 'mailto', path: email);
  await launchUrl(uri);
}

Future<void> launchPhone(String phone) async {
  final uri = Uri(scheme: 'tel', path: phone.replaceAll(RegExp(r'[\s()-]'), ''));
  await launchUrl(uri);
}

Future<void> launchExternal(String url) async {
  var normalized = url;
  if (!normalized.startsWith('http://') && !normalized.startsWith('https://')) {
    normalized = 'https://$normalized';
  }
  final uri = Uri.parse(normalized);
  await launchUrl(uri, webOnlyWindowName: '_blank');
}
