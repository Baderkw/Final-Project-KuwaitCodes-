//
//  PLL.swift
//  Cuber
//
//  Created by Bader Alawadh on 7/15/20.
//  Copyright © 2020 Bader Alawadh. All rights reserved.
//

import Foundation
struct PLL: Codable {
    var name: String
    var algorithm: String
    
    func imagePath() -> String {
        return "PLL/\(self.name).png"
    }
}
