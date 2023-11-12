//
//  App1FirstPage.swift
//  SwiftUITest
//
//  Created by Jason Rich Darmawan Onggo Putra on 12/11/23.
//

import SwiftUI

enum App1FirstRoute {
    case App1SecondPage
}

struct App1FirstPage: View {
    typealias ViewModel = App1FirstViewModel
    
    private let id: UUID
    
    @ObservedObject var navigationViewModel: NavigationViewModel
    
    @ObservedObject var viewModel: ViewModel
    @Binding var counter: Int
    
    @StateObject var app1SecondViewModel: App1SecondViewModel = App1SecondViewModel()
    
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
                    Text("App1FirstPage")
                    
                    Button {
                        navigationViewModel.path.append(App1FirstRoute.App1SecondPage)
                    } label: {
                        Text("Go to App1SecondPage")
                    }
                
                    CounterComponent(counter: $counter)
                }
                
                Spacer()
            }
            
            Spacer()
        }
        .navigationDestination(for: App1FirstRoute.self) { value in
            switch value {
            case .App1SecondPage:
                App1SecondPage(
                    navigationViewModel: navigationViewModel,
                    viewModel: app1SecondViewModel,
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
                App1FirstPage(
                    navigationViewModel: navigationViewModel,
                    viewModel: App1FirstViewModel(),
                    counter: $counter
                )
            }
        }
    }
    
    return Container()
}
