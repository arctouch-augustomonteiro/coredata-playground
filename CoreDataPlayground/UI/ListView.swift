//
//  ContentView.swift
//  CoreDataPlayground
//
//  Created by Augusto Monteiro on 06/04/22.
//

import SwiftUI

struct ListView: View {
    
    @ObservedObject var viewModel: ListViewModel
    
    init(viewModel: ListViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack {
            List {
                ForEach(viewModel.items) { item in
                    Text(item.name ?? "")
                }
                .onDelete(perform: deleteItem)
            }
            .listStyle(.plain)
            
            Button("Add item") {
                viewModel.addItem()
            }
            .buttonStyle(.borderedProminent)
        }
        .padding(.vertical)
    }
    
    private func deleteItem(at offsets: IndexSet) {
        offsets.forEach { index in
            let item = viewModel.items[index]
            viewModel.deleteItem(itemId: item.id)
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        let viewContext = CoreDataManager.shared.container.viewContext
        ListView(viewModel: ListViewModel(context: viewContext))
    }
}
