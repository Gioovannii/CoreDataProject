//
//  HashableView.swift
//  CoreDataProject
//
//  Created by Giovanni Gaffé on 2021/11/10.
//

import SwiftUI


struct Student: Hashable {
    let name: String
}

struct HashableView: View {
    let students = [Student(name: "Harry Potter"), Student(name: "Hermione Granger")]
    
    var body: some View {
        List(students, id: \.self) { student in
            Text(student.name)
        }
    }
}

struct HashableView_Previews: PreviewProvider {
    static var previews: some View {
        HashableView()
    }
}
