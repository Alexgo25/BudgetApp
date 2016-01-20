//
//  Spending.swift
//  BudgetApp
//
//  Created by Alexander on 12.06.15.
//  Copyright (c) 2015 Alexander Vorontsov. All rights reserved.
//

import Foundation
import CoreData

@objc(Spending)
class Spending: NSManagedObject {

    @NSManaged var date: NSDate
    @NSManaged var amount: NSDecimalNumber
    @NSManaged var spendingID: NSNumber
    @NSManaged var spendingCategory: SpendingCategory
    
    class func entity() -> NSEntityDescription {
        return NSEntityDescription.entityForName("Spending", inManagedObjectContext: CoreDataHelper.instance.context)!
    }

}
