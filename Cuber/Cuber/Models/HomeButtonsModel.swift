//
//  HomeButtonsModel.swift
//  Cuber
//
//  Created by Bader Alawadh on 7/8/20.
//  Copyright © 2020 Bader Alawadh. All rights reserved.
//

import Foundation

struct HomeItem {
    var name: String
    var text: String
    var backColor: (red: Double, green: Double, blue: Double)
    var id = UUID()
}

struct HomeItems{
    let items = [
        HomeItem(name: "F2L",text: "F2L Algorithms", backColor: (red: 47 / 255, green: 48 / 255, blue: 140 / 255)),
                HomeItem(name: "OLL",text: "OLL Algorithms", backColor: (red: 252 / 255,green: 239 / 255,blue: 1 / 255)),
                HomeItem(name: "PLL",text: "PLL Algorithms", backColor: (red: 234 / 255,green: 26 / 255,blue: 34 / 255))
                ]
}
