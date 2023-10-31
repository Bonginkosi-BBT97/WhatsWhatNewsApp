//
//  SettingsView.swift
//  What'sWhatNewsApp
//
//  Created by Bonginkosi Tshabalala on 2023/10/21.
//

import SwiftUI
import StoreKit

struct SettingsView: View {
    @StateObject var purchaseViewModel = PurchaseViewModel()
    @AppStorage("purchased") var purchased = false
    
    
    var body: some View {
        NavigationView {
            if purchased == false {
                VStack {
                    Text("Subscribe To Access Settings.")
                        .font(.largeTitle)
                        .multilineTextAlignment(.center)
                        .padding(.top)
                    
    
                    Spacer()
                    
                    Image(systemName: "lock.circle.fill")
                        .resizable()
                        .frame(width: 120, height: 120)
                        .padding(.bottom)
                    
                    Text("Unlock all features with a subscription")
                        .font(.headline)
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 10)
                    
                    HStack(spacing: 30) {
                        Button {
                            Task {
                                let viewModel = purchaseViewModel
                                await buy(product: viewModel.subcriptions[1])
                            }
                        } label: {
                            VStack {
                                Text("Monthly")
                                    .font(.headline)
                                Text("R3.99/Month")
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }
                        }
                        
                        Button {
                            Task {
                                let viewModel = purchaseViewModel
                                await buy(product: viewModel.subcriptions.first!)
                            }
                        } label: {
                            VStack {
                                Text("Yearly")
                                    .font(.headline)
                                Text("R39.99/Year")
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                    
                    Spacer()
                    Text("The subscription gives you access to different settings including Profile settings, Theme & Appearance, Sounds & Notifications and Subscription & Billing.")
                        .font(.subheadline)
                        .multilineTextAlignment(.center)
                        .padding(.all)
                    Spacer()
                    
                    Text("By subscribing, you agree to the terms of use and privacy policy.")
                        .font(.footnote)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.secondary)
                        .padding(.bottom)
                }
                .padding()
                .preferredColorScheme(.dark)
            } else {
                Form {
                    Section("About") {
                        Text("This app keeps you up to date with the latest news. Premium content coming soon.")
                    }
                }
                .navigationTitle("Settings")
                .preferredColorScheme(.dark)
            }
        }
        .task {
            if purchaseViewModel.purchasedSubscriptions.isEmpty {
                purchased = false
            } else {
                purchased = true
            }
        }
    }
    
    func buy(product: Product) async {
        do {
            if try await purchaseViewModel.purchase(product) != nil {
                purchased = true
            }
        } catch {
            print("Purchased Failed")
        }
    }
}

#Preview {
    SettingsView()
}
