//
//  ContentView.swift
//  TuneIn
//
//  Created by Labhesh Dudi on 11/05/26.
//

import SwiftUI
import SwiftData
import SwiftfulUI
import SwiftfulRouting

struct ContentView: View {
    
    
    @State private var users: [User] = []
    @State private var products: [Product] = []
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                ForEach(products) { product in
                    HStack {
                        RoundedRectangle(cornerSize: CGSize(width: 8, height: 8))
                            .frame(width: 21, height: 21)
                            .foregroundStyle(.pink)
                        Text(product.title)
                            .foregroundStyle(.spotifyGreen)
                    }
                }
            }
        }
        .padding()
        .task {
            await getData()
        }
    }
    
    private func getData() async {
        do {
            users = try await DatabaseHelper().getUsers()
            products = try await DatabaseHelper().getProducts()
        } catch {
            
        }
    }
    
//    @Environment(\.modelContext) private var modelContext
//    @Query private var items: [Item]
    

//    var body: some View {
//        NavigationSplitView {
//            List {
//                ForEach(items) { item in
//                    NavigationLink {
//                        Text("Item at \(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))")
//                    } label: {
//                        Text(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))
//                    }
//                }
//                .onDelete(perform: deleteItems)
//            }
//#if os(macOS)
//            .navigationSplitViewColumnWidth(min: 180, ideal: 200)
//#endif
//            .toolbar {
//#if os(iOS)
//                ToolbarItem(placement: .navigationBarTrailing) {
//                    EditButton()
//                }
//#endif
//                ToolbarItem {
//                    Button(action: addItem) {
//                        Label("Add Item", systemImage: "plus")
//                    }
//                }
//            }
//
//            .task {
//                await getData()
//            }
//
//        } detail: {
//            Text("Select an item")
//        }
//    }
    

//    private func addItem() {
//        withAnimation {
//            let newItem = Item(timestamp: Date())
//            modelContext.insert(newItem)
//        }
//    }
//
//    private func deleteItems(offsets: IndexSet) {
//        withAnimation {
//            for index in offsets {
//                modelContext.delete(items[index])
//            }
//        }
//    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
