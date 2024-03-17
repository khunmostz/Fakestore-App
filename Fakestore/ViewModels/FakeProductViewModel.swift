//
//  FakeProductViewModel.swift
//  Fakestore
//
//  Created by Kittabun Sukkasem on 17/3/2567 BE.
//

import Foundation
import Combine

class FakeProductViewModel: ObservableObject{
    @Published var products: [ProductModel] = []
    @Published var isLoading: Bool = false
    @Published var productSelected: ProductModel?
    private var cancellable: AnyCancellable?
    
    // MARK: GET-PRODUCTS
    func getProducts() {
        print("GET: FAKE PRODUCT")
        isLoading = true
        let url = URL(string: "https://fakestoreapi.com/products")!
        let response = URLSession.shared.dataTaskPublisher(for: url)
                    .map(\.data)
                    .decode(type: [ProductModel].self, decoder: JSONDecoder())
                    .replaceError(with: [])
                    .receive(on: DispatchQueue.main)
                    .sink(receiveCompletion: { [weak self] completion in
                        switch completion {
                        case .finished:
                            self?.isLoading = false
                        case .failure(let error):
                            print("Error: \(error)")
                            self?.isLoading = false
                        }
                    }, receiveValue: { [weak self] products in
                        self?.products = products
                    })
        
        cancellable = response;
    }
    
    func selectedProduct(product: ProductModel?){
        productSelected = product;
    }
}


