//
//  CubeTime.swift
//  Cuber
//
//  Created by Bader Alawadh on 7/13/20.
//  Copyright © 2020 Bader Alawadh. All rights reserved.
//

import Foundation

struct CubeTime: Codable, Identifiable {
    var id : UUID?
    var time: String
    var date: String
    var algorithms: String
    var seconds: Double
    var minutes: Int
}
