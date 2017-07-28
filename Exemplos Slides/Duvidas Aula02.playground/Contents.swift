//: Playground - noun: a place where people can play

import UIKit

// modificando valor do parâmetro

/*func funcao(parametro: Int) {
 parametro = 10    // ERRO
}*/

/*func funcao(parametro: Int) {
 var parametroLocal = parametro
 parametroLocal = 10
}
 
var valor = 1
funcao(parametro: valor)
valor   // continua sendo 1*/

func funcao( parametro: inout Int) {
    parametro = 10
}

var valor = 1
funcao(parametro: &valor)
valor   // agora é 10



// ordenação
var array = [2, 1, 3, 5, 4]
//array.sort()
//array   // [1, 2, 3, 4, 5]


//array.sort(by: { $0 > $1 })
//array.sort(by: >)
//array   // [5, 4, 3, 2, 1]

var sortedArray = array.sorted()
sortedArray // [1, 2, 3, 4, 5]
array       // [2, 1, 3, 5, 4]



// String.CharacterView
var string = "abc😱"

for char in string.characters {
    //char is Character
    print(char)
}
