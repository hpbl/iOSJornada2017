//
//  JogadorMO+CoreDataProperties.swift
//  Table View
//
//  Created by Hilton Pintor Bezerra Leite on 03/08/17.
//  Copyright © 2017 hpbl. All rights reserved.
//

import Foundation
import CoreData


extension JogadorMO {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<JogadorMO> {
        return NSFetchRequest<JogadorMO>(entityName: "Jogador")
    }

    @NSManaged public var nome: String?
    @NSManaged public var posicao: String?
    @NSManaged public var numero: Int32
    @NSManaged public var foto: NSData?

}
