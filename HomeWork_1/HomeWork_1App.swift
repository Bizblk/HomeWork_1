//
//  HomeWork_1App.swift
//  HomeWork_1
//
//  Created by Виталий Оранский on 22.01.2022.
//

import SwiftUI

@main
struct HomeWork_1App: App {
    let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
