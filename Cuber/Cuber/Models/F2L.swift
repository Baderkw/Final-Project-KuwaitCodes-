//
//  F2L.swift
//  Cuber
//
//  Created by Bader Alawadh on 7/14/20.
//  Copyright © 2020 Bader Alawadh. All rights reserved.
//

import Foundation
import UIKit

struct F2L: Codable {
    
    var algorithm: String
    
    func imagePath() -> String {
        return "F2L/\(self.algorithm).png"
    }
}
