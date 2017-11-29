//
//  BirthViewController.swift
//  fc_práctica3
//
//  Created by Carlos Villa on 26/10/2017.
//  Copyright © 2017 Carlos Fernando. All rights reserved.
//

import UIKit

class BirthViewController: UIViewController {

    @IBOutlet weak var birthPicker: UIDatePicker!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let def = UserDefaults.standard
        if let birthDate = def.object(forKey: "birthDate") as? Date{
            birthPicker.date = birthDate
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(true)
        let def = UserDefaults.standard
        def.set(birthPicker.date, forKey: "birthDate")
       
        def.synchronize()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "Birth to love"{
            if let loveDestination = segue.destination as? LoveViewController{
                loveDestination.date = birthPicker.date
            }
            
        }
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "Birth to love"{
            if birthPicker.date > Date(){
                let alertController = UIAlertController(title: "Fecha incorrecta", message: "No puedes haber nacido en el futuro", preferredStyle: UIAlertControllerStyle.alert)
                alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                self.present(alertController, animated: true)
                return false
            }
        }
        return true
    }
    
    @IBAction func goToLove(_ sender: UISwipeGestureRecognizer) {
        if birthPicker.date >= Date() {
    let alertController = UIAlertController(title: "Fecha incorrecta", message: "No puedes haber nacido en el futuro", preferredStyle: UIAlertControllerStyle.alert)
    alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
    self.present(alertController, animated: true)
    }
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
