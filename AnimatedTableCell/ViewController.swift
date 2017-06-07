//
//  ViewController.swift
//  AnimatedTableCell
//
//  Created by Rahul Gupta on 6/7/17.
//  Copyright © 2017 Rahul Gupta. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tblAnimated: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblAnimated.delegate = self
        tblAnimated.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 55
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     
        let cell = tblAnimated.dequeueReusableCell(withIdentifier: "cellAnimated")
        return cell!
        
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.layer.transform = CATransform3DMakeScale(2,0.1,1)
        UIView.animate(withDuration: 0.3, animations: {
            cell.layer.transform = CATransform3DMakeScale(1.05,1.05,1)
        },completion: { finished in
            UIView.animate(withDuration: 0.5, animations: {
                cell.layer.transform = CATransform3DMakeScale(1,1,1)
                
            })
        })
    }
    
}

