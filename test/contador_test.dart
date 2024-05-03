import "package:flutter_testes_estudo/contador.dart";
import 'package:flutter_testes_estudo/data/contador_database.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'contador_test.mocks.dart';

@GenerateMocks([ContadorDatabase])
void main() {
  group("Testar inicialização, incremento e decremento:", () {
    test("O atributo 'valor' deve começar em 0.", () {
      Contador contador = Contador();
      expect(
        contador.valor,
        1,
        reason: "Pois tudo começa vazio.",
        skip: "Não se aplica.",
      );

      expect(contador.valor, 0);
    });

    test("O método 'incrementar' deve aumentar o valor de 'valor' em 1.", () {
      Contador contador = Contador();
      contador.incrementar();
      expect(contador.valor, 1);
    });

    test("O método 'decrementar' deve diminuir o valor de 'valor' em 1.", () {
      Contador contador = Contador();
      contador.decrementar();
      expect(contador.valor, -1);
    });

    test("O método 'multiplicarValor' deve retornar uma lista não nula.", () {
      Contador contador = Contador();
      contador.valor = 2;
      List<int> resultado = contador.multiplicarValor([-3, -2, -1, 0, 1, 2, 3]);

      expect(resultado, isNotNull);
    });

    test(
        "O método 'multiplicarValor' deve lançar uma exceção se receber uma lista vazia.",
        () {
      Contador contador = Contador();
      expect(() => contador.multiplicarValor([]),
          throwsA(isA<ListaVaziaException>()));
    });
  });

  group("Método 'adicionarDoTeclado':", () {
    test("Se tudo der certo, o retorno deve ser nulo.", () {
      Contador contador = Contador();
      expect(contador.adicionarDoTeclado("5"), isNull);
    });

    test(
        "Se o teclado enviar um valor não numérico, deve-se retornar uma mensagem de erro.",
        () {
      Contador contador = Contador();
      expect(
          contador.adicionarDoTeclado("Cinco"), equals("Valor não numérico."));
    });

    test(
        "Se o teclado enviar um valor fracionado, deve-se adicionar apenas o chão inteiro.",
        () {
      Contador contador = Contador();
      contador.adicionarDoTeclado("5.5");
      expect(contador.valor, equals(5));
    });
  });

  group("Métodos de persistência de dados:", () {
    test("Ler dados no banco.", () async {
      MockContadorDatabase mockContadorDatabase = MockContadorDatabase();

      when(mockContadorDatabase.ler()).thenAnswer((_) async => 25);

      Contador contador = Contador();
      expect(contador.valor, 0, reason: "Contador deve iniciar em zero.");

      await contador.lerDoBanco(mockContadorDatabase);

      expect(
        contador.valor,
        25,
        reason: "Contador deve ter atualizado valor com dado do banco.",
      );
    });
  });
}
