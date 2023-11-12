//
//  App1SecondPage.swift
//  SwiftUITest
//
//  Created by Jason Rich Darmawan Onggo Putra on 12/11/23.
//

import SwiftUI

struct App1SecondPage: View {
    typealias ViewModel = App1SecondViewModel
    
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
                    spacing: 0
                ) {
                    Text("App1SecondPage")
                    
                    NavigationLink {
                        NavigationLazyView(
                            build: App2FirstPage(
                                viewModel: App2FirstViewModel(),
                                counter: $counter
                            )
                        )
                    } label: {
                        Text("Go to App2FirstPage")
                    }
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
        @State var counter = 0
        
        var body: some View {
            NavigationStack {
                App1SecondPage(
                    viewModel: App1SecondViewModel(),
                    counter: $counter
                )
            }
        }
    }
    
    return Container()
}
