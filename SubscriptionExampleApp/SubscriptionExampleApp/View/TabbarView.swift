//
//  TabbarView.swift
//  SubscriptionExampleApp
//
//  Created by Doğanay Şahin on 25.06.2022.
//

import SwiftUI

struct TabbarView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                
                    Label("Home"  , systemImage: "homekit")
                        .tag(0)
                        
                        
                }
            
            SettingsView().tabItem {
                Label("Settings", systemImage: "gear")
            }
    }
    }
}

struct TabbarView_Previews: PreviewProvider {
    static var previews: some View {
        TabbarView()
    }
}
