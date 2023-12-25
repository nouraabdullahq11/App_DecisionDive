//
//  SportView.swift
//  test
//
//  Created by SHUAA on 19-12-2023.
//

import SwiftUI

struct SportView: View {
        @State private var isFlipped = false

        var frontContent: String
        var backContent: String
        var body: some View {
            VStack {
                if isFlipped {
                    VStack {
                        Image(systemName: "repeat")
                            .padding(.init(top: 20, leading: 200, bottom: 150, trailing: 20))
                            .frame(width: 28, height: 28)
                        Text(backContent)
                            .rotation3DEffect(
                                .degrees(180.0),
                                axis: (x: 0.0, y: 1.0, z: 0.0))
                            .font(
                                Font.custom("SF Pro Rounded", size: 36)
                                    .weight(.bold))
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color(red: 0.16, green: 0.18, blue: 0.2))
                    }
                    .frame(width: 270, height: 288)
                    .background(
                        LinearGradient(
                            stops: [
                                Gradient.Stop(color: Color(red: 0.66, green: 1, blue: 0.92), location: 0.00),
                                Gradient.Stop(color: Color(red: 0, green: 0.7, blue: 0.53), location: 1.00),
                            ],
                            startPoint: UnitPoint(x: 0, y: 0),
                            endPoint: UnitPoint(x: 1, y: 1.03)
                        )
                    )
                    .shadow(color: Color(red: 0.55, green: 0.55, blue: 0.55).opacity(0.1), radius: 12.5, x: 0, y: 4)
                    .cornerRadius(20) // Adjust the corner radius as needed
                } else {
                    VStack{
                        Image(systemName: "repeat")
                            .padding(.init(top: 80, leading: 200, bottom: 150, trailing: 20))
                            .frame(width: 28, height: 28)
                        Text(frontContent)
                            .multilineTextAlignment(.center)
                    }
                    .frame(width: 270, height: 288)
                    .background(Color("DarkModeColor"))
                    .cornerRadius(40)
                    .shadow(color: Color(red: 0.32, green: 0.34, blue: 0.38).opacity(0.32), radius: 71.99999, x: 0, y: 34)
                    .overlay(
                        RoundedRectangle(cornerRadius: 40)
                            .inset(by: 2.5)
                            .stroke(Color(red: 0.66, green: 1, blue: 0.92), lineWidth: 5))
                }
            }
            .rotation3DEffect(
                .degrees(isFlipped ? 180: 0),
                axis: (x: 0.0, y: 1.0, z: 0.0))
            .onTapGesture {
                withAnimation(.easeInOut(duration: 1)) {
                    isFlipped.toggle()
                }
            }
        }
    }
    struct ContentViewSport: View {
        
        let frontContents = [NSLocalizedString("Team sports, Outdoor activities1", comment: ""), NSLocalizedString("Moderate activity with occasional challenges, Mix of team and solo activities, Mix of indoor and outdoor activities, high budget1",comment:""), NSLocalizedString("Low-intensity and relaxed, Solo sports, Indoor1",comment:"")]
        let backContents = [NSLocalizedString("Soccer1", comment: ""), NSLocalizedString("Tennis, Swimming1",comment:""), NSLocalizedString("Yoga, Table Tennis1",comment:"")]
        
        let whidth : CGFloat = 0
        let hejght : CGFloat = 0
        @State private var currentIndex: Int = 0
        @GestureState private var dragOffse:CGFloat = 0
        var body: some View {
            ZStack{
                Color("DarkModeColor")
                    .ignoresSafeArea()
            VStack{
                Text("FindYourSport1")
                    .padding(.bottom,149)
                    .multilineTextAlignment(.center)
                    .padding()
                ZStack{
                    ForEach(0..<min(frontContents.count, backContents.count)) { index in
                        VStack{
                            SportView(frontContent: frontContents[index], backContent: backContents[index])
                                .frame(width: 200, height: 300)
                        }
                        .frame(width: 270, height: 288)
                        .opacity(currentIndex == index ? 1.0:0.5)
                        .scaleEffect(currentIndex == index - 3 ? 0.1 : 1.0)
                        .offset(x:CGFloat(index - currentIndex)*295+dragOffse,y:0)
                    }}
                .gesture(
                    DragGesture()
                        .onEnded({value in
                            let threshold:CGFloat = 50
                            if value.translation.width>threshold{
                                withAnimation {
                                    currentIndex = max(0,currentIndex-1)
                                }
                            }else if value.translation.width < -threshold{
                                withAnimation{
                                    currentIndex = min(frontContents.count, currentIndex + 1)
                                }
                            }
                        }))
            }
        }
        }
    }

#Preview {
    ContentViewSport()
}
