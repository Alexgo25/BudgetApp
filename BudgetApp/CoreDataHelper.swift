//
//  CoreDataHelper.swift
//  BudgetApp
//
//  Created by Alexander on 04.06.15.
//  Copyright (c) 2015 Alexander Vorontsov. All rights reserved.
//

import Foundation
import CoreData

class CoreDataHelper : NSObject {
    //singleton
    class var instance: CoreDataHelper {
        struct Singleton {
            static let instance = CoreDataHelper()
        }
        return Singleton.instance
    }
    
    let coordinator: NSPersistentStoreCoordinator
    let model: NSManagedObjectModel
    let context: NSManagedObjectContext
    
    private override init() {
        let modelURL = NSBundle.mainBundle()
            .URLForResource("BudgetApp",
                withExtension: "momd")!
        model = NSManagedObjectModel(
            contentsOfURL: modelURL)!
        
        let fileManager = NSFileManager.defaultManager()
        let docsURL = fileManager.URLsForDirectory(
            .DocumentDirectory, inDomains: .UserDomainMask).last!
        let storeURL = docsURL
            .URLByAppendingPathComponent("base.sqlite")
        
        coordinator = NSPersistentStoreCoordinator(
            managedObjectModel: model)
        
        let store = try? coordinator.addPersistentStoreWithType(
            NSSQLiteStoreType, configuration: nil,
            URL: storeURL, options: nil)
        if store == nil {
            abort()
        }
        
        context = NSManagedObjectContext()
        context.persistentStoreCoordinator = coordinator
        super.init()
    }
    
    func save() {
        var error: NSError?
        do {
            try context.save()
        } catch let error1 as NSError {
            error = error1
        }
        if let error = error {  //if error != nil
            print(error.localizedDescription)
        }
    }
    
    //adding income and investment categories if not exist
    
    func addIncomeCategory(id : Int,named : String) {
        
        let newIncomeCategory  = NSEntityDescription.insertNewObjectForEntityForName("IncomeCategory", inManagedObjectContext: context) as! IncomeCategory
        (newIncomeCategory.incomeCategoryID , newIncomeCategory.incomeCategoryName) = (id , named )
        var savingError : NSError?
        do {
            try context.save()
            print("Success!")
        } catch let error1 as NSError {
            savingError = error1
            if let error = savingError{ print("Failed to create income category")}
        }
        
    }
    func addSpendingCategory(id : Int,named : String) {
        let newSpendingCategory  = NSEntityDescription.insertNewObjectForEntityForName("SpendingCategory", inManagedObjectContext: context) as! SpendingCategory
        (newSpendingCategory.spendingCategoryID , newSpendingCategory.spendingCategoryName) = (id , named )
        var savingError : NSError?
        do {
            try context.save()
            print("Success!")
        } catch let error1 as NSError {
            savingError = error1
            if let error = savingError{ print("Failed to create income category")}
        }

    }
    
    func addInvestmentCategories() {
        
    }
    
    func addIncome(id : Int , amount : Double, category : Int ) {
        let newIncome = NSEntityDescription.insertNewObjectForEntityForName("Income", inManagedObjectContext: context) as! Income
        (newIncome.incomeID ,newIncome.amount) = (id,NSDecimalNumber(double: amount))
        newIncome.date = NSDate()
        newIncome.incomeCategory = returnIncomeCategories()[category]
        returnIncomeCategories()[category].toIncome.setByAddingObject(newIncome)
        
        var savingError : NSError?
        do {
            try context.save()
            print("Success!")
        } catch let error1 as NSError {
            savingError = error1
            if let error = savingError{ print("Failed to create income")}
        }

    }
    
    func addSpending(id : Int , amount : Double, category : Int ) {
        let newItem = NSEntityDescription.insertNewObjectForEntityForName("Spending", inManagedObjectContext: context) as! Spending
        (newItem.spendingID ,newItem.amount) = (id,NSDecimalNumber(double: amount))
        newItem.date = NSDate()
        newItem.spendingCategory = returnSpendingCategories()[category]
        returnSpendingCategories()[category].toSpending.setByAddingObject(newItem)
        var savingError : NSError?
        do {
            try context.save()
            print("Success!")
        } catch let error1 as NSError {
            savingError = error1
            if let error = savingError{ print("Failed to create spending")}
        }
        
    }

    
    //NSFetchRequests 
    
    func returnIncomeCategories() ->[IncomeCategory!] {
        let request = NSFetchRequest(entityName: "IncomeCategory")
        request.returnsObjectsAsFaults = true
        var error : NSError?
        let result = (try! context.executeFetchRequest(request)) as! [IncomeCategory!]
        return result
    }
    func returnIncome() ->[Income!] {
        let request = NSFetchRequest(entityName: "Income")
        request.returnsObjectsAsFaults = true
        var error : NSError?
        let result = (try! context.executeFetchRequest(request)) as! [Income!]
        return result
    }
    func returnSpendings() ->[Spending!] {
        let request = NSFetchRequest(entityName: "Spending")
        request.fetchLimit = 20
        request.returnsObjectsAsFaults = true
        var error : NSError?
        let result = (try! context.executeFetchRequest(request)) as! [Spending!]
        return result
    }
    func returnSpendingCategories() ->[SpendingCategory!] {
        let request = NSFetchRequest(entityName: "SpendingCategory")
        request.fetchLimit = 20
        request.returnsObjectsAsFaults = true
        var error : NSError?
        let result = (try! context.executeFetchRequest(request)) as! [SpendingCategory!]
        return result
    }
    
    //Delete all entities (testing only)
    func deleteAllIncome()
    {
        let income = returnIncome()
        for object in income {
            context.deleteObject(object)
        }
    }
    func deleteAllSpendings()
    {
        let spendings = returnSpendings()
        for object in spendings {
            context.deleteObject(object)
        }
    }
    func deleteAllIncomeCategories()
    {
        let ics = returnIncomeCategories()
        for object in ics {
            context.deleteObject(object)
        }
    }
    func deleteAllSpendingCategories()
    {
        let scs = returnSpendingCategories()
        for object in scs{
            context.deleteObject(object)
        }
    }
    

}
