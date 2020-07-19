//
//  TimerSettingsCD+CoreDataProperties.swift
//  Cuber
//
//  Created by Bader Alawadh on 7/12/20.
//  Copyright © 2020 Bader Alawadh. All rights reserved.
//
//

import Foundation
import CoreData
import UIKit

extension TimerSettingsCD {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TimerSettingsCD> {
        return NSFetchRequest<TimerSettingsCD>(entityName: "TimerSettingsCD")
    }

    @NSManaged public var backgroundColor: UIColor?
    @NSManaged public var inspection: Double

}
