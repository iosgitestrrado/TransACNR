//
//  DemoVC.swift
//  TransACNR
//
//  Created by Monish M S on 19/07/18.
//  Copyright © 2018 Monish M S. All rights reserved.
//

import UIKit

class DemoVC: UIViewController {
    @IBOutlet weak var  ListHead: UILabel!
    var seguefromModel :MenuDisplayModel = MenuDisplayModel()
    override func viewDidLoad() {
        super.viewDidLoad()
       ListHead.text = seguefromModel.menu_Name
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func backNavigationAction(_ sender: Any) {
        
        _ = navigationController?.popViewController(animated: true)
        
        
    }

}
