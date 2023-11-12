//
//  HomeFooterComponent.swift
//  SwiftUITest
//
//  Created by Jason Rich Darmawan Onggo Putra on 12/11/23.
//

import SwiftUI

struct HomeFooterComponent: View {
    private let id: UUID
    
    @Binding var selectedTabItem: HomeTabItem
    
    var onTabItemTap: (_ selectedTabItem: HomeTabItem) -> Void
    
    init(
        id: UUID = UUID(),
        selectedTabItem: Binding<HomeTabItem>,
        onTabItemTap: @escaping (_: HomeTabItem) -> Void
    ) {
        self.id = id
        
        self._selectedTabItem = selectedTabItem
        self.onTabItemTap = onTabItemTap
        
        printIfDebug("\(type(of: self)) \(#function) \(id)")
    }
    
    var body: some View {
        VStack(
            spacing: 0
        ) {
            Divider()
            
            HStack(
                spacing: 0
            ) {
                Spacer()
                
                Button {
                    onTabItemTap(.App1)
                } label: {
                    VStack(
                        spacing: 0
                    ) {
                        Image(systemName: selectedTabItem == .App1 ? "1.square.fill" : "1.square")
                            .resizable()
                            .renderingMode(/*@START_MENU_TOKEN@*/.template/*@END_MENU_TOKEN@*/)
                            .foregroundStyle(selectedTabItem == .App1 ? .blue : .gray)
                            .frame(width: 24, height: 24)
                        Text("App1")
                            .foregroundStyle(selectedTabItem == .App1 ? .blue : .gray)
                    }
                }
                
                Spacer()
                
                Button {
                    onTabItemTap(.App2)
                } label: {
                    VStack(
                        spacing: 0
                    ) {
                        Image(systemName: selectedTabItem == .App2 ? "2.square.fill" : "2.square")
                            .resizable()
                            .renderingMode(/*@START_MENU_TOKEN@*/.template/*@END_MENU_TOKEN@*/)
                            .foregroundStyle(selectedTabItem == .App2 ? .blue : .gray)
                            .frame(width: 24, height: 24)
                        Text("App2")
                            .foregroundStyle(selectedTabItem == .App2 ? .blue : .gray)
                    }
                }
                
                Spacer()
            }
            .padding(.top, 16)
        }
    }
}

#Preview {
    @State var selectedTabItem: HomeTabItem = .App1
    
    return HomeFooterComponent(
        selectedTabItem: $selectedTabItem,
        onTabItemTap: { tabItem in
            print(tabItem)
        }
    )
}
