//
//  ICViewController.swift
//  BudgetApp
//
//  Created by Alexander on 13.06.15.
//  Copyright (c) 2015 Alexander Vorontsov. All rights reserved.
//

import UIKit

class ICViewController: UIViewController, UITableViewDataSource , UITableViewDelegate {
    
    
    @IBOutlet var tableview : UITableView?
    var ICset = CoreDataHelper.instance.returnIncomeCategories()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCellWithIdentifier("ICCell") as! ICTableViewCell
        cell.name?.text = ICset[indexPath.row].incomeCategoryName
        var sum : Int32 = 0
        var arr : [Income] = ICset[indexPath.row].toIncome.allObjects as! [Income]
        for (var i = 0; i < ICset[indexPath.row].toIncome.count ; i++)
        {
            sum += arr[i].amount.intValue
        }
        cell.sumlabel?.text = String(sum)
        
        return cell
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 44
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ICset.count
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
