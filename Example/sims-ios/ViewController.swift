//
//  ViewController.swift
//  sims-ios
//
//  Created by John Nilsen on 05/23/2016.
//  Copyright (c) 2016 John Nilsen. All rights reserved.
//

import UIKit
import Tapglue

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        Tapglue.createAndLoginUserWithUsername("pablo", andPassword: "supersecret") { (success:Bool, error:NSError!) in
            if success {
                print("logged in!")
            }
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

