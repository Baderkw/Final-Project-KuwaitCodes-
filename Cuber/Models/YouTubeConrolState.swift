//
//  YouTubeConrolState.swift
//  Cuber
//
//  Created by Bader Alawadh on 7/15/20.
//  Copyright © 2020 Bader Alawadh. All rights reserved.
//

import Foundation
// 1
enum playerCommandToExecute {
    case loadNewVideo
    case play
    case pause
    case forward
    case backward
    case stop
    case idle
}

// 2
class YouTubeControlState: ObservableObject {
  
    // 3
    @Published var videoID: String? // = "qRC4Vk6kisY"
    {
        // 4
        didSet {
            self.executeCommand = .loadNewVideo
        }
    }
    
    @Published var videoURL: String? // = "qRC4Vk6kisY"
    {
        // 4
        didSet {
            self.executeCommand = .loadNewVideo
        }
    }
  
    // 5
    @Published var videoState: playerCommandToExecute = .loadNewVideo
    
    // 6
    @Published var executeCommand: playerCommandToExecute = .idle
    
    // 7
    func playPauseButtonTapped() {
        if videoState == .play {
            pauseVideo()
        } else if videoState == .pause {
            playVideo()
        } else {
            print("Unknown player state, attempting playing")
            playVideo()
        }
    }
    
    // 8
    func playVideo() {
        executeCommand = .play
    }
    
    func pauseVideo() {
        executeCommand = .pause
    }
    
    func forward() {
        executeCommand = .forward
    }
    
    func backward() {
        executeCommand = .backward
    }
}
