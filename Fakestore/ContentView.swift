//
//  ContentView.swift
//  Fakestore
//
//  Created by Kittabun Sukkasem on 17/3/2567 BE.
//

import SwiftUI

struct ContentView: View {
    init() {
        UITabBar.appearance().barTintColor = UIColor.white
    }
    var body: some View {
        TabView {
            FakeProductView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            
            Text("Created by Kittabun Sukkasem")
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
                }
        }
        .edgesIgnoringSafeArea(.top)
        .accentColor(.purple)
        .background(Color.red)
    }
}

#Preview {
    ContentView()
}
