//
//  HomePage.swift
//  SwiftUITest
//
//  Created by Jason Rich Darmawan Onggo Putra on 12/11/23.
//

import SwiftUI

struct HomePage: View {
    private let id: UUID
    
    @ObservedObject var navigationViewModel: NavigationViewModel
    
    @ObservedObject var viewModel: HomeViewModel
    
    init(
        id: UUID = UUID(),
        navigationViewModel: NavigationViewModel,
        viewModel: HomeViewModel
    ) {
        self.id = id
        
        self.navigationViewModel = navigationViewModel
        self.viewModel = viewModel
        
        printIfDebug("\(type(of: self)) \(#function) \(id)")
    }
    
    var body: some View {
        NavigationStack(path: $navigationViewModel.path) {
            VStack(
                spacing: 0
            ) {
                HomeBodyComponent(
                    navigationViewModel: navigationViewModel,
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
    @StateObject var navigationViewModel = NavigationViewModel()
    
    return NavigationStack {
        HomePage(
            navigationViewModel: navigationViewModel,
            viewModel: viewModel
        )
    }
}
