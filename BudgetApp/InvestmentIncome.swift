//
//  InvestmentIncome.swift
//  BudgetApp
//
//  Created by Alexander on 12.06.15.
//  Copyright (c) 2015 Alexander Vorontsov. All rights reserved.
//

import Foundation
import CoreData

@objc(InvestmentIncome)
class InvestmentIncome: NSManagedObject {

    @NSManaged var amount: NSDecimalNumber
    @NSManaged var date: NSDate
    @NSManaged var invincomeID: NSNumber
    @NSManaged var investment: Investment
    
    class func entity() -> NSEntityDescription {
        return NSEntityDescription.entityForName("InvestmentIncome", inManagedObjectContext: CoreDataHelper.instance.context)!
    }

}
