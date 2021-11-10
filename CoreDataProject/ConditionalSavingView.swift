//
//  ConditionalSavingView.swift
//  CoreDataProject
//
//  Created by Giovanni Gaffé on 2021/11/10.
//

import SwiftUI

struct ConditionalSavingView: View {
    @Environment(\.managedObjectContext) var moc
    
    var body: some View {
        Button("Save") {
            try? self.moc.save()
        }
    }
}

struct ConditionalSavingView_Previews: PreviewProvider {
    static var previews: some View {
        ConditionalSavingView()
    }
}
