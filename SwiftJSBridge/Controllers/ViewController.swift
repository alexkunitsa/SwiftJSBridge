//
//  ViewController.swift
//  SwiftJSBridge
//
//  Created by Alex Kunitsa on 8/5/15.
//  Copyright (c) 2015 Alex Kunitsa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    // MARK: - Lefecycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    // MARK: - User actions

    @IBAction func callJSAction() {
        let jsWrapper = JSWrapper()
    }
}

