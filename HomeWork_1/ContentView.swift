//
//  ContentView.swift
//  HomeWork_1
//
//  Created by Виталий Оранский on 22.01.2022.
//

import SwiftUI

struct ContentView: View {
    
    var emojis = ["🚗", "🚕", "🚙", "🚌", "🚎", "🏎", "🚓", "🚑", "🚒", "🚐", "🛻", "🚚", "🚛", "🚜"]
    var emojisTwo = ["⚽️", "🏀", "🏈", "⚾️", "🥎", "🎾", "🏐", "🏉", "🥏", "🎱", "🪀", "🏓", "🏸"]
    var emojisThree = ["🇷🇺", "🇵🇾", "🇷🇼", "🇸🇳", "🇻🇨", "🇰🇳", "🇼🇸", "🇹🇬", "🇺🇿", "🇫🇴", "🇹🇩", "🇪🇹"]
    
    @State var startEmojis = ["🚗", "🚕", "🚙", "🚌", "🚎", "🏎", "🚓", "🚑", "🚒", "🚐", "🛻", "🚚", "🚛", "🚜"]
    @State var emojiCount = 6
    
    var body: some View {
        VStack {
            Text("Memorize")
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: widthThatBestFits(cardCount: emojiCount)))]) {
                    ForEach(startEmojis[0..<emojiCount].shuffled(), id: \.self) { emoji in
                        CardView(content: emoji)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            .foregroundColor(.red)
            Spacer(minLength: 20)
            HStack(alignment: .bottom, spacing: 50.0) {
                    themeOne
                    themeTwo
                    themeThree
            }
            Spacer()
            HStack {
                remove
                Spacer()
                add
            }.font(.largeTitle)
            
            
        }
        .padding(.horizontal)
        
        
    }
    
    var remove: some View {
        Button {
            if emojiCount > 1 {
                emojiCount -= 1
            }
        } label: {
            Image(systemName: "minus.circle")
        }
    }
    
    var add: some View {
        Button {
            if emojiCount < startEmojis.count {
                emojiCount += 1
            }
        } label: {
            Image(systemName: "plus.circle")
        }
    }
    
    var themeOne: some View {
        Button {
            if emojiCount > emojis.count {
                emojiCount = emojis.count
            }
            startEmojis = emojis
            emojiCount = Int.random(in: 4...startEmojis.count)
        } label: {
            VStack {
                Image(systemName: "car")
                Text("Vehicles").font(.subheadline)
            }.font(.largeTitle)
            
        }
    }
    
    var themeTwo: some View {
        Button {
            if emojiCount > emojisTwo.count {
                emojiCount = emojisTwo.count
            }
            startEmojis = emojisTwo
            emojiCount = Int.random(in: 4...startEmojis.count)

        } label: {
            VStack {
                Image(systemName: "hare")
                Text("Games").font(.subheadline)
            }.font(.largeTitle)
            
        }
    }
    
    var themeThree: some View {
        Button {
            if emojiCount > emojisThree.count {
                emojiCount = emojisThree.count
            }
            startEmojis = emojisThree
            emojiCount = Int.random(in: 4...startEmojis.count)

        } label: {
            VStack {
                Image(systemName: "flag")
                Text("Flags").font(.subheadline)
            }.font(.largeTitle)
            
        }
    }
    
    func widthThatBestFits(cardCount: Int) -> CGFloat {
        var size: CGFloat = 0
        if cardCount > 9 {
            size = 70
        } else if cardCount < 10 {
            size = 90
        }
        
        return size
    }
    
}





struct CardView: View {
    var content: String
    @State var isFaceUp: Bool = true
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 25)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                
                Text(content).font(.largeTitle)
            } else {
                shape.fill()
            }
        }.onTapGesture {
            isFaceUp = !isFaceUp
        }
        
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
.previewInterfaceOrientation(.portrait)
    }
}
