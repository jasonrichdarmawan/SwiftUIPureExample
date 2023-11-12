//
//  HomeBodyComponent.swift
//  SwiftUITest
//
//  Created by Jason Rich Darmawan Onggo Putra on 12/11/23.
//

import SwiftUI

struct HomeBodyComponent: View {
    private let id: UUID
    
    @Binding var selectedTabItem: HomeTabItem
    @State var counter: Int
    
    @StateObject var app1FirstViewModel: App1FirstViewModel
    @StateObject var app2FirstViewModel: App2FirstViewModel
    
    init(
        id: UUID = UUID(),
        selectedTabItem: Binding<HomeTabItem>,
        counter: Int = 0
    ) {
        self.id = id
        
        self._selectedTabItem = selectedTabItem
        self._counter = State(wrappedValue: counter)
        
        self._app1FirstViewModel = StateObject(wrappedValue: App1FirstViewModel())
        self._app2FirstViewModel = StateObject(wrappedValue: App2FirstViewModel())
        
        printIfDebug("\(type(of: self)) \(#function) \(id)")
    }
    
    var body: some View {
        VStack(
            spacing: 0
        ) {
            switch selectedTabItem {
            case .App1:
                App1FirstPage(
                    viewModel: app1FirstViewModel,
                    counter: $counter
                )
            case .App2:
                App2FirstPage(
                    viewModel: app2FirstViewModel,
                    counter: $counter
                )
            }
        }
    }
}

#Preview {
    struct Container: View {
        @State var selectedTabItem: HomeTabItem = .App1
        
        var body: some View {
            NavigationStack {
                HomeBodyComponent(
                    selectedTabItem: $selectedTabItem
                )
            }
        }
    }
    
    return Container()
}
