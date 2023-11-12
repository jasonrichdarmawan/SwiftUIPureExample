//
//  App2SecondPage.swift
//  SwiftUITest
//
//  Created by Jason Rich Darmawan Onggo Putra on 12/11/23.
//

import SwiftUI

enum App2SecondRoute {
    case App1FirstPage
}

struct App2SecondPage: View {
    typealias ViewModel = App2SecondViewModel
    
    private let id: UUID
    
    @ObservedObject var navigationViewModel: NavigationViewModel
    @ObservedObject var viewModel: ViewModel
    
    @Binding var counter: Int
    
    @StateObject var app1FirstViewModel = App1FirstViewModel()
    
    init(
        id: UUID = UUID(),
        navigationViewModel: NavigationViewModel,
        viewModel: ViewModel,
        counter: Binding<Int>
    ) {
        self.id = id
        self.navigationViewModel = navigationViewModel
        self.viewModel = viewModel
        self._counter = counter
        
        printIfDebug("\(type(of: self)) \(#function) \(id)")
    }
    
    var body: some View {
        VStack(
            spacing: 0
        ) {
            HStack(
                spacing: 0
            ) {
                VStack(
                    alignment: .leading,
                    spacing: 0
                ) {
                    Text("App2SecondPage")
                    
                    Button {
                        navigationViewModel.path.append(App2SecondRoute.App1FirstPage)
                    } label: {
                        Text("Go to App2FirstPage")
                    }
                }
                
                Spacer()
            }
            
            Spacer()
        }
        .navigationDestination(for: App2SecondRoute.self) { value in
            switch value {
            case .App1FirstPage:
                App1FirstPage(
                    navigationViewModel: navigationViewModel,
                    viewModel: app1FirstViewModel,
                    counter: $counter
                )
            }
        }
        .onAppear {
            printIfDebug("\(type(of: self)) onAppear \(id)")
        }
        .onDisappear {
            printIfDebug("\(type(of: self)) onDisappear \(id)")
        }
    }
}

#Preview {
    struct Container: View {
        @StateObject var navigationViewModel = NavigationViewModel()
        @StateObject var viewModel = App2SecondViewModel()
        
        @State var counter = 0
        
        var body: some View {
            NavigationStack {
                App2SecondPage(
                    navigationViewModel: navigationViewModel,
                    viewModel: viewModel,
                    counter: $counter
                )
            }
        }
    }
    
    return Container()
}
