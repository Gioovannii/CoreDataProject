//
//  FilteredList.swift
//  CoreDataProject
//
//  Created by Giovanni Gaffé on 2021/11/11.
//

import CoreData
import SwiftUI

struct FilteredList: View {
    var fetchRequest: FetchRequest<Singer>
    var singers: FetchedResults<Singer> {
        fetchRequest.wrappedValue
    }
    
    var body: some View {
        List(fetchRequest.wrappedValue, id: \.self) { singer in
            Text("\(singer.wrappedFirstName) \(singer.wrappedLastName)")
        }
    }
    
    init(filter: String) {
        fetchRequest = FetchRequest<Singer>(
            entity: Singer.entity(), sortDescriptors: [],
            predicate:NSPredicate(format: "lastName BEGINSWITH %@", filter))
    } 
}

// MARK: - Want to go further


struct FilteredListUpgrade<T: NSManagedObject, Content: View>: View {
    var fetchRequest: FetchRequest<T>
    var singers: FetchedResults<T> {
        fetchRequest.wrappedValue
    }
    let content: (T) -> Content
    
    var body: some View {
        List(fetchRequest.wrappedValue, id: \.self) { singer in
            self.content(singer)
        }
    }
    
    init(filterKey: String, filterValue: String, @ViewBuilder content: @escaping (T) -> Content) {
        fetchRequest = FetchRequest<T>(
            entity: T.entity(), sortDescriptors: [],
            predicate:NSPredicate(format: "@K BEGINSWITH %@", filterKey, filterValue))
        self.content = content
    }
}



