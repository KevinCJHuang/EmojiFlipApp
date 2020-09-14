//
//  Grid.swift
//  MyEmojiFlipGame
//
//  Created by Kevin Huang on 2020-09-12.
//  Copyright © 2020 Chengjie Huang. All rights reserved.
//

import SwiftUI

struct Grid<Item, ItemView>: View where Item: Identifiable, ItemView: View{
    var items: Array<Item>
    var viewForItem: (Item) -> ItemView
    
    init (items: Array<Item>, viewForItem: @escaping (Item)->ItemView) {
        self.items = items
        self.viewForItem = viewForItem
    }
    
    var body: some View {
        GeometryReader{ geometry in
            ForEach (self.items){ item in
                 self.AllocateSpace(layout: GridLayout(itemCount: self.items.count, in: geometry.size), item:item)
            }
        }
    }
    
    func AllocateSpace(layout: GridLayout, item: Item) -> some View{
        let index = items.findIndex(lookingFor: item)
        return viewForItem(item)
            .frame(width:layout.itemSize.width, height: layout.itemSize.height)
            .position(layout.location(ofItemAt:index!))
    }
}
