//
//  AppView.swift
//  Mall of Shopping
//
//  Created by Anish Pillai on 2020-03-24.
//  Copyright © 2020 Anish. All rights reserved.
//

import SwiftUI

struct AppView: View {
    @EnvironmentObject var orderedItems: OrderedItems
    
    private var tabsCount: CGFloat = 3
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .bottomLeading) {
                // TabView
                TabView {
                    IndividualGrocery()
                        .tabItem {
                            Image(systemName: "list.dash")
                            Text("Menu")
                    }
                    
                    OrderedGroceryView() // Test
                        .tabItem {
                            Image(systemName: "cart.fill")
                            Text("Orders")
                    }.edgesIgnoringSafeArea(.top)
                    
                    CustomerOrderHistoryView()
                        .tabItem {
                            Image(systemName: "star.fill")
                            Text("Order History")
                    }
                    
                    OfferView()
                        .tabItem {
                            Image(systemName: "indianrupeesign.circle")
                            Text("Offers")
                    }
                    
                    IndividualGrocery()
                        .tabItem {
                            Image(systemName: "heart.fill")
                            Text("Add Grocery")
                    }
                }
                
                // Badge View
                ZStack {
                    Circle()
                        .foregroundColor(.red)
                    
                    Text("\(self.orderedItems.total)")
                        .foregroundColor(.white)
                        .font(Font.system(size: 12))
                }
                .frame(width: 20, height: 20)
                    //.offset(x: ( ( 2 * self.badgePosition) - 2 ) * ( geometry.size.width / ( 2 * self.tabsCount ) ), y: -30)
                    .offset(x: 190, y: -30)
                    .opacity(self.orderedItems.total == 0 ? 0 : 1)
            }
        }
    }
}

struct AppView_Previews: PreviewProvider {
    
    static var previews: some View {
        AppView()
    }
}
