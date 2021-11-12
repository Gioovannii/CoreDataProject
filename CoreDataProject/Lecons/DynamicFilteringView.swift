//
//  DynamicFilteringView.swift
//  CoreDataProject
//
//  Created by Giovanni Gaffé on 2021/11/11.
//

import SwiftUI

struct DynamicFilteringView: View {
    @Environment(\.managedObjectContext) var moc
    @State private var lastNameFilter = "A"
    
    var body: some View {
        VStack {
            FilteredList(filter: lastNameFilter, sortDecriptor: [
                NSSortDescriptor(keyPath: \Singer.lastName, ascending: true)
            ])
     
//            FilteredListUpgrade(filterKey: "lastName", filterValue: lastNameFilter) { (singer: Singer) in
//                Text("\(singer.wrappedFirstName) \(singer.wrappedLastName)")
//            }
            
            Button("Add Examples") {
                let taylor = Singer(context: self.moc)
                taylor.firstName = "Taylor"
                taylor.lastName = "Swift"
                
                let ed = Singer(context: self.moc)
                ed.firstName = "Ed"
                ed.lastName = "Sheeran"
                
                let adele = Singer(context: self.moc)
                adele.firstName = "Adele"
                adele.lastName = "Adkins"
                
                try? self.moc.save()
            }
            
            Button("Show A") {
                self.lastNameFilter = "A"
            }
            
            Button("Show S") {
                self.lastNameFilter = "S"
            }
            
        }
    }
}

struct DynamicFilteringView_Previews: PreviewProvider {
    static var previews: some View {
        DynamicFilteringView()
    }
}
