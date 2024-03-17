//
//  FakeProductView.swift
//  Fakestore
//
//  Created by Kittabun Sukkasem on 17/3/2567 BE.
//

import SwiftUI

struct FakeProductView: View {
    @ObservedObject var viewModel = FakeProductViewModel()
    var body: some View {
        NavigationView { // เพิ่ม NavigationView รอบโค้ด
            VStack {
                if viewModel.isLoading {
                    ProgressView("Loading...")
                } else {
                    List(viewModel.products, id: \.id) { product in
                        NavigationLink(destination: FakeProductDetailView(product: product)) {
                              VStack(alignment: .leading) {
                                  AsyncImage(url: URL(string: product.image))
                                      .scaledToFit()
                                      .frame(maxWidth: .infinity)
                                      .frame(width: 100, height: 100)
                                      .cornerRadius(10)
                                  Text(product.title)
                                      .font(.headline)
                                  Text(product.description)
                                      .font(.subheadline)
                                      .foregroundColor(.gray)
                              }
                              .padding(.vertical, 8)
                              .background(Color.white)
                              .cornerRadius(10)
                          }
                    }
                    .listStyle(PlainListStyle())
                    .padding()
                   
                }
            }
            .navigationTitle("Products") // กำหนดชื่อให้กับ App Bar
            .onAppear {
                viewModel.getProducts()
            }
            
        }
    }
}


#Preview {
    FakeProductView()
}
