//
//  SwiftUIView.swift
//  test
//
//  Created by Noura Alqahtani on 17/12/2023.
//

import SwiftUI

struct DestinationView: View {
    @State private var isFlipped = false

    var frontContent: String
    var backContent: String
    var body: some View {
        VStack {
            if isFlipped {
                VStack {
                    Image(systemName: "repeat")
                        .padding(.init(top: 50, leading: 0, bottom: 0, trailing: 200))
                        .frame(width: 28, height: 28)
                        .foregroundColor(.black)

                       
//                        .font(
//                            Font.custom("SF Pro Rounded", size: 36)
//                                .weight(.bold))
                    GeometryReader { geometry in
                        Text(backContent)
                            .rotation3DEffect(
                                .degrees(180.0),
                                axis: (x: 0.0, y: 1.0, z: 0.0))
                                                   .font(.title)
                                                   .frame(width: geometry.size.width - 10, height: geometry.size.height - 20)
                                           }
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color(red: 0.16, green: 0.18, blue: 0.2))
                }
                .frame(width: 270, height: 288)
                .background(
                    LinearGradient(
                        stops: [
                            Gradient.Stop(color: Color(red: 0.7, green: 0.93, blue: 1), location: 0.00),
                            Gradient.Stop(color: Color(red: 0.16, green: 0.73, blue: 0.89), location: 1.00),
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
                        .padding(.init(top: 40, leading: 200, bottom: 0, trailing: 0))
                        .frame(width: 28, height: 28)
                    GeometryReader { geometry in
                        Text(frontContent)
                            
                                                   .font(.title)
                                                   .frame(width: geometry.size.width - 10, height: geometry.size.height - 20)
                                           }
                        .multilineTextAlignment(.center)
                        
                }
                .frame(width: 270, height: 288)
                .background(Color("DarkModeColor"))
                .cornerRadius(40)
                .shadow(color: Color(red: 0.32, green: 0.34, blue: 0.38).opacity(0.32), radius: 71.99999, x: 0, y: 34)
                .overlay(
                    RoundedRectangle(cornerRadius: 40)
                        .inset(by: 2.5)
                        .stroke( Color(red: 0.7, green: 0.93, blue: 1), lineWidth: 5))
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
struct ContentViewDestination: View {
    
    let frontContents = [NSLocalizedString("Warm and tropical, relaxing on \n the beach, low budget:1", comment: ""), NSLocalizedString("Cold and snowy, engaging in outdoor adventures, high budget1",comment:""), NSLocalizedString("Extended stay, local food, with family or friends1",comment:"")]
    let backContents = [NSLocalizedString("Thailand1", comment: ""), NSLocalizedString("Switzerland1",comment:""), NSLocalizedString("Bali, Indonesia1",comment:"")]
    
    let whidth : CGFloat = 0
    let hejght : CGFloat = 0
    @State private var currentIndex: Int = 0
    @GestureState private var dragOffse:CGFloat = 0
    var body: some View {
        ZStack{
            Color("DarkModeColor")
                .ignoresSafeArea()
        VStack{
            Text("FindYourDestination1")
                .font(.system(size: 30, weight: .bold))
                .padding(.bottom, 100)
            
        
                // ... (existing code)

                ZStack {
                    ForEach(0..<min(frontContents.count, backContents.count)) { index in
                        VStack {
                            DestinationView(frontContent: frontContents[index], backContent: backContents[index])
                                .frame(width: 200, height: 300)
                        }
                        .frame(width: 270, height: 288)
                        .opacity(currentIndex == index ? 1.0 : 0.5)
                        .scaleEffect(currentIndex == index - 3 ? 0.1 : 1.0)
                        .offset(x: CGFloat(index - currentIndex) * 295 + dragOffse, y: 0)
                    }

                    // Page Indicator
                    HStack(spacing: 10) {
                        ForEach(0..<min(frontContents.count, backContents.count)) { index in
                            Circle()
                                .fill(Color(red: 0.16, green: 0.73, blue: 0.89))
                                .frame(width: 10, height: 10)
                                .opacity(currentIndex == index ? 1.0 : 0.5)
                        }
                    }
                    .padding(.top, 420)
                }
                .gesture(
                    DragGesture()
                        .onEnded({ value in
                            let threshold: CGFloat = 1
                            if value.translation.width > threshold {
                                withAnimation {
                                    currentIndex = max(0, currentIndex - 1)
                                }
                            } else if value.translation.width < -threshold {
                                withAnimation {
                                    currentIndex = min(frontContents.count - 1, currentIndex + 1)
                                }
                            }
                        })
                )
            

           
        }
    }
    }
}
#Preview {
    ContentViewDestination()
}

