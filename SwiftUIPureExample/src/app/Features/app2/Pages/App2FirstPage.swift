//
//  App2FirstPage.swift
//  SwiftUITest
//
//  Created by Jason Rich Darmawan Onggo Putra on 12/11/23.
//

import SwiftUI

enum App2FirstRoute {
    case App2SecondPage
}

struct App2FirstPage: View {
    typealias ViewModel = App2FirstViewModel
    
    private let id: UUID
    
    @ObservedObject var navigationViewModel: NavigationViewModel
    
    @ObservedObject var viewModel: ViewModel
    @Binding var counter: Int
    
    @StateObject var app2SecondViewModel = App2SecondViewModel()
    
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
                    Text("App2FirstPage")
                    
                    Button {
                        navigationViewModel.path.append(App2FirstRoute.App2SecondPage)
                    } label: {
                        Text("Go to App2SecondPage")
                    }
                    
                    CounterComponent(counter: $counter)
                }
                
                Spacer()
            }
            
            Spacer()
        }
        .navigationDestination(for: App2FirstRoute.self) { value in
            switch value {
            case .App2SecondPage:
                App2SecondPage(
                    navigationViewModel: navigationViewModel,
                    viewModel: app2SecondViewModel,
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
        
        @State var counter: Int = 0
        
        var body: some View {
            NavigationStack {
                App2FirstPage(
                    navigationViewModel: navigationViewModel,
                    viewModel: App2FirstViewModel(),
                    counter: $counter
                )
            }
        }
    }
    
    return Container()
}
