// Dúvidas da Aula 01


// operações com tipos diferentes

// Opcional e Concreto
var opcional: Int? = 1
var concreto: Int = 1

//opcional + concreto // erro: Value of optional type not unwrapped
opcional! + concreto

// Int e Double
var int: Int = 1
var double: Double = 1

//int + double  // Binary operator '+' cannot be applied to operands of type 'Int' and 'Double'
Double(int) + double // 2
int + Int(double)   // 2

// String e Int
var string: String = "1"
int = 1

Int(string)! + int   // 2
string + String(int) // "11"

// switch com intervalo
var valor = 11
var mensagem = ""

Int.max
Int.min

switch valor {
    
case Int.min..<0:
    mensagem = "negativo"
    
case 0...Int.max:
    mensagem = "positivo"
    
default:
    break
}


// switch com operadores de comparação
var someVar = 3

switch someVar {
    
case let x where x < 0:
    mensagem = "\(x) é menor que zero"
    
case let x where x == 0:
    mensagem = "\(x) é igual a zero"
    
case let x where x > 0:
    mensagem = "\(x) é maior que zero"
    
default:
    mensagem = "impossível"
}

// reutilizando nome
switch someVar {
    
case _ where someVar < 0:
    mensagem = "\(someVar) é menor que zero"
    
case _ where someVar == 0:
    mensagem = "\(someVar) é igual a zero"
    
case _ where someVar > 0:
    mensagem = "\(someVar) é maior que zero"
    
default:
    mensagem = "impossível"
}


// switch com fallthrough
let inteiro = 5
var descricao = "O número \(inteiro) é"

switch inteiro {
    
case 2, 3, 5, 7, 11, 13, 17, 19:
    descricao += " primo, e também"
    fallthrough
    
default:
    descricao += " um inteiro."
}

descricao // "O número 5 é primo, e também um inteiro."


// repeat-while
var valorAtual = 0
var valorEsperado = 10

repeat {
    valorAtual = valorAtual + 1
    
} while valorAtual != valorEsperado

valorAtual  // 10



