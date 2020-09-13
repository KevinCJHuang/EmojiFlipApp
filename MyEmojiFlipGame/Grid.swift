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
            ForEach (0..<self.items.count){ index in
                 self.AllocateSpace(layout: GridLayout(itemCount: self.items.count, in: geometry.size), item:self.items[index],index:index)
            }
        }
    }
    
    func AllocateSpace(layout: GridLayout, item: Item, index: Int) -> some View{
        return viewForItem(item)
            .frame(width:layout.itemSize.width, height: layout.itemSize.height)
            .position(layout.location(ofItemAt:index))
    }

}


