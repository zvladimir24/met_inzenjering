import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'email_config.dart';

/// Sends the contact form via EmailJS (https://www.emailjs.com) — a
/// relay service that lets a static site send email without a backend.
/// Notifies the company, then best-effort fires the visitor-facing
/// "thanks for contacting us" auto-reply. Returns true if the company
/// notification (the one that matters) was delivered.
Future<bool> sendContactEmail({required String fromEmail, required String message}) async {
  final notified = await _send(
    templateId: emailJsTemplateId,
    params: {
      'from_email': fromEmail,
      'message': message,
      'to_email': contactFormRecipientEmail,
    },
  );

  if (notified) {
    unawaited(_send(
      templateId: emailJsAutoReplyTemplateId,
      params: {'from_email': fromEmail, 'message': message},
    ));
  }

  return notified;
}

Future<bool> _send({required String templateId, required Map<String, String> params}) async {
  final response = await http.post(
    Uri.parse('https://api.emailjs.com/api/v1.0/email/send'),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({
      'service_id': emailJsServiceId,
      'template_id': templateId,
      'user_id': emailJsPublicKey,
      'template_params': params,
    }),
  );
  return response.statusCode == 200;
}
