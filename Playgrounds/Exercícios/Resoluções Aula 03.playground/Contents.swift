//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


// Exercício 06
enum Movimento {
    case pedra
    case papel
    case tesoura
}


enum Resultado {
    case vitoria
    case derrota
    case empate
}


func partida(primeiroJogador: Movimento, segundoJogador: Movimento) -> Resultado {
    if primeiroJogador == segundoJogador {
        return .empate
    
    } else if primeiroJogador == .pedra && segundoJogador == .tesoura ||
              primeiroJogador == .papel && segundoJogador == .pedra   ||
              primeiroJogador == .tesoura && segundoJogador == .papel {
        return .vitoria
    
    } else {
        return .derrota
    }
}

partida(primeiroJogador: .pedra, segundoJogador: .tesoura)  // -> "Você ganhou"



// Exercício 07

class Veiculo {
    var velocidade: Int
    
    func calcularTempo(_ distancia: Int) -> Int {
        return distancia /  self.velocidade
    }
    
    init(velocidade: Int) {
        self.velocidade = velocidade
    }
}

class VeiculoAquatico: Veiculo {
    var largura: Double
    
    init(largura: Double, velocidade: Int) {
        self.largura = largura
        super.init(velocidade: velocidade)
    }
}

class VeiculoTerrestre: Veiculo {
    var rodas: Int
    
    init(rodas: Int, velocidade: Int) {
        self.rodas = rodas
        super.init(velocidade: velocidade)
    }
}

class Carro: VeiculoTerrestre {
    var janelas: Int
    
    init(janelas: Int, rodas: Int, velocidade: Int) {
        self.janelas = janelas
        super.init(rodas: rodas, velocidade: velocidade)
    }
    /*init(janelas: Int, velocidade: Int) {
        self.janelas = janelas
        super.init(rodas: 4, velocidade: velocidade)
    }*/
}

class Motocicleta: VeiculoTerrestre { }

class Barco: VeiculoAquatico {
    var janelas: Int
    
    init(janelas: Int, largura: Double, velocidade: Int) {
        self.janelas = janelas
        super.init(largura: largura, velocidade: velocidade)
    }
}

// Deveria ser Carro ou VeiculoTerrestre?
class Onibus: Carro {
    var capacidade: Int
    
    init(capacidade: Int, velocidade: Int, rodas: Int, janelas: Int) {
        self.capacidade = capacidade
        super.init(janelas: janelas, rodas: rodas, velocidade: velocidade)
    }
}

class Navio: VeiculoAquatico { }


// Exercício 08

protocol Forma {
    func area() -> Float
    
    func perimetro() -> Float
}

class Quadrado: Forma {
    var lado: Float
    
    init(lado: Float) {
        self.lado = lado
    }
    
    func area() -> Float {
        return self.lado * self.lado
    }
    
    func perimetro() -> Float {
        return self.lado * 4
    }
}

class Circulo: Forma {
    var raio: Float
    
    init(raio: Float) {
        self.raio = raio
    }
    
    func area() -> Float {
        return Float.pi * (self.raio * self.raio)
    }
    
    func perimetro() -> Float {
        return 2 * Float.pi * self.raio
    }
}


class Retangulo: Forma {
    var base: Float
    var altura: Float
    
    init(base: Float, altura: Float) {
        self.altura = altura
        self.base = base
    }
    
    func area() -> Float {
        return self.base * self.altura
    }
    
    func perimetro() -> Float {
        return (self.base * 2) + (self.altura * 2)
    }
}
