//
//  Investment.swift
//  BudgetApp
//
//  Created by Alexander on 12.06.15.
//  Copyright (c) 2015 Alexander Vorontsov. All rights reserved.
//

import Foundation
import CoreData

@objc(Investment)
class Investment: NSManagedObject {

    @NSManaged var amount: NSDecimalNumber
    @NSManaged var investingDate: NSDate
    @NSManaged var investmentID: NSNumber
    @NSManaged var investmentIncome: InvestmentIncome
    
    class func entity() -> NSEntityDescription {
        return NSEntityDescription.entityForName("Investment", inManagedObjectContext: CoreDataHelper.instance.context)!
    }

}
