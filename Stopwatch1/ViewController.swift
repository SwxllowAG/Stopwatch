//
//  ViewController.swift
//  Stopwatch1
//
//  Created by Galym Anuarbek on 6/14/17.
//  Copyright © 2017 Galym Anuarbek. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var timer: Timer?
//    var lap = 0
    var currentTime = 1
    var currentTime1 = 1
    
    var anArray:[String] = []
    
    @IBOutlet weak var timeDisplay: UILabel!
    @IBOutlet weak var timeDisplay1: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var myTableView: UITableView!{
        didSet {
            myTableView.dataSource = self as UITableViewDataSource
        }
    }
 
    @IBAction func stopButton(_ sender: Any) {
        if timer != nil {
            startButton.setTitle("Start", for: .normal)
            currentTime = 0
            currentTime1 = 0
            timer?.invalidate()
            timer = nil
        } else{
            startButton.setTitle("Stop", for: .normal)
            timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { _ in
                self.currentTime += 1
                self.currentTime1 += 1
                let minutesPorion = String(format:"%02d", self.currentTime / 360000)
                let secondsPorion = String(format:"%02d", self.currentTime / 100 % 60)
                let millisPorion = String(format:"%02d", self.currentTime % 100)
                self.timeDisplay.text = "\(minutesPorion):\(secondsPorion):\(millisPorion)"
                
                let minutesPorion1 = String(format:"%02d", self.currentTime1 / 360000)
                let secondsPorion1 = String(format:"%02d", self.currentTime1 / 100 % 60)
                let millisPorion1 = String(format:"%02d", self.currentTime1 % 100)
                self.timeDisplay1.text = "\(minutesPorion1):\(secondsPorion1):\(millisPorion1)"
            }
        }
    }
    

    @IBAction func lapButton(_ sender: Any) {
        currentTime1 = 0
        anArray.append("\(currentTime / 360000):\(currentTime / 100 % 60):\(currentTime % 100)")
        print(anArray)
        myTableView.reloadData()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return anArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text = anArray[indexPath.row]
        return (cell)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

