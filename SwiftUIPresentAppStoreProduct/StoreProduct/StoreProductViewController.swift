//
//  StoreProductViewController.swift
//  SwiftUIPresentAppStoreProduct
//
//  Created by Daisuke TONOSAKI on 2022/01/10.
//

import UIKit
import SwiftUI
import StoreKit

class StoreProductViewController: UIViewController {
    
    private var isPresentStoreProduct: Binding<Bool>
    private let appId: Int
    
    init(isPresentStoreProduct: Binding<Bool>, appId: Int) {
        self.isPresentStoreProduct = isPresentStoreProduct
        self.appId = appId
        
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    func presentStoreProduct() {
        let storeProductViewController = SKStoreProductViewController()
        storeProductViewController.delegate = self
        
        let parameters = [SKStoreProductParameterITunesItemIdentifier: self.appId]
        storeProductViewController.loadProduct(withParameters: parameters) { status, error -> Void in
            if status {
                self.present(storeProductViewController, animated: true, completion: nil)
            } else {
                if let error = error {
                    print("Error: \(error.localizedDescription)")
                }
            }
        }
        
        DispatchQueue.main.async {
            self.isPresentStoreProduct.wrappedValue = false
        }
    }
}


// MARK: - SKStoreProductViewControllerDelegate
extension StoreProductViewController: SKStoreProductViewControllerDelegate {
    func productViewControllerDidFinish(_ viewController: SKStoreProductViewController) {
        viewController.presentingViewController?.dismiss(animated: true, completion: nil)
    }
}
