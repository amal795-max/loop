import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:loop/src/app.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:loop/src/features/home/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  testWidgets('App should build', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    SharedPreferences.setMockInitialValues({});
    await EasyLocalization.ensureInitialized();

    await tester.pumpWidget(EasyLocalization(
      supportedLocales: const [
        Locale('en'),
        Locale('ar'),
      ],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      child: const ProviderScope(child: App()),
    ));

    // Verify that our base app builds successfully.
    expect(find.byType(App), findsOneWidget);
  });

  testWidgets('HomePage renders the mock chat dashboard',
      (WidgetTester tester) async {
    SharedPreferences.setMockInitialValues({});
    await EasyLocalization.ensureInitialized();

    await tester.pumpWidget(
      EasyLocalization(
        supportedLocales: const [Locale('en'), Locale('ar')],
        path: 'assets/translations',
        fallbackLocale: const Locale('en'),
        child: const ProviderScope(
          child: MaterialApp(
            home: HomeLayout(),
          ),
        ),
      ),
    );

    expect(find.text('Loop'), findsOneWidget);
    expect(find.text('Search messages, people, channels.'), findsOneWidget);
    expect(find.text('LIVE PRESENCE'), findsOneWidget);
  });


}
