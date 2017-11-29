//
//  LoveViewController.swift
//  fc_práctica3
//
//  Created by Carlos Villa on 26/10/2017.
//  Copyright © 2017 Carlos Fernando. All rights reserved.
//

import UIKit

class LoveViewController: UIViewController {

    
    var date: Date?
    @IBOutlet weak var lovePicker: UIDatePicker!
    override func viewDidLoad() {
        super.viewDidLoad()
        let def = UserDefaults.standard
        if let birthDate = def.object(forKey: "loveDate") as? Date{
            lovePicker.date = birthDate
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(true)
        let def = UserDefaults.standard
        def.set(lovePicker.date, forKey: "loveDate")
        def.synchronize()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "exit"{
            if let birthDate = date {
                if birthDate > lovePicker.date{
                   let alertController = UIAlertController(title: "Fecha incorrecta", message: "No puedes enamorarte antes de nacer", preferredStyle: UIAlertControllerStyle.alert)
                    alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                    self.present(alertController, animated: true)
                    return false
                }
            }
            
        }
        return true
    }
    


       
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
