//
//  IncomeCategory.swift
//  BudgetApp
//
//  Created by Alexander on 12.06.15.
//  Copyright (c) 2015 Alexander Vorontsov. All rights reserved.
//

import Foundation
import CoreData

@objc(IncomeCategory)
class IncomeCategory: NSManagedObject {

    @NSManaged var incomeCategoryName: String
    @NSManaged var incomeCategoryID: NSNumber
    @NSManaged var toIncome: NSSet
    
    class func entity() -> NSEntityDescription {
        return NSEntityDescription.entityForName("IncomeCategory", inManagedObjectContext: CoreDataHelper.instance.context)!
    }

}
