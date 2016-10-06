//
//  ViewController.swift
//  HellaCells
//
//  Created by Flatiron School on 8/8/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var numbersTableView: UITableView!
    
    var numbersArray: [Int] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for i in 1...100 {
            numbersArray.append(i)
        }
        print (numbersArray)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numbersArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "numCell", for: indexPath)
        cell.textLabel?.text = String(numbersArray[indexPath.row])
        //cell.backgroundColor = UIColor.blue
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showNumber" {
            let destination = segue.destination as? HellaDetailViewController
            let indexPath = self.numbersTableView.indexPathForSelectedRow
            
            destination?.numberAsString = String(numbersArray[(indexPath?.row)!])
        }
    }
    


}

