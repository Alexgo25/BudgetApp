//
//  SpendingsViewController.swift
//  BudgetApp
//
//  Created by Alexander on 05.06.15.
//  Copyright (c) 2015 Alexander Vorontsov. All rights reserved.
//

import UIKit

class SpendingsViewController: UIViewController,UITableViewDelegate , UITableViewDataSource {
    
    @IBOutlet  var tableView : UITableView?
    var spendingsSet = CoreDataHelper.instance.returnSpendings()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return spendingsSet.count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 44
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("SpendingTableViewCell") as! SpendingTableViewCell
        let name : String = "Spending №\(spendingsSet[indexPath.row].spendingID)"
        let amount : String = spendingsSet[indexPath.row].amount.stringValue
        cell.nameLabel!.text = name
        cell.amountLabel!.text = amount
        
        return cell
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
