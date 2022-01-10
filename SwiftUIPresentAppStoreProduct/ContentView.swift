//
//  ContentView.swift
//  SwiftUIPresentAppStoreProduct
//
//  Created by Daisuke TONOSAKI on 2022/01/10.
//

import SwiftUI

struct ContentView: View {
    @State private var isPresentStoreProduct: Bool = false
    
    var body: some View {
        VStack {
            Button {
                self.isPresentStoreProduct = true
            } label: {
                Text("App Store Link")
            }
            
            
            StoreProductViewControllerRepresentable(isPresentStoreProduct: self.$isPresentStoreProduct,
                                                    appId: 284602850)
                .frame(width: 0, height: 0)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
