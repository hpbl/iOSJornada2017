// Funções 
func maior(primeiro: Int, segundo: Int) -> Int{
    if primeiro > segundo {
        return primeiro
    } else {
        return segundo
    }
}


// chamando função
let um = 1
let dois = 2

let maximo = maior(primeiro: um, segundo: dois)

maximo // tem valor de 2


// funcao de primera ordem (map)
var array = [1, 2, 3]

func somaUm(valor: Int) -> Int {
    return valor + 1
}

// map aplica a funcao somaUm a cada elemento de array
var novoArray = array.map(somaUm)

novoArray   // tem valor de [2, 3, 4]

somaUm

// sem funcao de primeira ordem
novoArray = []

for element in array {
    let elementoSomado = somaUm(valor: element)
    novoArray.append(elementoSomado)
}

novoArray


// closures
array = [1, 2, 3]
novoArray = []

novoArray = array.map({ (numero: Int) -> Int in
    return numero + 1
})

novoArray = array.map({ numero in
    return numero + 1
})

novoArray = array.map({
    return $0 + 1
})

novoArray = array.map({ $0 + 1 })

novoArray // tem valor de [2, 3, 4]


// closure enxuto
array = [1, 2, 3]
novoArray = []

novoArray = array.map {$0 + 1}

novoArray // tem valor de [2, 3, 4]



// enum
enum Familia {
    case pai
    case mae
    case filho
    case filha
}


// enum com switch
let membro = Familia.pai
var mensagem = ""

switch membro {
case .pai, .mae:
    mensagem = "primeira geração"

case .filho, .filha:
    mensagem = "segunda geração"
}

mensagem    // tem valor de "primeira geração"


// enum com valores associados
enum NovoTipo {
    case palavra(valor: String)
    case inteiro(valor: Int)
}

// switch de valores associados
let numero = NovoTipo.inteiro(valor: 8)
mensagem = ""

switch numero {
case .palavra(let valor):
    mensagem = "a palavra tem valor: \(valor)"
    
case .inteiro(let valor):
    mensagem = "o inteiro tem valor: \(valor)"
}

mensagem    // "o inteiro tem valor: 8"


// casamento de padrão
if case let NovoTipo.inteiro(valor: x) = numero {
    x   // tem valor de 8
}


// enum com raw value
enum Ordem: Int {
    case primeiro = 1
    case segundo = 2
    case terceiro
}

Ordem.primeiro.rawValue  // tem valor de 1 (Int)
Ordem.terceiro.rawValue  // tem valor de 3 (Int)

var posicao = Ordem.primeiro

switch posicao {
case .primeiro:
    mensagem = "número \(posicao.rawValue)"
default:
    break
}

switch posicao.rawValue {
case 1:
    mensagem = "número 1"
default:
    break
}

switch posicao {
case _ where posicao.rawValue == 1:
    mensagem = "número 1"
default:
    break
}




