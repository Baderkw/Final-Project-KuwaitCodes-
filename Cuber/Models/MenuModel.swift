//
//  MenuModel.swift
//  Cuber
//
//  Created by Bader Alawadh on 7/8/20.
//  Copyright © 2020 Bader Alawadh. All rights reserved.
//

import Foundation



struct MenuItem {
    var name: String
    var arName: String
    var imageName: String
    var id = UUID()
}

struct Menuitems{
    var items = [
                MenuItem(name: "Home", arName: "الصفحة الرئيسية", imageName: "house.fill"),
                MenuItem(name: "Timer", arName: "المؤقت", imageName: "stopwatch.fill"),
                MenuItem(name: "Upcoming", arName: "المسابقات القادمة", imageName: "calendar")
                ]
}
