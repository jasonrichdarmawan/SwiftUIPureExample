//
//  App1SecondViewModel.swift
//  SwiftUITest
//
//  Created by Jason Rich Darmawan Onggo Putra on 12/11/23.
//

import Foundation

final class App1SecondViewModel: ObservableObject {
    private let id: UUID
    
    init(
        id: UUID = UUID()
    ) {
        self.id = id
        printIfDebug("\(type(of: self)) \(#function) \(id)")
    }
    
    deinit {
        printIfDebug("\(type(of: self)) \(#function) \(id)")
    }
}
