//
//  App1SecondPage.swift
//  SwiftUITest
//
//  Created by Jason Rich Darmawan Onggo Putra on 12/11/23.
//

import SwiftUI

enum App1SecondRoute {
    case App2FirstPage
}

struct App1SecondPage: View {
    typealias ViewModel = App1SecondViewModel
    
    private let id: UUID
    
    @ObservedObject var navigationViewModel: NavigationViewModel
    
    @ObservedObject var viewModel: ViewModel
    @Binding var counter: Int
    
    @StateObject var app2FirstViewModel = App2FirstViewModel()
    
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
                    Text("App1SecondPage")
                    
                    Button {
                        navigationViewModel.path.append(App1SecondRoute.App2FirstPage)
                    } label: {
                        Text("Go to App2FirstPage")
                    }
                }
                
                Spacer()
            }
            
            Spacer()
        }
        .navigationDestination(for: App1SecondRoute.self) { value in
            switch value {
            case .App2FirstPage: 
                App2FirstPage(
                    navigationViewModel: navigationViewModel,
                    viewModel: app2FirstViewModel,
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
        
        @State var counter = 0
        
        var body: some View {
            NavigationStack {
                App1SecondPage(
                    navigationViewModel: navigationViewModel,
                    viewModel: App1SecondViewModel(),
                    counter: $counter
                )
            }
        }
    }
    
    return Container()
}
