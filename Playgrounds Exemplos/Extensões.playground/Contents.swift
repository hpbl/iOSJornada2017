//: Playground - noun: a place where people can play

import UIKit

// Nova classe Pessoa
class Pessoa {
    let nome: String
    var anoNascimento: Int
    var telefone: String?
    
    init(nome: String, anoNascimento: Int, telefone: String? = nil) {
        self.nome = nome
        self.anoNascimento = anoNascimento
        self.telefone = telefone
    }
}

// default value
var joao = Pessoa(nome: "João",
                  anoNascimento: 1996)

var marina = Pessoa(nome: "Marina",
                    anoNascimento: 1990,
                    telefone: "94382712")

joao.telefone   // nil
marina.telefone // "94382712"


// estendendo classe
extension Pessoa {
    var idade: Int {
        
        let date = Date()
        let calendar = Calendar.current
        let year = calendar.component(.year, from: date)
        
        return year - self.anoNascimento
    }
}

// acessando propriedade da extensão
joao.idade   // 21
marina.idade // 27

//nova subclasse
class Professor: Pessoa {
    var tituloP = "Prof."
}

var jose = Professor(nome: "José", anoNascimento: 1980)
jose.tituloP // "Prof."

// novo protocolo
protocol Mestre {
    var tituloM: String { get }
}

extension Mestre {
    var tituloM: String {
        return "Ms."
    }
}


//estendendo para aderir a protocolo
extension Professor: Mestre { }

jose.tituloM // "Ms."

