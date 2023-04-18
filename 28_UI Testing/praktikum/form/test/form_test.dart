import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:form/page/form.dart';

void main() {
  testWidgets(
    "halaman form harus terdapat appbar dengan title Contacts",
    (widgetTester) async {
      await widgetTester.pumpWidget(
        const MaterialApp(
          home:FormPage(),
        )
      );
      expect(find.text('Contacts'), findsOneWidget);
    },
  );

  testWidgets(
    "halaman form harus terdapat kata Create New Contacts",
    (widgetTester) async {
      await widgetTester.pumpWidget(
        const MaterialApp(
          home:FormPage(),
        )
      );
      expect(find.text('Create New Contacts'), findsOneWidget);
    },
  );

  testWidgets(
    "halaman form harus terdapat kata List Contacts",
    (widgetTester) async {
      await widgetTester.pumpWidget(
        const MaterialApp(
          home:FormPage(),
        )
      );
      expect(find.text('List Contacts'), findsOneWidget);
    },
  );
}
