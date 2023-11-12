//
//  App2FirstPage.swift
//  SwiftUITest
//
//  Created by Jason Rich Darmawan Onggo Putra on 12/11/23.
//

import SwiftUI

struct App2FirstPage: View {
    typealias ViewModel = App2FirstViewModel
    
    private let id: UUID
    
    @ObservedObject var viewModel: ViewModel
    @Binding var counter: Int
    
    init(
        id: UUID = UUID(),
        viewModel: ViewModel,
        counter: Binding<Int>
    ) {
        self.id = id
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
                    
                    NavigationLink {
                        NavigationLazyView(
                            build: App2SecondPage(
                                viewModel: App2SecondViewModel(),
                                counter: $counter
                            )
                        )
                    } label: {
                        Text("Go to App2SecondPage")
                    }
                    
                    CounterComponent(counter: $counter)
                }
                
                Spacer()
            }
            
            Spacer()
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
        @State var counter: Int = 0
        
        var body: some View {
            NavigationStack {
                App2FirstPage(
                    viewModel: App2FirstViewModel(),
                    counter: $counter
                )
            }
        }
    }
    
    return Container()
}
