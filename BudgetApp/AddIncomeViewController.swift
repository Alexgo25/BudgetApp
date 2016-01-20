//
//  AddIncomeViewController.swift
//  
//
//  Created by Alexander on 04.06.15.
//
//

import UIKit

class AddIncomeViewController: UIViewController,  UIPickerViewDataSource , UIPickerViewDelegate , UITextFieldDelegate{
    
    @IBOutlet var amountField : UITextField?
    @IBOutlet var picker : UIPickerView?
    
    var controller : UIAlertController?
    var incomeCategories : [IncomeCategory!]?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        incomeCategories = CoreDataHelper.instance.returnIncomeCategories()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func saveDetail()
    {
        var incomes = CoreDataHelper.instance.returnIncome()
        let id = incomes.count + 1
        var amount = (amountField!.text! as NSString).doubleValue
        if (amount > 0) {
            CoreDataHelper.instance.addIncome(id, amount: amount , category : picker!.selectedRowInComponent(0))
        
        controller = UIAlertController(title: "Success!", message: "New Income added", preferredStyle: .Alert)
        let action = UIAlertAction(title: "Done", style: UIAlertActionStyle.Default, handler: {(paramAction:UIAlertAction) in print("Nem item added")})
        controller?.addAction(action)
        self.presentViewController(controller!, animated: true, completion: nil)
        }
        else  { print("error") }
    }
    
    
    //picker view implementation
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return incomeCategories!.count
    }
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return incomeCategories![row].incomeCategoryName
    }
    //text field return
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    
    
    //tapgesturerecognizer implementation
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        amountField?.resignFirstResponder()
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
