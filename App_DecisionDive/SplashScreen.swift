//
//  SplashScreen.swift
//  DecisionDive App
//
//  Created by SHUAA on 24-12-2023.
//

import SwiftUI
import AVKit

struct VideoSplashView: UIViewControllerRepresentable {
    let videoURL: URL

    func makeUIViewController(context: Context) -> UIViewController {
        let player = AVPlayer(url: videoURL)
        let playerViewController = AVPlayerViewController()
        playerViewController.player = player
        playerViewController.showsPlaybackControls = false // Hide video controls

        let viewController = UIViewController()
        viewController.addChild(playerViewController)
        viewController.view.addSubview(playerViewController.view)
//        playerViewController.view.frame = viewController.view.frame

//         Make sure the video is presented full screen
        playerViewController.videoGravity = .resizeAspectFill
        player.play()

        return viewController
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        
    }
}
struct SplashScreen: View {
    @State var isActive: Bool = false
    @State private var  scale:CGFloat = 6
    @Environment(\.colorScheme) var colorScheme
    @State private var idDone = false
    @State private var timer: Timer?
    var body: some View {
        ZStack{
         
        Group {
            if colorScheme == .dark {
                VideoSplashView(videoURL: Bundle.main.url(forResource: "DarkVid", withExtension: "mp4")!)
                    .onAppear {
                        delayShowBar()
                    }.edgesIgnoringSafeArea(.all)
                    .fullScreenCover(isPresented: $idDone, content: {
                        ContentView()
                    })
                
                
                
            } else {
                VideoSplashView(videoURL: Bundle.main.url(forResource: "VID", withExtension: "mp4")!)
                    .onAppear {
                        delayShowBar()//
                        
                    }.edgesIgnoringSafeArea(.all)
                    .fullScreenCover(isPresented: $idDone, content: {
                        ContentView()
                    })
            }
        }
            Image(systemName: "heart.fill")
                .foregroundColor(.red)
                .padding(.top,678)
                .padding(.leading,270)
    }
}
    func delayShowBar() {
        timer = Timer.scheduledTimer(withTimeInterval: 4, repeats: false) { _ in
            //idDone = true
        }
    }
}


#Preview {
    SplashScreen()
}
