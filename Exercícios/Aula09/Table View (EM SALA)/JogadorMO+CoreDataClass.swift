//
//  JogadorMO+CoreDataClass.swift
//  Table View
//
//  Created by Hilton Pintor Bezerra Leite on 03/08/17.
//  Copyright © 2017 hpbl. All rights reserved.
//

import Foundation
import CoreData

@objc(JogadorMO)
public class JogadorMO: NSManagedObject {
    
    
    func sayHi() {
        print("Oi, meu nome é \(self.nome!)")
    }

}
