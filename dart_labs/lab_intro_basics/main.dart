// Função prijncipal
/*

01/07 - Introdução a Dart

* Variáveis
* Operadores
* Controle de fluxo
* Estruturas de repetição
* Coleções - List, Map
- Operações básicas
- forEach(), map(), where(), reduce(), fold()
- sort()
* Classes e Objetos

*/

void main() {
    //variáveis
    String name = 'Voyager I';
    int year = 1977;
    double antennaDiameter = 3.7;
    bool isActive = true;List<String> planets = ['Mercury', 'Venus', 'Earth', 'Mars', 'Jupiter', 'Saturn', 'Uranus', 'Neptune'];
    Map<String, String> image = {'tags': 'saturn', 'url': 'https://example.com/saturn.jpg'};

    //Tipagem por infrência
    // var x = 2; // int
    // dynamic y = 2; // dynamic
    // var z = 'Hello'; // String
    // diferença entre list e map: list é uma coleção ordenada de elementos, enquanto map é uma coleção de pares chave-valor.
    // List<String> planets = ['Mercury', 'Venus', 'Earth', 'Mars', 'Jupiter', 'Saturn', 'Uranus', 'Neptune'];
    // Map<String, String> image = {'tags': 'saturn', 'url': 'https://example.com/saturn.jpg'}; 

    print('A sonda espacial $name foi lançada em $year!');
    print('Diâmetro da antena: $antennaDiameter metros');

    ou 

    print('A sonda espacial $name foi lançada em $year!\nDiâmetro da antena: $antennaDiameter metros');

    ou

    print('A sonda espacial ${name} foi lançada em ${year}!');
    print('Diâmetro da antena: ${antennaDiameter} metros');
}
// Fluxo de execução
// 1. Declaração de variáveis
// 2. Impressão de informações
var idade = 65;
if (idade >= 65) {
    print('Fila preferencial');
} else if (idade >= 18) {
    print('Maior de idade');
} else {
    print('Menor de idade');
}

}
