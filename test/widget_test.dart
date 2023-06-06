import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:izam_task/view/login/login_view.dart';
import 'package:izam_task/widget/button_widget.dart';
import 'package:izam_task/widget/text_field_widget.dart';

void main() {
  testWidgets('LoginView UI Test', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: LoginView(),
      ),
    );

    // Verify the presence of UI elements
    expect(find.byType(Image), findsOneWidget);
    expect(find.text('loginPhase'.tr), findsOneWidget);
    expect(find.byType(TextFieldWidget), findsNWidgets(2));
    expect(find.text('forgotPassword'.tr), findsOneWidget);
    expect(find.byType(ButtonWidget), findsNWidgets(2));

    // Perform interactions
    await tester.enterText(find.widgetWithText(TextFieldWidget, 'email'.tr), 'test@example.com');
    await tester.enterText(find.widgetWithText(TextFieldWidget, 'password'.tr), 'password123');
    await tester.tap(find.widgetWithText(ButtonWidget, 'signIn'.tr));
    await tester.pump();
  });
}
