//
//  HomePage.swift
//  SwiftUITest
//
//  Created by Jason Rich Darmawan Onggo Putra on 12/11/23.
//

import SwiftUI

struct HomePage: View {
    private let id: UUID
    
    @ObservedObject var viewModel: HomeViewModel
    
    init(
        id: UUID = UUID(),
        viewModel: HomeViewModel
    ) {
        self.id = id
        
        self.viewModel = viewModel
        
        printIfDebug("\(type(of: self)) \(#function) \(id)")
    }
    
    var body: some View {
        NavigationStack {
            VStack(
                spacing: 0
            ) {
                HomeBodyComponent(
                    selectedTabItem: $viewModel.selectedTabItem
                )
                
                Spacer()
                
                HomeFooterComponent(
                    selectedTabItem: $viewModel.selectedTabItem,
                    onTabItemTap: { tabItem in
                        printIfDebug("\(type(of: self)) onTabItemTap \(id)")
                        viewModel.selectedTabItem = tabItem
                    }
                )
            }
        }
    }
}

#Preview {
    @StateObject var viewModel = HomeViewModel()
    
    return NavigationStack {
        HomePage(viewModel: viewModel)
    }
}
