//
//  UniqueObjectView.swift
//  CoreDataProject
//
//  Created by Giovanni Gaffé on 2021/11/10.
//

import SwiftUI

struct UniqueObjectView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: Wizard.entity(), sortDescriptors: []) var wizards: FetchedResults<Wizard>
    
    var body: some View {
        VStack {
            List(wizards, id: \.self) { wizard in
                Text(wizard.name ?? "Unknown")
            }
            
            Button("Add") {
                let wizard = Wizard(context: moc)
                wizard.name = "Harry Potter"
            }
            
            Button("Save") {
                do {
                    try self.moc.save()
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
}

struct UniqueObjectView_Previews: PreviewProvider {
    static var previews: some View {
        UniqueObjectView()
    }
}
