//
//  SwiftUITestApp.swift
//  SwiftUITest
//
//  Created by Jason Rich Darmawan Onggo Putra on 12/11/23.
//

import SwiftUI

@main
struct SwiftUITestApp: App {
    @StateObject var homeViewModel = HomeViewModel(
        selectedTabItem: .App1
    )
    
    var body: some Scene {
        WindowGroup {
            HomePage(
                viewModel: homeViewModel
            )
        }
    }
}
