class TermsAndConditionItemModel {
  final String title;
  final String description;
  TermsAndConditionItemModel({required this.title, required this.description});
}

final List<TermsAndConditionItemModel> termsData = [
  TermsAndConditionItemModel(
    title: '1. Introduction',
    description:
        'Welcome to [Store Name]! By using our app you agree to these Terms & Conditions.',
  ),
  TermsAndConditionItemModel(
    title: '2. Eligibility',
    description: 'You must be at least 18 years old to use our services.',
  ),
  TermsAndConditionItemModel(
    title: '3. Account Registration',
    description:
        'Please provide accurate information and safeguard your password.',
  ),
  TermsAndConditionItemModel(
    title: '4. Product Pricing & Payment',
    description: 'Prices may change and payment is processed at checkout.',
  ),
  TermsAndConditionItemModel(
    title: '5. Shipping & Delivery',
    description:
        'Shipping details are provided during checkout, subject to change.',
  ),
  TermsAndConditionItemModel(
    title: '6. Returns & Refunds',
    description: 'Returns and refunds follow our Return Policy, linked here.',
  ),
  TermsAndConditionItemModel(
    title: '7. Intellectual Property',
    description:
        'All content in this app is owned by us and may not be reused.',
  ),
  TermsAndConditionItemModel(
    title: '8. User Conduct',
    description: 'You agree not to misuse the app or post illegal content.',
  ),
  TermsAndConditionItemModel(
    title: '9. Termination',
    description: 'We can suspend or terminate your account for violations.',
  ),
  TermsAndConditionItemModel(
    title: '10. Governing Law',
    description: 'These Terms are governed by [Your Jurisdiction] laws.',
  ),
  TermsAndConditionItemModel(
    title: '11. Updates to Terms',
    description:
        'We may update these Terms and notify you via the app or email.',
  ),
  TermsAndConditionItemModel(
    title: '12. Contact Us',
    description: 'For questions, reach out at support@[domain].com.',
  ),
];
