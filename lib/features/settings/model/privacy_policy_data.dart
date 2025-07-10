class PrivacyPolicyModel {
  final String title;
  final String description;

  PrivacyPolicyModel({required this.title, required this.description});

  @override
  String toString() {
    return 'PrivacyPolicyModel(title: $title, description: $description)';
  }
}

final List<PrivacyPolicyModel> privacyPolicyData = [
  PrivacyPolicyModel(
    title: 'Data Collection',
    description:
        'We collect personal information such as your name, email, phone number, and delivery address to process your orders and enhance your shopping experience.',
  ),
  PrivacyPolicyModel(
    title: 'Use of Information',
    description:
        'Your information is used to process transactions, manage orders, deliver products, provide customer support, and improve our services.',
  ),
  PrivacyPolicyModel(
    title: 'Payment Security',
    description:
        'We use secure third-party payment gateways to process your payments. We do not store your card or payment details on our servers.',
  ),
  PrivacyPolicyModel(
    title: 'Data Sharing',
    description:
        'We do not sell or rent your personal data to third parties. Your data is only shared with trusted partners involved in delivering your order.',
  ),
  PrivacyPolicyModel(
    title: 'Cookies & Tracking',
    description:
        'We use cookies to personalize your shopping experience and analyze website traffic. You can choose to disable cookies in your browser settings.',
  ),
  PrivacyPolicyModel(
    title: 'User Rights',
    description:
        'You have the right to access, modify, or delete your personal data stored with us by contacting our support team.',
  ),
  PrivacyPolicyModel(
    title: 'Updates to Policy',
    description:
        'We may update our privacy policy from time to time. Changes will be notified via the app or email.',
  ),
];
