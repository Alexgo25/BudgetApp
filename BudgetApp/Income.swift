//
//  Income.swift
//  BudgetApp
//
//  Created by Alexander on 12.06.15.
//  Copyright (c) 2015 Alexander Vorontsov. All rights reserved.
//

import Foundation
import CoreData

@objc(Income)
class Income: NSManagedObject {

    @NSManaged var date: NSDate
    @NSManaged var amount: NSDecimalNumber
    @NSManaged var incomeID: NSNumber
    @NSManaged var incomeCategory: IncomeCategory
    
    class func entity() -> NSEntityDescription {
        return NSEntityDescription.entityForName("Income", inManagedObjectContext: CoreDataHelper.instance.context)!
    }

}
