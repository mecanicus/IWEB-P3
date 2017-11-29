//
//  ViewController.swift
//  fc_práctica3
//
//  Created by Carlos Villa on 26/10/2017.
//  Copyright © 2017 Carlos Fernando. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var texto: UILabel!
    @IBOutlet weak var segundo: UILabel!
    var timer = Timer()
    var tiempo = 0
    var deathDate: Date = Date()
    //var birth: Date?
    //var love: Date?
    override func viewDidLoad() {
        super.viewDidLoad()
        let def = UserDefaults.standard
        if let dd = def.object(forKey: "deathDate") as? Date{
            deathDate = dd
            let calendar = Calendar.current
            let year = calendar.component(.year, from: deathDate)
            let month = calendar.component(.month, from: deathDate)
            let day = calendar.component(.day, from: deathDate)
            
            texto.text = "Morirás el \(day)/\(month)/\(year)"
            
            tiempo = Int(deathDate.timeIntervalSinceNow)
            var seconds = Int(tiempo)
            var aux:Int = seconds%86400
            let dias:Int = (seconds - aux)/86400
            seconds = aux
            aux = seconds%3600
            let horas:Int = (seconds - aux)/3600
            seconds = aux
            aux = seconds%60
            let minutos:Int = (seconds - aux)/60
            seconds = aux
            
            
            segundo.text = "Te quedan \(dias) dias, \(horas) horas, \(minutos) minutos, \(seconds) segundos."
            
            runTimer();
        
        }
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        let def = UserDefaults.standard
        def.set(deathDate, forKey: "deathDate")
        def.synchronize()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        timer.invalidate()
    }
    
    func runTimer() {
        if tiempo <= 0{
            timer.invalidate()
            segundo.text = "¡¡¡¡HAS MUERTO!!!!"
        }else{
            timer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(ViewController.updateTimer)), userInfo: nil, repeats: true)
        }
        
    }
    
    @objc func updateTimer() {
        tiempo -= 1
        var seconds = Int(tiempo)
        var aux:Int = seconds%86400
        let dias:Int = (seconds - aux)/86400
        seconds = aux
        aux = seconds%3600
        let horas:Int = (seconds - aux)/3600
        seconds = aux
        aux = seconds%60
        let minutos:Int = (seconds - aux)/60
        seconds = aux
        
        
        segundo.text = "Te quedan \(dias) dias, \(horas) horas, \(minutos) minutos, \(seconds) segundos."
        
    }

    @IBAction func exit(_ segue: UIStoryboardSegue){
        guard let loverVC = segue.source as? LoveViewController else{
            return
        }
        let birth = loverVC.date!
        let love = loverVC.lovePicker.date
    
        deathDate = birth + 2*love.timeIntervalSince(birth)
        let calendar = Calendar.current
        let year = calendar.component(.year, from: deathDate)
        let month = calendar.component(.month, from: deathDate)
        let day = calendar.component(.day, from: deathDate)
        
        texto.text = "Morirás el \(day)/\(month)/\(year)"
        
        tiempo = Int(deathDate.timeIntervalSinceNow)
        var seconds = Int(tiempo)
        var aux:Int = seconds%86400
        let dias:Int = (seconds - aux)/86400
        seconds = aux
        aux = seconds%3600
        let horas:Int = (seconds - aux)/3600
        seconds = aux
        aux = seconds%60
        let minutos:Int = (seconds - aux)/60
        seconds = aux
        
        
        segundo.text = "Te quedan \(dias) dias, \(horas) horas, \(minutos) minutos, \(seconds) segundos."
        
        runTimer();
        
    }

}

