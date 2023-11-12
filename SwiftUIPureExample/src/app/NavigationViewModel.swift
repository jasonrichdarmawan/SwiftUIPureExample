//
//  File.swift
//  SwiftUIPureExample
//
//  Created by Jason Rich Darmawan Onggo Putra on 12/11/23.
//

import Foundation
import SwiftUI

final class NavigationViewModel: ObservableObject {
    private let id: UUID
    
    @Published var path: NavigationPath
    
    init(
        id: UUID = UUID(),
        path: NavigationPath = NavigationPath()
    ) {
        self.id = id
        self.path = path
        
        printIfDebug("\(type(of: self)) \(#function) \(id)")
    }
    
    deinit {
        printIfDebug("\(type(of: self)) \(#function) \(id)")
    }
}
