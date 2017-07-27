// classes e structs
/*struct Endereco {
    var cidade: String
    var logradouro: String
    var numero: Int?
}

class Pessoa {
    let nome: String = ""
    var endereco: Endereco?
    var telefone: String?
}*/


// adicionando construtor
/*struct Endereco {
    var cidade: String
    var logradouro: String
    var numero: Int?
}

class Pessoa {
    let nome: String
    var endereco: Endereco?
    var telefone: String?
    
    init(nome: String, endereco: Endereco?, telefone: String?) {
        self.nome = nome
        self.endereco = endereco
        self.telefone = telefone
    }
}*/


struct Endereco {
    var cidade: String
    var logradouro: String
    var numero: Int?
}

class Pessoa {
    let nome: String
    var endereco: Endereco?
    var telefone: String?
    
    init(nome: String, endereco: Endereco?, telefone: String?) {
        self.nome = nome
        self.endereco = endereco
        self.telefone = telefone
    }
    // método de instância
    func apresentar() -> String {
        return "Oi, meu nome é \(self.nome)"
    }
}

// instanciando classe e struct
var apolo235 = Endereco(cidade: "Recife", logradouro: "Rua do Apolo", numero: 235)

let joao = Pessoa(nome: "João", endereco: apolo235, telefone: nil)

// acessando propriedades
joao.nome       // tem valor de "João"
joao.telefone   // não tem valor (nil)

joao.endereco?.logradouro   // "Rua do Apolo"
apolo235.logradouro         // também "Rua do Apolo"


// value type
var copiaApolo = apolo235

apolo235.cidade = "Olinda"

copiaApolo.cidade   // tem valor de "Recife"
apolo235.cidade     // tem valor de "Olinda"

// reference type
var referenciaJoao = joao

joao.telefone = "99999999"

joao.telefone           // tem valor de "99999999"
referenciaJoao.telefone // tem valor de "99999999"


// chamando método de instância
joao.apresentar()   // retorna "Oi, meu nome é João"

// protocolo
protocol Mestre {
    var universidadeMestrado: String? {get set}
    
    func receberTitulo(universidade: String)
}

// herança
class Professor: Pessoa, Mestre {
    // requisitos do protocolo
    var universidadeMestrado: String?
    
    func receberTitulo(universidade: String) {
        self.universidadeMestrado = universidade
        self.titulo = "Ms."
    }
    
    
    var titulo = "Prof."
    // nova propriedade
    var universidade: String
    
    //sobrescrevendo método
    override func apresentar() -> String {
        return "Oi, meu nome é \(self.titulo) \(self.nome)"
    }
    
    init(nome: String, endereco: Endereco?, telefone: String?, universidade: String) {
        self.universidade = universidade
        //chamando construtor da superclasse
        super.init(nome: nome, endereco: endereco, telefone: telefone)
    }
}

var pedro = Professor(nome: "Pedro", endereco: apolo235, telefone: "1234567", universidade: "UFPE")

pedro.nome      // tem valor de "Pedro"
pedro.titulo    // tem valor de "Prof."


// chamando método sobrescrito
pedro.apresentar()  // retorna "Oi, meu nome é Prof. Pedro"

pedro.universidade  // tem valor de "UFPE"

// chamando método do protocolo
pedro.receberTitulo(universidade: "MIT")

pedro.titulo    // tem valor de "Ms."
pedro.universidadeMestrado  // tem valor de "MIT"

// protocolos como tipos
let mestre: Mestre = pedro


// checagem de tipo
let maria = Pessoa(nome: "Maria", endereco: apolo235, telefone: nil)

maria is Pessoa     // retona true
maria is Endereco   // retorna false


// downcasting
var pessoas: [Pessoa] = [pedro, maria]
var mensagem = "título(s): "

for pessoa in pessoas {
    if let professor = pessoa as? Professor {
        mensagem = mensagem + professor.titulo
    }
}

mensagem // tem valor de "título(s): Ms."


// propriedades computadas

struct Point {
    var x = 0.0
    var y = 0.0
}

struct Size {
    var width = 0.0
    var height = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        set(newCenter) {
            origin.x = newCenter.x - (size.width / 2)
            origin.y = newCenter.y - (size.height / 2)
        }
    }
}


