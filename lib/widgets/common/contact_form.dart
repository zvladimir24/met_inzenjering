import 'package:flutter/material.dart';
import '../../data/company_data.dart';
import '../../l10n/app_locale.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_text_styles.dart';
import '../../utils/send_email.dart';
import 'bento_card.dart';
import 'gradient_button.dart';

final _emailPattern = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');

enum _SubmitStatus { idle, sending, sent, error }

class ContactForm extends StatefulWidget {
  const ContactForm({super.key});

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();
  _SubmitStatus _status = _SubmitStatus.idle;

  @override
  void dispose() {
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _status = _SubmitStatus.sending);
    final success = await sendContactEmail(
      fromEmail: _emailController.text.trim(),
      message: _messageController.text.trim(),
    );
    if (!mounted) return;
    setState(() => _status = success ? _SubmitStatus.sent : _SubmitStatus.error);
  }

  void _sendAnother() {
    _emailController.clear();
    _messageController.clear();
    setState(() => _status = _SubmitStatus.idle);
  }

  @override
  Widget build(BuildContext context) {
    final locale = AppLocaleScope.localeOf(context);
    return BentoCard(
      dark: true,
      child: _status == _SubmitStatus.sent ? _buildSuccess(locale) : _buildForm(locale),
    );
  }

  Widget _buildSuccess(AppLocale locale) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(Icons.check_circle, color: Color(0xFF4ADE80), size: 28),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                contactFormSuccessMessage.of(locale),
                style: AppTextStyles.h3Dark(size: 16),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        TextButton(
          onPressed: _sendAnother,
          child: Text(
            contactFormSendAnotherLabel.of(locale),
            style: AppTextStyles.labelDark(size: 13.5).copyWith(color: AppColors.accentEnd),
          ),
        ),
      ],
    );
  }

  Widget _buildForm(AppLocale locale) {
    final sending = _status == _SubmitStatus.sending;
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(contactFormTitle.of(locale), style: AppTextStyles.h3Dark(size: 18)),
          const SizedBox(height: 20),
          Text(contactFormEmailLabel.of(locale), style: AppTextStyles.labelDark(size: 13.5)),
          const SizedBox(height: 8),
          TextFormField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            enabled: !sending,
            style: AppTextStyles.bodyDark(size: 14.5),
            decoration: _fieldDecoration(contactFormEmailHint.of(locale)),
            validator: (value) {
              if (value == null || !_emailPattern.hasMatch(value.trim())) {
                return contactFormEmailError.of(locale);
              }
              return null;
            },
          ),
          const SizedBox(height: 20),
          Text(contactFormMessageLabel.of(locale), style: AppTextStyles.labelDark(size: 13.5)),
          const SizedBox(height: 8),
          TextFormField(
            controller: _messageController,
            minLines: 4,
            maxLines: 8,
            enabled: !sending,
            style: AppTextStyles.bodyDark(size: 14.5),
            decoration: _fieldDecoration(contactFormMessageHint.of(locale)),
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return contactFormMessageError.of(locale);
              }
              return null;
            },
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              Opacity(
                opacity: sending ? 0.6 : 1,
                child: GradientButton(
                  label: sending ? contactFormSendingLabel.of(locale) : contactFormSendLabel.of(locale),
                  icon: sending ? null : Icons.send_outlined,
                  onPressed: sending ? () {} : _submit,
                ),
              ),
              if (_status == _SubmitStatus.error) ...[
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    contactFormErrorMessage.of(locale),
                    style: AppTextStyles.bodyDark(size: 13.5).copyWith(color: AppColors.accentEnd),
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }

  InputDecoration _fieldDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      hintStyle: AppTextStyles.bodyDark(size: 14.5).copyWith(color: AppColors.textOnDarkSecondary),
      filled: true,
      fillColor: Colors.white.withValues(alpha: 0.06),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: AppColors.borderDark),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: AppColors.borderDark),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.accentEnd),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.accentStart),
      ),
      errorStyle: AppTextStyles.bodyDark(size: 12).copyWith(color: AppColors.accentEnd),
    );
  }
}
