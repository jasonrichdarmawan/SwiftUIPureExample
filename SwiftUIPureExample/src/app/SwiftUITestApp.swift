//
//  SwiftUITestApp.swift
//  SwiftUITest
//
//  Created by Jason Rich Darmawan Onggo Putra on 12/11/23.
//

import SwiftUI

@main
struct SwiftUITestApp: App {
    @StateObject var homeViewModel = HomeViewModel()
    @StateObject var navigationviewModel = NavigationViewModel()
    
    var body: some Scene {
        WindowGroup {
            HomePage(
                navigationViewModel: navigationviewModel,
                viewModel: homeViewModel
            )
        }
    }
}
