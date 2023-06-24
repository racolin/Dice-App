//
//  ContentView.swift
//  Dice App
//
//  Created by Administrator on 24/06/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State var leftNumber = 1
    @State var rightNumber = 6
    
    var body: some View {
        ZStack {
            Color(uiColor: .systemTeal)
                .ignoresSafeArea(.all)
            VStack {
                
                Image("dice")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 180, height: 180)
                
                Spacer()
                
                HStack(spacing: 36) {
                    DicesView(n: leftNumber)
                    DicesView(n: rightNumber)
                }
                .padding(24)
                
                Spacer()
            
                Button(action: {
                    self.leftNumber = Int.random(in: 1...6)
                    self.rightNumber = Int.random(in: 1...6)
                    
                }) {
                    Text("Roll")
                        .font(.system(size: 32))
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                }
                .background(.red)
                .cornerRadius(12)
            }
            .padding(.horizontal)
            
        }
    }
}


struct DicesView: View {
    let n : Int
    
    init(n: Int) {
        switch (n) {
        case ..<1:
            self.n = 1
            break
        case 1...6:
            self.n = n
            break
        case 6...:
            self.n = 6
            break
        default:
            self.n = 1
        }
    }
    
    var body: some View {            Image("dice_\(n)")
            .resizable()
            .scaledToFit()
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
