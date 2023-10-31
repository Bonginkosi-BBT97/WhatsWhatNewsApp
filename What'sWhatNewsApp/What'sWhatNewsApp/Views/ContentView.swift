//
//  ContentView.swift
//  What'sWhatNewsApp
//
//  Created by Bonginkosi Tshabalala on 2023/10/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var tabSelection = 1
    
    var body: some View {
        TabView(selection: $tabSelection) {
            NewsView()
                .tag(1)
            
           SearchView()
                .tag(2)
            
            SettingsView()
                .tag(3)
        }
        .overlay(alignment: .bottom) {
            CustomTabView(tabSelection: $tabSelection)
        }
    }
}

#Preview {
    ContentView()
}
