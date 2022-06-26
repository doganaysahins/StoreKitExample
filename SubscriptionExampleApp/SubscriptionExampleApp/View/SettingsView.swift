//
//  Settings.swift
//  SubscriptionExampleApp
//
//  Created by Doğanay Şahin on 25.06.2022.
//

import SwiftUI
import StoreKit
struct SettingsView: View {
    @State var isExpanded = true
    @StateObject var storeManager: StoreManager

    
    

    var body: some View {
        Form{
            Section("What is the premium?") {
                DisclosureGroup("Benefits", isExpanded: $isExpanded) {
                    Text("Premium does something special...")
                }
            }
            
            
            Section("Plans") {
                List(storeManager.myProducts, id : \.self){products in
                    Button {
                        storeManager.purchaseProduct(product: products)
                        UserDefaults.standard.setValue(true, forKey: products.productIdentifier)
                    } label: {
                        HStack{
                            VStack(alignment: .leading){
                                Text(products.localizedTitle)
                                    .font(.headline)
                                Text(products.localizedDescription)
                                    .font(.caption2)
                                    .foregroundColor(.gray)
                            }
                          
                            Spacer()
                            if !UserDefaults.standard.bool(forKey: products.productIdentifier){
                                Text("\(products.localizedPrice)")
                                    .font(.caption).foregroundColor(.gray)
                            }else{
                                Image(systemName: "checkmark.circle.fill")
                                    .foregroundColor(.green)
                            }
                           
                            
                               
                            
                            
                        }
                    }

                }
            }
            Button {
                storeManager.restoreProducts()
            } label: {
                Text("Restore Product")
            }


        }
       
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(storeManager: StoreManager())
    }
}


extension SKProduct {
    var localizedPrice: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = priceLocale
        return formatter.string(from: price)!
    }
}
