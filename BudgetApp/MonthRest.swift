//
//  MonthRest.swift
//  BudgetApp
//
//  Created by Alexander on 12.06.15.
//  Copyright (c) 2015 Alexander Vorontsov. All rights reserved.
//

import Foundation
import CoreData

@objc(MonthRest)
class MonthRest: NSManagedObject {

    @NSManaged var amount: NSDecimalNumber
    @NSManaged var monthRestID: NSNumber
    
    class func entity() -> NSEntityDescription {
        return NSEntityDescription.entityForName("MonthRest", inManagedObjectContext: CoreDataHelper.instance.context)!
    }

}
