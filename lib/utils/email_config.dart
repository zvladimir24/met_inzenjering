// EmailJS config — from your EmailJS dashboard (emailjs.com):
// serviceId + templateId come from the service/template you create there,
// publicKey from Account > General. recipientEmail is set as a template
// variable ({{to_email}}) so it can be changed here without touching
// the EmailJS dashboard.
const emailJsServiceId = 'service_uvwgrg6';
const emailJsPublicKey = '1fco1O4RPHPia9cqa';

// The "new inquiry" notification sent to the company. To Email on this
// template must be {{to_email}}.
const emailJsTemplateId = 'template_8wnrm4n';

// The "Thank you for contacting us" auto-reply sent back to the visitor.
// To Email on this template is {{from_email}}. This is template_s618xdo,
// the one already built and tested.
const emailJsAutoReplyTemplateId = 'template_s618xdo';

const contactFormRecipientEmail = 'office@metinzenjering.co.rs';
