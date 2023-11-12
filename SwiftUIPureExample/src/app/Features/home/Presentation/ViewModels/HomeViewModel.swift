//
//  HomeViewModel.swift
//  SwiftUITest
//
//  Created by Jason Rich Darmawan Onggo Putra on 12/11/23.
//

import Foundation

enum HomeTabItem {
    case App1
    case App2
}

final class HomeViewModel: ObservableObject {
    @Published var selectedTabItem: HomeTabItem
    
    @Published var counter: Int
    
    init(
        selectedTabItem: HomeTabItem = .App1,
        counter: Int = 0
    ) {
        self.selectedTabItem = selectedTabItem
        self.counter = counter
    }
}
