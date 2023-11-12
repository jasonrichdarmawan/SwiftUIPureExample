//
//  CounterComponent.swift
//  SwiftUIPureExample
//
//  Created by Jason Rich Darmawan Onggo Putra on 12/11/23.
//

import SwiftUI

struct CounterComponent: View {
    private let id: UUID
    
    @Binding var counter: Int
    
    init(
        id: UUID = UUID(),
        counter: Binding<Int>
    ) {
        self.id = id
        self._counter = counter
    }
    
    var body: some View {
        HStack(
            spacing: 0
        ) {
            Button {
                counter -= 1
            } label: {
                Image(systemName: "minus.square")
                    .resizable()
                    .frame(width: 24, height: 24)
            }
            
            Text("Counter: \(counter)")
            
            Button {
                counter += 1
            } label: {
                Image(systemName: "plus.square")
                    .resizable()
                    .frame(width: 24, height: 24)
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
        @State var counter = 0
        
        var body: some View {
            CounterComponent(counter: $counter)
        }
    }
    
    return Container()
}
