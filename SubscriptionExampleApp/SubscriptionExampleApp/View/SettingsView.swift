//
//  Settings.swift
//  SubscriptionExampleApp
//
//  Created by Doğanay Şahin on 25.06.2022.
//

import SwiftUI

struct SettingsView: View {
    @State var isExpanded = true
    init(){
        UITableView.appearance().backgroundColor = .clear
    }
    var body: some View {
        Form{
            Section("What is the premium?") {
                DisclosureGroup("Benefits", isExpanded: $isExpanded) {
                    Text("Premium does something special...")
                }
            }
            
            
            Section("Plans") {
                List(1..<3){_ in
                    Button {
                        print("purchased..")
                        UserDefaults.standard.setValue(true, forKey: "purchased")
                    } label: {
                        HStack{
                            Text("productitle")
                                .font(.headline)
                            Spacer()
                            if !UserDefaults.standard.bool(forKey: "purchased"){
                                Text("productprice")
                                    .font(.caption).foregroundColor(.gray)
                            }else{
                                Image(systemName: "checkmark.circle.fill")
                                    .foregroundColor(.green)
                            }
                           
                            
                               
                            
                            
                        }
                    }

                }
            }

        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
