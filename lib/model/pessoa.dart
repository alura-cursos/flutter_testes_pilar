// ignore_for_file: unused_local_variable, avoid_print

class Pessoa {
  final String nome;
  final int idade;

  Pessoa(this.nome, this.idade)
      : assert(nome.isEmpty, 'O nome não pode ser vazio'),
        assert(idade >= 0, 'A idade não pode ser negativa');
}

void main() {
  // Criando uma instância de Pessoa
  Pessoa pessoa = Pessoa('João', 30);
  print('Nome: ${pessoa.nome}, Idade: ${pessoa.idade}');

  // Tentando criar uma Pessoa com nome nulo
  Pessoa pessoaComNomeVazio =
      Pessoa("", 25); // Isso lançará uma exceção AssertionError
}
