//
//  SpendingCategory.swift
//  BudgetApp
//
//  Created by Alexander on 12.06.15.
//  Copyright (c) 2015 Alexander Vorontsov. All rights reserved.
//

import Foundation
import CoreData

@objc(SpendingCategory)
class SpendingCategory: NSManagedObject {

    @NSManaged var spendingCategoryName: String
    @NSManaged var spendingCategoryID: NSNumber
    @NSManaged var toSpending: NSSet
    
    class func entity() -> NSEntityDescription {
        return NSEntityDescription.entityForName("SpendingCategory", inManagedObjectContext: CoreDataHelper.instance.context)!
    }

}
