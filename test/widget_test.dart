import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:airotechhub/app.dart';
import 'package:airotechhub/core/providers/app_providers.dart';
import 'package:airotechhub/core/services/storage_service.dart';
import 'package:airotechhub/models/site_content.dart';

void main() {
  testWidgets('AIRO TECHHUB App launches smoke test', (WidgetTester tester) async {
    SharedPreferences.setMockInitialValues({});
    final prefs = await SharedPreferences.getInstance();
    final storageService = StorageService(prefs);

    const mockContent = SiteContent(
      eyebrow: 'Airo Techhub',
      headline: 'A workspace for groups, learning, and payments.',
      headlineTa: 'குழுக்கள், கற்றல் மற்றும் கட்டணங்களுக்கான பணித்தளம்.',
      lead: 'A subscriber opens a workspace.',
      leadTa: 'சந்தாதாரர் ஒரு பணித்தளத்தைத் திறக்கிறார்.',
      showSubscriberCta: true,
      subscriberCtaLabel: 'Register as a subscriber',
      subscriberCtaLabelTa: 'சந்தாதாரராக பதிவு செய்யுங்கள்',
      subscriberCtaDetail: 'Open a workspace.',
      subscriberCtaDetailTa: 'பணித்தளத்தைத் திறந்து.',
      showMemberCta: true,
      memberCtaLabel: 'Join your group',
      memberCtaLabelTa: 'உங்கள் குழுவில் சேருங்கள்',
      memberCtaDetail: 'Members register with code.',
      memberCtaDetailTa: 'உறுப்பினர்கள் பதிவு செய்கிறார்கள்.',
      services: [],
      features: [],
      showAi: true,
      aiKicker: 'AI',
      aiTitle: 'AI Teacher',
      aiTitleTa: 'AI ஆசிரியர்',
      aiBody: 'Ask a question.',
      aiBodyTa: 'கேள்வி கேளுங்கள்.',
      privacyPolicy: '',
      privacyPolicyTa: '',
      cookiePolicy: '',
      cookiePolicyTa: '',
    );

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          storageServiceProvider.overrideWithValue(storageService),
          siteContentProvider.overrideWith((ref) => Future.value(mockContent)),
        ],
        child: const AiroTechhubApp(),
      ),
    );

    await tester.pumpAndSettle();
    expect(find.byType(AiroTechhubApp), findsOneWidget);
  });
}
