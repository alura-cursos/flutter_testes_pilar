import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_testes_estudo/screens/contador_screen.dart';

void main() {
  testWidgets("O título da aplicação é mostrado na tela.",
      (widgetTester) async {
    await widgetTester.pumpWidget(const MaterialApp(home: ContadorScreen()));

    final Finder titleFinder = find.text("O mais SIMPLES dos\ncontadores");

    expect(titleFinder, findsOneWidget);
  });

  testWidgets("O botão de incrementar deve somar 1 no contador.",
      (widgetTester) async {
    await widgetTester.pumpWidget(const MaterialApp(home: ContadorScreen()));

    expect(
      find.text("1"),
      findsNothing,
      reason: "Pois a tela deve estar mostrando '0' ao iniciar.",
    );

    final Finder addButtonFinder = find.text("+");

    await widgetTester.tap(addButtonFinder);
    await widgetTester.pumpAndSettle();

    expect(
      find.text("1"),
      findsOneWidget,
      reason: "Pois a tela deve agora mostra '1'.",
    );
  });
}
