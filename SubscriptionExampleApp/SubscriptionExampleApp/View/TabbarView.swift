//
//  TabbarView.swift
//  SubscriptionExampleApp
//
//  Created by Doğanay Şahin on 25.06.2022.
//

import SwiftUI

struct TabbarView: View {
    @StateObject var storeManager = StoreManager()
    let productIDs = [
        
        "YOUR_INAPP_ID",
        "YOUR_INAPP_ID1"
        
    ]
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                
                    Label("Home"  , systemImage: "homekit")
                        .tag(0)
                        
                        
                }
            
            SettingsView(storeManager: storeManager).tabItem {
                Label("Settings", systemImage: "gear")
            }
        }.onAppear {
            storeManager.getProducts(productIDs: productIDs)
        }
    }
}

struct TabbarView_Previews: PreviewProvider {
    static var previews: some View {
        TabbarView()
    }
}
