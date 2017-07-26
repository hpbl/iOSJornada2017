import UIKit
// Exercício 02

/* faça uma função que dada uma palavra,
 retorna a sua pontuação correspondente */
 

// "A", "E", "I", "O", "U", "L", "N", "R", "S", "T" - 1
// "D", "G", - 2
// "B", "C", "M", "P" - 3
// "F", "H", "V", "W", "Y" - 4
// "K" - 5
// "J", "X" - 8
// "Q", "Z" - 10


/*func valorLetra(_ letra: String) -> Int {
    let valor: Int
    
    switch letra {
    case "A", "E", "I", "O", "U", "L", "N", "R", "S", "T":
        valor = 1
    case "D", "G":
        valor = 2
    case "B", "C", "M", "P":
        valor = 3
    case "F", "H", "V", "W", "Y":
        valor = 4
    case "K":
        valor = 5
    case "J", "X":
        valor = 8
    case "Q", "Z":
        valor = 10
    default:
        print("letra inválida")
        valor = Int.min
    }
    
    return valor
}


let palavra = "SCRABBLE"
var soma = 0

for letra in palavra.characters {
    soma = soma + valorLetra(String(letra))
}

soma*/

// Exercício 02

var pergunta: String = "Quanto é 2 mais 1?"

var perguntaLowerCase = pergunta.lowercased()

/*perguntaLowerCase = perguntaLowerCase.replacingOccurrences(of: "quanto é ", with: "")

perguntaLowerCase = perguntaLowerCase.replacingOccurrences(of: "?", with: "")*/

String(perguntaLowerCase.characters.dropLast())


var components = perguntaLowerCase.components(separatedBy: " ")
var resultado: Int = Int.min
switch components[1] {
case "mais":
    resultado = Int(components[0])! + Int(components[2])!
    
case "menos":
    resultado = Int(components[0])! - Int(components[2])!
    
case "vezes":
    resultado = Int(components[0])! * Int(components[2])!
    
case "sobre":
    resultado = Int(components[0])! / Int(components[2])!
default:
    break
}

resultado




// Exercício 3
var entrada = 123

/*func digitos(_ entrada: Int) -> [Int] {
    var string = String(entrada)
    var lista = digitosAux(numero: string)
    
    return lista.map({Int($0)!})
}

func digitosAux(numero: String) -> [String] {
    if numero.characters.count == 1 {
        return [numero]
    
    } else {
        var head = String(describing: numero.characters.first!)
        var numNovo = numero.replacingOccurrences(of: head, with: "")
        return [head] + digitosAux(numero: numNovo)
    }
}

digitos(entrada)*/





func digitos(_ entrada: Int) -> [Int] {
    var resultado = entrada / 10
    
    if resultado == 0 {
        return [entrada]
    
    } else {
        return digitos(resultado) + [entrada % 10]
    }
    
}

digitos(123)


// EXEC 04

func ordenaNumeros(_ arrayNumero:[Int]) -> [Int]{
    var ok: Bool = true
    var numero: Int
    var array = arrayNumero
    for idx in 1..<array.count{
        if array[idx-1] >= array[idx]{
            numero = array[idx-1]
            array[idx-1] = array[idx]
            array[idx] = numero
            ok = false
            print(array)
        }
    }
    if !ok{
        array = ordenaNumeros(array) //essa linha não tinha a atribuição. Estava jogando fora as mudanças feitas
    }
    return array
}


func digitos() -> [Int]{
    var arrayNumero = [Int]()
    
    arrayNumero.append(1)
    arrayNumero.append(7)
    arrayNumero.append(5)
    arrayNumero.append(4)
    arrayNumero.append(6)
    
    return ordenaNumeros(arrayNumero)
}
digitos()





