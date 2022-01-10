//
//  StoreProductViewControllerRepresentable.swift
//  SwiftUIPresentAppStoreProduct
//
//  Created by Daisuke TONOSAKI on 2022/01/10.
//

import SwiftUI

struct StoreProductViewControllerRepresentable: UIViewControllerRepresentable {
    typealias UIViewControllerType = StoreProductViewController
    
    var isPresentStoreProduct: Binding<Bool>
    let appId: Int
 
    func makeUIViewController(context: Context) -> UIViewControllerType {
        let viewController = StoreProductViewController(isPresentStoreProduct: isPresentStoreProduct,
                                                        appId: appId)
        return viewController
        
    }

    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        if self.isPresentStoreProduct.wrappedValue {
            uiViewController.presentStoreProduct()
        }
    }
}
