//
//  FileteringView.swift
//  CoreDataProject
//
//  Created by Giovanni Gaffé on 2021/11/11.
//

import SwiftUI

struct FileteringView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: Ship.entity(), sortDescriptors: [], predicate:
            NSPredicate(format: "universe == 'Star Wars'") // ship from star wars
//            NSPredicate(format: "universe == %@", "Star Wars") // insert some data instead of %@
//            NSPredicate(format: "name < %@", "F") // name less than F
//            NSPredicate(format: "universe IN %@", ["Aliens", "Firefly", "Star Trek"]) // check universe one of these three
//            NSPredicate(format: "name BEGINSWITH %@", "E")) // Begin with letter E
//            NSPredicate(format: "name BEGINSWITH[c] %@", "e")) // Case sensitive better lik this
//            NSPredicate(format: "NOT name BEGINSWITH[c] %@", "e")) // Ship don't start with e

    

    
    ) var ships: FetchedResults<Ship>
    
    var body: some View {
        VStack {
            List(ships, id: \.self) { ship in
                Text(ship.name ?? "Unknown name")
            }
            
            Button("Add examples") {
                let ship1 = Ship(context: self.moc)
                ship1.name = "Entreprise"
                ship1.universe = "Star Trek"
                
                let ship2 = Ship(context: self.moc)
                ship2.name = "Defiant"
                ship2.universe = "Star Trek"
                
                let ship3 = Ship(context: self.moc)
                ship3.name = "Millenium Falcon"
                ship3.universe = "Star Wars"
                
                let ship4 = Ship(context: self.moc)
                ship4.name = "Executer"
                ship4.universe = "Star Wars"
                
                try? moc.save()
            }
        }
    }
}

struct FileteringView_Previews: PreviewProvider {
    static var previews: some View {
        FileteringView()
    }
}
