//
//  FakeProductDetailView.swift
//  Fakestore
//
//  Created by Kittabun Sukkasem on 17/3/2567 BE.
//

import SwiftUI

struct FakeProductDetailView: View {
    @State var product: ProductModel?
    
    var body: some View {
        VStack(spacing: 16) {
            if let product = product {
                AsyncImage(url: URL(string: product.image)) { phase in
                    switch phase {
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 200, height: 200)
                            .cornerRadius(10)
                    case .empty:
                        Image(systemName: "photo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 200, height: 200)
                            .cornerRadius(10)
                    case .failure(_):
                        Image(systemName: "photo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 200, height: 200)
                            .cornerRadius(10)
                    @unknown default:
                        EmptyView()
                    }
                }
                
                Text(product.title)
                    .font(.title)
                    .fontWeight(.bold)
                
                Text(product.description)
                    .font(.body)
                
                Spacer()
            } else {
                Text("Loading...")
                    .font(.title)
                    .fontWeight(.bold)
            }
        }
        .padding()
    }
}

#Preview {
    FakeProductDetailView()
}
