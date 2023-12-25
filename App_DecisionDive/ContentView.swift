//
//  ContentView.swift
//  test
//
//  Created by Noura Alqahtani on 17/12/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
        ZStack {
         Color("DarkModeColor")
            .ignoresSafeArea()
                VStack {
                    HStack{
                            Image("imageTop")
                            .resizable()
                                .frame(width: 60,height: 60)
                        Image("textTop")
                        .resizable()
                            .frame(width: 250,height: 30)
                        } //hstack for hello
                        .padding(.trailing,60)
                        .padding(.top,70)
                        .padding(.bottom,50)

                        VStack{

                           Spacer()
                            
                            Text("StartYourJourney1")
                                .font(.system(size: 25, weight: .bold))
                                .padding(.trailing,150)
                                .padding(.bottom,30)
                                
//                                .padding(.top,15)
                            HStack(spacing:10){
                                VStack(spacing:15){
                                    
                                    NavigationLink( destination: ContentViewDiscoverSelf()){
                                        ZStack{
                                            
                                            Rectangle()
                                                .foregroundColor(.clear)
                                                .frame(width: 180, height: 200)
                                                .background(
                                                    LinearGradient(
                                                        stops: [
                                                            Gradient.Stop(color: Color(red: 1, green: 0.82, blue: 0.62), location: 0.00),
                                                            Gradient.Stop(color: Color(red: 1, green: 0.62, blue: 0.18), location: 1.00),
                                                        ],
                                                        startPoint: UnitPoint(x: 0, y: 0),
                                                        endPoint: UnitPoint(x: 1, y: 1.03)
                                                    )
                                                )
                                                .cornerRadius(15)
                                                .shadow(color: Color(red: 0.55, green: 0.55, blue: 0.55).opacity(0.1), radius: 12.5, x: 0, y: 4)
                                            
                                            Text("DiscoverYourSelf1")
                                                .font(
                                                    Font.custom("SF Pro Rounded", size: 25)
                                                        .weight(.bold)
                                                )
                                            // .multilineTextAlignment(.center)
                                                .foregroundColor(.white)
                                                .frame(width: 116, height: 80, alignment: .center)
                                        }//zstack right box
                                    }//.padding(.bottom,45)
                                    
                                    //navigate right box
                                    
                                    NavigationLink( destination: ContentViewDestination()){
                                        ZStack{
                                            
                                            Rectangle()
                                                .foregroundColor(.clear)
                                                .frame(width: 180, height: 250)
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
                                                .cornerRadius(15)
                                                .shadow(color: Color(red: 0.55, green: 0.55, blue: 0.55).opacity(0.1), radius: 12.5, x: 0, y: 4)
                                            
                                            Text("FindYourDestination1")
                                                .font(
                                                    Font.custom("SF Pro Rounded", size: 25)
                                                    //.weight(.bold)
                                                )
                                            //.multilineTextAlignment(.center)
                                                .foregroundColor(.white)
                                            
                                                .frame(width: 110, height: 80, alignment: .center)
                                            
                                        }//zstack right box
                                        
                                    }
                                }.padding(.bottom,50)
                                
                                VStack(spacing:15){
                                    NavigationLink( destination: ContentViewSport()){
                                        
                                        
                                        ZStack{
                                            
                                            Rectangle()
                                                .foregroundColor(.clear)
                                                .frame(width: 180, height: 250)
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
                                                .cornerRadius(15)
                                                .shadow(color: Color(red: 0.55, green: 0.55, blue: 0.55).opacity(0.1), radius: 12.5, x: 0, y: 4)
                                            
                                            Text("FindYourSport1")
                                                .font(
                                                    Font.custom("SF Pro Rounded", size: 25)
                                                    //.weight(.bold)
                                                )
                                            //.multilineTextAlignment(.center)
                                                .foregroundColor(.white)
                                            
                                                .frame(width: 110, height: 80, alignment: .center)
                                            
                                        }//zstack left box
                                        
                                    }//navigate left box
                                    
                                    NavigationLink( destination: ContentViewYourPath()){
                                        
                                        ZStack{
                                            
                                            Rectangle()
                                                .foregroundColor(.clear)
                                                .frame(width: 180, height: 200)
                                                .background(
                                                    LinearGradient(
                                                        stops: [
                                                            Gradient.Stop(color: Color(red: 0.76, green: 0.69, blue: 1), location: 0.00),
                                                            Gradient.Stop(color: Color(red: 0.56, green: 0.44, blue: 0.96), location: 1.00),
                                                        ],
                                                        startPoint: UnitPoint(x: 0.5, y: 0),
                                                        endPoint: UnitPoint(x: 0.5, y: 1)
                                                    )
                                                )
                                                .cornerRadius(15)
                                                .shadow(color: Color(red: 0.55, green: 0.55, blue: 0.55).opacity(0.1), radius: 12.5, x: 0, y: 4)
                                            
                                            
                                            
                                            Text("FindYourPath1")
                                                .font(
                                                    Font.custom("SF Pro Rounded", size: 25)
                                                        .weight(.bold)
                                                )
                                            // .multilineTextAlignment(.center)
                                                .foregroundColor(.white)
                                                .frame(width: 116, height: 80, alignment: .center)
                                        }//zstack left box
                                        
                                    }
                                }.padding(.bottom,50)
                                
                                
                            }//first row of boxes
                            VStack{
                                Text("Note:advicesprovidedaregeneraladvices1")
                                Text("forassistancepurposesonly!1")
                            } .multilineTextAlignment(.center)
                                .foregroundColor(.gray)
                                .padding(.bottom,40)
                            .font(
                                Font.custom("SF Pro Rounded", size: 15))
                        }//vstack for the boxes

                }
               
                
            }
        }
       
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }}
